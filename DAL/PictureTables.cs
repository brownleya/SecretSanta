using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Collections;

namespace thescruffster.DAL
{
    public class PictureTables
    { 
        public DataTable BuildDataTable(){
            DataTable dtPictures = new DataTable("FCPictures");

            DataColumn dcImage = new DataColumn("Image", System.Type.GetType("System.String"));
            dtPictures.Columns.Add(dcImage);
            DataColumn dcCaption = new DataColumn("Caption", System.Type.GetType("System.String"));
            dtPictures.Columns.Add(dcCaption);

            DataRow row2 = dtPictures.NewRow();
            row2[dcImage] = "IMG_0508.jpg";
            row2[dcCaption] = "My mother insisted.";
            dtPictures.Rows.Add(row2);

            DataRow row3 = dtPictures.NewRow();
            row3[dcImage] = "IMG_0509.jpg";
            row3[dcCaption] = "Laura Rucker, Angela Brownley";
            dtPictures.Rows.Add(row3);

            DataRow row4 = dtPictures.NewRow();
            row4[dcImage] = "IMG_0510.jpg";
            row4[dcCaption] = "Anne Noonan, Marybeth Scott, Angela Brownley, Laura Rucker ";
            dtPictures.Rows.Add(row4);

            DataRow row5 = dtPictures.NewRow();
            row5[dcImage] = "IMG_0511.jpg";
            row5[dcCaption] = "Chuck Wolfram, his wife, Angela Brownley";
            dtPictures.Rows.Add(row5);

            DataRow row6 = dtPictures.NewRow();
            row6[dcImage] = "IMG_0512.jpg";
            row6[dcCaption] = "Diane Malaspina, Suzanne Rhodes, Laura Rucker";
            dtPictures.Rows.Add(row6);

            DataRow row7 = dtPictures.NewRow();
            row7[dcImage] = "IMG_0513.jpg";
            row7[dcCaption] = "Angela Brownley, Natalie Cummings";
            dtPictures.Rows.Add(row7);

            DataRow row8 = dtPictures.NewRow();
            row8[dcImage] = "IMG_0514.jpg";
            row8[dcCaption] = "Angela Brownley, Natalie Cummings";
            dtPictures.Rows.Add(row8);

            DataRow row9 = dtPictures.NewRow();
            row9[dcImage] = "IMG_0515.jpg";
            row9[dcCaption] = "Mike Oliveri, Angela Brownley";
            dtPictures.Rows.Add(row9);

            DataRow row10 = dtPictures.NewRow();
            row10[dcImage] = "IMG_0516.jpg";
            row10[dcCaption] = "Anne Noonan, Alice Good, Angela Brownley";
            dtPictures.Rows.Add(row10);

            DataRow row11 = dtPictures.NewRow();
            row11[dcImage] = "IMG_0517.jpg";
            row11[dcCaption] = "Grace Potamianos, Mere Williams, John Manning, Scott Bundy,  Anne Noonan" +
            " Laura Rucker, Diane Malaspina, Alice Good";
            dtPictures.Rows.Add(row11);

            DataRow row12 = dtPictures.NewRow();
            row12[dcImage] = "IMG_0518.jpg";
            row12[dcCaption] = "Grace Potamianos, Mere Williams, John Manning, Scott Bundy,  Anne Noonan" +
            " Laura Rucker, Diane Malaspina, Alice Good";
            dtPictures.Rows.Add(row12);

            DataRow row13 = dtPictures.NewRow();
            row13[dcImage] = "IMG_0519.jpg";
            row13[dcCaption] = "Holly Mailhes, Chris Watson, ?, Diane Malaspina, Angela Brownley";
            dtPictures.Rows.Add(row13);

            DataRow row14 = dtPictures.NewRow();
            row14[dcImage] = "IMG_0520.jpg";
            row14[dcCaption] = "Holly Mailhes, ?, Chris Watson, Tom Torkelson?, Diane Malaspina, Angela Brownley";
            dtPictures.Rows.Add(row14);

            DataRow row15 = dtPictures.NewRow();
            row15[dcImage] = "IMG_0521.jpg";
            row15[dcCaption] = "Holly Mailhes, Chris Watson, Diane Malaspina, Angela Brownley";
            dtPictures.Rows.Add(row15);

            DataRow row16 = dtPictures.NewRow();
            row16[dcImage] = "IMG_0522.jpg";
            row16[dcCaption] = "Alice Good, Brooke Cashvan";
            dtPictures.Rows.Add(row16);

            DataRow row17 = dtPictures.NewRow();
            row17[dcImage] = "IMG_0523.jpg";
            row17[dcCaption] = "Brad Scott";
            dtPictures.Rows.Add(row17);

            DataRow row18 = dtPictures.NewRow();
            row18[dcImage] = "IMG_0524.jpg";
            row18[dcCaption] = "Angela Brownley, Brad Scott";
            dtPictures.Rows.Add(row18);

            DataRow row19 = dtPictures.NewRow();
            row19[dcImage] = "IMG_0525.jpg";
            row19[dcCaption] = "Angela Brownley, Grace Potamianos";
            dtPictures.Rows.Add(row19);

            DataRow row20 = dtPictures.NewRow();
            row20[dcImage] = "IMG_0526.jpg";
            row20[dcCaption] = "Angela Brownley, Scott Bundy, Grace Potamianos";
            dtPictures.Rows.Add(row20);

            DataRow row21 = dtPictures.NewRow();
            row21[dcImage] = "IMG_0527.jpg";
            row21[dcCaption] = "Angela Brownley, Scott Bundy, Grace Potamianos";
            dtPictures.Rows.Add(row21);

            DataRow row22 = dtPictures.NewRow();
            row22[dcImage] = "IMG_0528.jpg";
            row22[dcCaption] = "Laura Rucker, 'PK', Michelle Machay, Anne Noonan, Jen Ola";
            dtPictures.Rows.Add(row22);

            DataRow row23 = dtPictures.NewRow();
            row23[dcImage] = "IMG_0529.jpg";
            row23[dcCaption] = "Michelle Machay, Suzanne Rhodes, Tommy or maybe John Dye?";
            dtPictures.Rows.Add(row23);

            DataRow row24 = dtPictures.NewRow();
            row24[dcImage] = "IMG_0530.jpg";
            row24[dcCaption] = "Bo Pritchard, Ashley Hicks, Alice Good, Laura Rucker, Anne Noonan";
            dtPictures.Rows.Add(row24);

            DataRow row25 = dtPictures.NewRow();
            row25[dcImage] = "IMG_0531.jpg";
            row25[dcCaption] = "Diane Malaspina, Suzanne Rhodes";
            dtPictures.Rows.Add(row25);

            DataRow row26 = dtPictures.NewRow();
            row26[dcImage] = "IMG_0532.jpg";
            row26[dcCaption] = "Mike Cilento and his girlfriend";
            dtPictures.Rows.Add(row26);

            DataRow row27 = dtPictures.NewRow();
            row27[dcImage] = "IMG_0533.jpg";
            row27[dcCaption] = "Anne Noonan, Laura Rucker, Shannon Holly";
            dtPictures.Rows.Add(row27);

            DataRow row28 = dtPictures.NewRow();
            row28[dcImage] = "IMG_0534.jpg";
            row28[dcCaption] = "Anne Noonan, Laura Rucker, Shannon Holly";
            dtPictures.Rows.Add(row28);

            DataRow row29 = dtPictures.NewRow();
            row29[dcImage] = "IMG_0535.jpg";
            row29[dcCaption] = "Grace Potamianos, Diane Malaspina, Anne Noonan, Laura Rucker, Angela Brownley";
            dtPictures.Rows.Add(row29);

            DataRow row30 = dtPictures.NewRow();
            row30[dcImage] = "IMG_0536.jpg";
            row30[dcCaption] = "Grace Potamianos, Diane Malaspina, Anne Noonan, Laura Rucker, Angela Brownley";
            dtPictures.Rows.Add(row30);

            DataRow row31 = dtPictures.NewRow();
            row31[dcImage] = "IMG_0537.jpg";
            row31[dcCaption] = "Matt Vakos, Diane Malaspina";
            dtPictures.Rows.Add(row31);

            DataRow row32 = dtPictures.NewRow();
            row32[dcImage] = "IMG_0538.jpg";
            row32[dcCaption] = "Matt Vakos, Dinae Malaspina";
            dtPictures.Rows.Add(row32);

            DataRow row33 = dtPictures.NewRow();
            row33[dcImage] = "IMG_0539.jpg";
            row33[dcCaption] = "Laura Rucker,Grace Potamianos, Shannon Holly, Anne Noonan, Diane Malaspina, Angela Brownley ";
            dtPictures.Rows.Add(row33);

            DataRow row34 = dtPictures.NewRow();
            row34[dcImage] = "IMG_0541.jpg";
            row34[dcCaption] = "Suzanne Rhodes, Angela Brownley, Diane Malaspina, Grace Potamianos, Laura Rucker, Alice Good, Gia Borah(sp?) ";
            dtPictures.Rows.Add(row34);

            DataRow row35 = dtPictures.NewRow();
            row35[dcImage] = "IMG_0542.jpg";
            row35[dcCaption] = "Mike Oliveri, Steve Banks";
            dtPictures.Rows.Add(row35);

            DataRow row36 = dtPictures.NewRow();
            row36[dcImage] = "IMG_0543.jpg";
            row36[dcCaption] = "Alice Good, Tommy or John Dye";
            dtPictures.Rows.Add(row36);

            DataRow row37 = dtPictures.NewRow();
            row37[dcImage] = "IMG_0544.jpg";
            row37[dcCaption] = "Steve Banks, Chrissy Edgar";
            dtPictures.Rows.Add(row37);

            DataRow row38 = dtPictures.NewRow();
            row38[dcImage] = "IMG_0545.jpg";
            row38[dcCaption] = "Random drunk dude?";
            dtPictures.Rows.Add(row38);

            DataRow row39 = dtPictures.NewRow();
            row39[dcImage] = "IMG_0546.jpg";
            row39[dcCaption] = "Angela Brownley, Laura Rucker";
            dtPictures.Rows.Add(row39);

            DataRow row40 = dtPictures.NewRow();
            row40[dcImage] = "IMG_0547.jpg";
            row40[dcCaption] = "Kevin Coulsting, Gary Brockett, Laura Rucker, Diane Malaspina";
            dtPictures.Rows.Add(row40);

            DataRow row41 = dtPictures.NewRow();
            row41[dcImage] = "IMG_0548.jpg";
            row41[dcCaption] = "Kevin Coulsting, Gary Brockett, Kelly McFarland Laura Rucker, Diane Malaspina";
            dtPictures.Rows.Add(row41);

            DataRow row42 = dtPictures.NewRow();
            row42[dcImage] = "IMG_0549.jpg";
            row42[dcCaption] = "Scott Bundy, Diane Malaspina, John Colona";
            dtPictures.Rows.Add(row42);

            DataRow row43 = dtPictures.NewRow();
            row43[dcImage] = "IMG_0550.jpg";
            row43[dcCaption] = "Hot Tuna bar staff";
            dtPictures.Rows.Add(row43);

            DataRow row44 = dtPictures.NewRow();
            row44[dcImage] = "IMG_0551.jpg";
            row44[dcCaption] = "Laura Rucker, Jen ola, John Manning, Mike oliveri";
            dtPictures.Rows.Add(row44);

            DataRow row45 = dtPictures.NewRow();
            row45[dcImage] = "IMG_0552.jpg";
            row45[dcCaption] = "Same random drunk dude";
            dtPictures.Rows.Add(row45);

            DataRow row46 = dtPictures.NewRow();
            row46[dcImage] = "IMG_0553.jpg";
            row46[dcCaption] = "Late night at IHOP";
            dtPictures.Rows.Add(row46);

            DataRow row47 = dtPictures.NewRow();
            row47[dcImage] = "IMG_0554.jpg";
            row47[dcCaption] = "Finally - FOOD!!";
            dtPictures.Rows.Add(row47);

            DataRow row48 = dtPictures.NewRow();
            row48[dcImage] = "IMG_0555.jpg";
            row48[dcCaption] = "YummyYummy.";
            dtPictures.Rows.Add(row48);

            DataRow row49 = dtPictures.NewRow();
            row49[dcImage] = "IMG_0556.jpg";
            row49[dcCaption] = "Hmmmm.";
            dtPictures.Rows.Add(row49);

            DataRow row50 = dtPictures.NewRow();
            row50[dcImage] = "IMG_0557.jpg";
            row50[dcCaption] = "Matt's clever photography trick.";
            dtPictures.Rows.Add(row50);

            DataRow row52 = dtPictures.NewRow();
            row52[dcImage] = "IMG_0540.jpg";
            row52[dcCaption] = "oops!";
            dtPictures.Rows.Add(row52);

            return dtPictures;

        }

        public DataTable BuildBahamasDataTable()
        {
            const String IMAGE_DIRECTORY ="/images/bahamas/";
            ArrayList al = new ArrayList();


            DataTable dtPictures = new DataTable("BahamasPhotos");

            DataColumn dcImage = new DataColumn("Image", System.Type.GetType("System.String"));
            dtPictures.Columns.Add(dcImage);
            DataColumn dcCaption = new DataColumn("Caption", System.Type.GetType("System.String"));
            dtPictures.Columns.Add(dcCaption);

            foreach (string s in (Directory.GetFiles(HttpContext.Current.Server.MapPath(IMAGE_DIRECTORY), "*b.jpg")))   
           {
               DataRow r = dtPictures.NewRow();
               r[dcImage] = Path.GetFileName(s);
               r[dcCaption]="It's better in the bahamas!";
               dtPictures.Rows.Add(r);
             //  al.Add(Path.GetFileName(s));
           }   
            return dtPictures;
        }
      } 
    }

