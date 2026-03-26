using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ura_wayback_receptivo
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Função para verificar se hoje é feriado nacional
        private bool EhFeriadoNacional(DateTime data)
        {
            var feriados = new List<DateTime>
            {
                new DateTime(data.Year, 1, 1),   // Confraternização Universal
                new DateTime(data.Year, 4, 21),  // Tiradentes
                new DateTime(data.Year, 5, 1),   // Dia do Trabalho
                new DateTime(data.Year, 9, 7),   // Independência do Brasil
                new DateTime(data.Year, 10, 12), // Nossa Senhora Aparecida
                new DateTime(data.Year, 11, 2),  // Finados
                new DateTime(data.Year, 11, 15), // Proclamação da República
                new DateTime(data.Year, 12, 25), // Natal
            };
            return feriados.Contains(data.Date);
        }

        public string GetHorario()
        {
            var rett = "";

            // Verifica se hoje é feriado nacional
            if (EhFeriadoNacional(DateTime.Today))
            {
                rett = "<block name=\"feriado\">" + Environment.NewLine +
                       "<milestone name=\"URA_Feriado\" index =\"99\"/>" + Environment.NewLine +
                       "<disposition id=\"266\"/>" + Environment.NewLine +
                       "<prompt>" + Environment.NewLine +
                       "<audio src=\"FERIADO_MSG\"/>" + Environment.NewLine +
                       "</prompt>" + Environment.NewLine +
                       "<disconnect triggerasyncevent=\"false\"/>" + Environment.NewLine +
                       "</block>";
                return rett;
            }

            var horaAtual = DateTime.Now.Hour;

            if (horaAtual > 8 && horaAtual < 18)
            {
                rett = "<block name=\"menu_inicio\">" + Environment.NewLine +
                        "<milestone name=\"URA_Menu_Principal\" index =\"03\"/>" + Environment.NewLine +
                        "<disposition id=\"264\"/>" + Environment.NewLine +
                        "<prompt>" + Environment.NewLine +
                        "<audio src=\"MENUPRINCIPAL_INI_02\r\n\"/>" + Environment.NewLine +
                        "</prompt>" + Environment.NewLine +
                        "<submit next=\"Transfer.aspx\" namelist=\"Dnis Ani callid\"/>" + Environment.NewLine +
                        "</block>";
            }
            else
            {
                rett = "<block name=\"after_houer\">" + Environment.NewLine +
                       "<milestone name=\"URA_After_hour\" index =\"02\"/>" + Environment.NewLine +
                       "<disposition id=\"265\"/>" + Environment.NewLine +
                       "<prompt>" + Environment.NewLine +
                       "<audio src=\"MENUPRINCIPAL_INI_03\"/>" + Environment.NewLine +
                       "</prompt>" + Environment.NewLine +
                       "<disconnect triggerasyncevent=\"false\"/>" + Environment.NewLine +
                       "</block>";
            }
            return rett;
        }
    }
}
