using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Ura_wayback_receptivo
{
    public partial class Transfer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string GetTransfer()
        {
            var rett = "";

            var campanha = "";
            var servico = ConfigurationManager.AppSettings["servico"];
            var Dnis = Request["Dnis"];

            switch (Dnis)
            {
                case "00020":
                    campanha = "60";
                    break;
                case "8780":
                    campanha = "40";
                    break;
                case "8784":
                    campanha = "58";
                    break;
                case "00021":
                    campanha = "61";
                    break;
                case "8772":
                    campanha = "33";
                    break;
                case "00025":
                    campanha = "64";
                    break;
                case "8770":
                    campanha = "31";
                    break;
                case "00026":
                    campanha = "65";
                    break;
                case "8774":
                    campanha = "35";
                    break;
                case "00027":
                    campanha = "66";
                    break;
                case "8787":
                    campanha = "46";
                    break;
                case "9205":
                    campanha = "59";
                    break;
                case "9815":
                    campanha = "54";
                    break;
                case "00028":
                    campanha = "67";
                    break;
                case "8771":
                    campanha = "53";
                    break;
                case "00029":
                    campanha = "68";
                    break;
                case "8776":
                    campanha = "36";
                    break;
                default:
                    servico = ConfigurationManager.AppSettings["servico"];
                    break;
            }

            return rett = "<milestone name = \"Transfer\" index = \"04\"/>" + Environment.NewLine +
                          $"<transfer dest = \"{servico}\" info = \"{campanha}\" />";

        }
    }
}