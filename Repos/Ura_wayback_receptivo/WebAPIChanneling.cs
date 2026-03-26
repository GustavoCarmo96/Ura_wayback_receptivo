using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Xml.Linq;

namespace Ura_wayback_receptivo
{
    public class WebAPIChanneling
    {
        public class HTTPRequest
        {
            public string Method { get; set; } = Methods.GET;
            public string URL { get; set; }
            public Dictionary<string, string> Headers { get; set; }
            public JObject Body { get; set; }
            public string ContentType { get; set; } = ContentTypes.Json;

            public static class Methods
            {
                public static string GET => "GET";
                public static string POST => "POST";
                public static string PUT => "PUT";
                public static string DELETE => "DELETE";
            }
            public static class ContentTypes
            {
                public static string UrlEncoded => "application/x-www-form-urlencoded";
                public static string Json => "application/json";
            }
            public class Response
            {
                public string Method { get; set; }
                public string URL { get; set; }
                public JObject Body { get; set; }
                public bool Error { get; set; }
                public int StatusCode { get; set; }
                public string Status { get; set; }
                public JToken ResponseData { get; set; }
            }
            public Response SendRequest()
            {
                var response = new Response
                {
                    Method = Method,
                    URL = URL,
                    Body = Body
                };
                var resultRequest = "";
                try
                {
                    if (URL == null)
                    {
                        throw new Exception("ERROR: URL missing");
                    }
                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                    var httpWebRequest = (HttpWebRequest)WebRequest.Create(URL);
                    httpWebRequest.KeepAlive = false;
                    httpWebRequest.ContentType = ContentType;
                    httpWebRequest.Method = Method;
                    if (Headers != null && Headers.Count > 0)
                    {
                        foreach (var header in Headers)
                        {
                            httpWebRequest.Headers.Add(header.Key, header.Value);
                        }
                    }
                    if (Body != null)
                    {
                        if (ContentType == ContentTypes.Json)
                        {
                            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                            {
                                streamWriter.Write(Body);
                                streamWriter.Flush();
                                streamWriter.Close();
                            }
                        }
                        else
                        {
                            byte[] dataStream = Encoding.UTF8.GetBytes(JsonToQueryParams(Body));
                            httpWebRequest.ContentLength = dataStream.Length;
                            using (var streamWriter = httpWebRequest.GetRequestStream())
                            {
                                streamWriter.Write(dataStream, 0, dataStream.Length);
                            }
                        }
                    }
                    var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                    using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                    {
                        resultRequest = streamReader.ReadToEnd();
                    }
                    response.Error = false;
                    response.StatusCode = (int)httpResponse.StatusCode;
                    response.Status = httpResponse.StatusCode.ToString();
                }
                catch (WebException ex)
                {
                    response.Error = true;
                    using (WebResponse ExResponse = ex.Response)
                    {
                        HttpWebResponse httpResponse = (HttpWebResponse)ExResponse;
                        if (httpResponse != null)
                        {
                            using (Stream data = ExResponse.GetResponseStream())
                            using (var reader = new StreamReader(data))
                            {
                                string text = reader.ReadToEnd();
                                resultRequest = text;
                            }
                            response.StatusCode = (int)httpResponse.StatusCode;
                            response.Status = httpResponse.StatusCode.ToString();
                        }
                        else
                        {
                            resultRequest = ex.Message;
                            response.StatusCode = (int)HttpStatusCode.RequestTimeout;
                            response.Status = HttpStatusCode.RequestTimeout.ToString();
                        }
                    }
                }
                try
                {
                    response.ResponseData = JToken.Parse(resultRequest);
                }
                catch
                {
                    response.ResponseData = resultRequest;
                }
                return response;
            }
            private static string JsonToQueryParams(JObject json)
            {
                if (json.HasValues)
                {
                    List<string> queryParams = new List<string>();
                    foreach (JProperty property in json.Properties())
                    {
                        queryParams.Add($"{property.Name}={HttpUtility.UrlEncode(property.Value.ToString())}");
                    }
                    return "?" + string.Join("&", queryParams);
                }
                else
                {
                    return "";
                }
            }
        }
        public static HTTPRequest.Response GetCampaignAvailability(string campaignId)
        {
            return new HTTPRequest
            {
                Method = HTTPRequest.Methods.GET,
                URL = $"{ConfigurationManager.AppSettings["WebAPIChannelingBaseURL"]}/api/General/GetCampaignAvailability/{int.Parse(campaignId ?? "0")}",
                ContentType = HTTPRequest.ContentTypes.Json,
            }.SendRequest();
        }
    }
}