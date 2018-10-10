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
using thescruffster.DAL;

namespace thescruffster.reunion
{
    public partial class pictures : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            int month = DateTime.Today.Month;
            int day = DateTime.Today.Day;
            SetCalendar(day, month);
            if (EnlargedImg.Src == "")
            {

                EnlargedImg.Src = "../images/IMG_0508.jpg";
                caption.InnerHtml = "My mother insisted.";

            }                   
            
                SetCaption(EnlargedImg.Src);


        }
        public void SetCalendar(int day, int month)
        {
            //convert day and month int to string to add to div
            string strMonth = Convert.ToString(month);
            string strDay = Convert.ToString(day);
            switch (strMonth)
            {

                case "1":
                    strMonth = "Jan";
                    break;
                case "2":
                    strMonth = "Feb";
                    break;
                case "3":
                    strMonth = "Mar";
                    break;
                case "4":
                    strMonth = "Apr";
                    break;
                case "5":
                    strMonth = "May";
                    break;
                case "6":
                    strMonth = "Jun";
                    break;
                case "7":
                    strMonth = "Jul";
                    break;
                case "8":
                    strMonth = "Aug";
                    break;
                case "9":
                    strMonth = "Sep";
                    break;
                case "10":
                    strMonth = "Oct";
                    break;
                case "11":
                    strMonth = "Nov";
                    break;
                case "12":
                    strMonth = "Dec";
                    break;

            }

            divmonth.InnerText = strMonth;
            divday.InnerText = strDay;
        }
       
        [System.Web.Services.WebMethod]
        public static string SetCaption(string imagefile) 
        {
          
           PictureTables pics = new PictureTables();
           DataTable dt =  pics.BuildDataTable();
        
          //create dataview to access dataset
        DataView dv = new DataView(dt);
        dv.RowStateFilter = DataViewRowState.CurrentRows;
        dv.RowFilter = "";
        dv.Sort = "";
        //iterate through dataview rows to retrieve field values      
        foreach(DataRowView view  in dv){
            String img = Convert.ToString(view["Image"]);
            String cap = Convert.ToString(view["Caption"]);

            if (img == imagefile)
            {
               // caption.InnerText = cap;
                return cap;
                
            }

            
            }
        return "";
        }
    }
}
    
