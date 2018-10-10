using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace thescruffster
{
    public partial class error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             int month = DateTime.Today.Month;
            int day = DateTime.Today.Day;
            SetCalendar(day, month);

            

        }

        public void SetCalendar(int day, int month)
        {
            //convert day and month int to string to add to div
            string strMonth= Convert.ToString(month);
            string strDay =  Convert.ToString(day);
            switch (strMonth)
            {
                    
                case "1":
                    strMonth="Jan";
                     break;
                case "2":
                    strMonth="Feb";
                    break;
                case "3":
                    strMonth="Mar";
                    break;
                case "4":
                    strMonth="Apr";
                    break;
                case "5":
                    strMonth="May";
                    break;
                case "6":
                    strMonth="Jun";
                    break;
                case "7":
                    strMonth="Jul";
                    break;
                case "8":
                    strMonth="Aug";
                    break;
                case"9":
                    strMonth="Sep";
                    break;
                case "10":
                    strMonth="Oct";
                    break;
                case "11":
                    strMonth="Nov";
                    break;
                case "12":
                    strMonth="Dec";
                    break;

                 }

                    divmonth.InnerText=strMonth;
                    divday.InnerText= strDay;
            }
        }
    }

