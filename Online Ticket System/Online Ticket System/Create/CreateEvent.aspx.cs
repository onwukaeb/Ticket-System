﻿using Online_Ticket_System.CSharpCode;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Text.RegularExpressions;
using System.Globalization;
using System.Drawing;

namespace Online_Ticket_System.Create
{
    public partial class CreateEvent : System.Web.UI.Page
    {
        DataTable tempTable;
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowImages();
        }

        protected void ListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtEventTime.Text = ListBox1.SelectedItem.Text;
        }

        private void ShowImages()
        {
            //Get all filepaths
            string[] images = Directory.GetFiles(Server.MapPath("~/Images/Events/"));

            //Get all filenames and add them to the arraylist
            ArrayList imageList = new ArrayList();

            foreach (string image in images)
            {
                string imageName = image.Substring(image.LastIndexOf(@"\") + 1);
                imageList.Add(imageName);
            }

            //Set the arrayList as the dropdownview's datasource and refresh
            //ddlImage.DataSource = imageList;
            //ddlImage.DataBind();
        }


        protected void btnUploadImage_Click1(object sender, EventArgs e)
        {
            try
            {
                string filename = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("~/../../Images/Events/") + filename);
                lbOutPut.Text = "Image" + filename + " successfully uploaded!";
                Page_Load(sender, e);
            }
            catch (Exception exc)
            {
                lbOutPut.Text = "Upload failed" + exc;
            }
        }



        private void ClearTextFields()
        {
            txtEventName.Text = "";
            txtEventDate.Text = "";
            txtEventTime.Text = "";
            VenueIDDd.SelectedIndex = 0;
            //txtEventStatus.Text = "";
            SelectEventCategory.SelectedIndex = 0;
            txtDescription.Text = "";

        }

        protected void price_Click(object sender, EventArgs e)
        {
            double n;
            if (!double.TryParse(txtPrice.Text, out n))
            {
                lbPrice.Text = "Invalid Price!!";
            }

            else
            {
                try
                {
                    int ssection = Int32.Parse(SeatDropDown.SelectedValue);
                    int seatprice = Int32.Parse(txtPrice.Text);
                    int svenueid = Int32.Parse(VenueIDDd.SelectedValue);

                    int seattotal = Connection.GetFromVenueInfo(ssection, svenueid);

                    DataColumn Col;
                    DataRow Ro;


                    if (Session["SeatLeveltable"] != null)
                    {
                        tempTable = (DataTable)Session["SeatLeveltable"];
                    }
                    else
                    {
                        // Create a new DataTable
                        tempTable = new DataTable();


                        // Create a new column in gridview
                        Col = new DataColumn();
                        Col.DataType = System.Type.GetType("System.Int32");
                        Col.ColumnName = ("SeatSection");
                        tempTable.Columns.Add(Col);

                        // Create a new column in gridview
                        Col = new DataColumn();
                        Col.DataType = System.Type.GetType("System.Int32");
                        Col.ColumnName = ("TotalSeat");
                        tempTable.Columns.Add(Col);

                        // Create a 3rd column in gridview 
                        Col = new DataColumn();
                        Col.DataType = System.Type.GetType("System.Double");
                        Col.ColumnName = ("Price");
                        tempTable.Columns.Add(Col);

                    }
                    int section = Int32.Parse(SeatDropDown.SelectedValue);
                    if (tempTable.AsEnumerable().Any(row => section == row.Field<int>("SeatSection")))
                    {
                        //lbSeatOutput.Text = "This Section already exits.";
                        //lbSeatOutput.ForeColor = Color.Red;
                        EventGrid.Visible = true;
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('This Section already exits.')", true);
                        EventGrid.Visible = true;
                        lbPrice.Text = "";
                    }
                    else
                    {
                        //Create new DataRow objects and add to DataTable

                        Ro = tempTable.NewRow();
                        Ro["SeatSection"] = ssection;
                        Ro["TotalSeat"] = seattotal;
                        Ro["Price"] = seatprice;
                        tempTable.Rows.Add(Ro);

                        EventGrid.DataSource = tempTable;
                        EventGrid.DataBind();

                        Session["SeatLeveltable"] = tempTable;

                        lbPrice.Text = "Upload successful!";
                        //ClearSeatSection();
                        EventGrid.Visible = true;
                    }
                }
                catch (Exception)
                {
                    lbPrice.Text = "Upload failed!";
                }
            }
        }

        //protected void AjaxFileUpload1_imageupload(object sender, AjaxFileUploadEventArgs e)
        //{
        //    string filename = e.FileName;
        //    string strDestPath = Server.MapPath("~/Images/Events/");
        //    AjaxFileUpload1.SaveAs(@strDestPath + filename);

        //}

        protected void buttonSave_Click(object sender, EventArgs e)
        {
            if (Session["SeatLeveltable"] == null)
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Price is missing from the Seat Level. Please enter the price and try it again.')", true);
            }
            else
            {
                tempTable = (DataTable)Session["SeatLeveltable"];
                DateTime d;

                if (!(DateTime.TryParseExact(txtEventDate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out d) || DateTime.TryParseExact(txtEventDate.Text, "M/d/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out d)))
                {
                }
                else if (!(Regex.IsMatch(txtEventTime.Text, @"^(?:0?[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$") || Regex.IsMatch(txtEventTime.Text, @"^(?:0?[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$")))
                {
                }
                else if (tempTable.Rows.Count == 0)
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Price is missing from the Seat Level. Please enter the price and try it again.')", true);
                }
                
                else
                {

                    try
                    {
                        string name = txtEventName.Text;
                        string date = txtEventDate.Text;
                        string time = txtEventTime.Text;
                        string venue = VenueIDDd.SelectedValue;
                        //string status = txtEventStatus.Text;
                        string category = SelectEventCategory.SelectedValue;
                        string description = txtDescription.Text;
                        //string images = "/httpdocs/Images/Events/" + ddlImage.SelectedValue;

                        //  string sstatus = "Available";

                        Event ticket = new Event(name, date, time, venue, "Available", category, description, "TEST");
                        int eid = Connection.AddEvents(ticket);
                        tempTable = (DataTable)Session["SeatLeveltable"];

                        // Create the eventid column 
                        DataColumn nce;
                        nce = new DataColumn();
                        nce.DataType = System.Type.GetType("System.Int32");
                        nce.ColumnName = "EventId";
                        nce.DefaultValue = eid;
                        tempTable.Columns.Add(nce);

                        // Add the above into gridview 
                        EventGrid.DataSource = tempTable;
                        EventGrid.DataBind();

                        // Add SeatSection and eventid from gridview to SeatCategory table
                        foreach (GridViewRow e1 in EventGrid.Rows)
                        {
                            string section = e1.Cells[0].Text;
                            int eventid = Int32.Parse(e1.Cells[3].Text);

                            //SeatCategory slv = new SeatCategory(eventid, section, sstatus);
                            int scatID = Connection.AddSeatCat(eventid, section);

                            Connection.AddSeat(Int32.Parse(e1.Cells[1].Text), e1.Cells[2].Text, scatID);
                        }

                        lbOutPut.Text = "Upload successful!";
                        ClearTextFields();
                        GridView1.DataBind();
                    }
                    catch (Exception)
                    {
                        lbOutPut.Text = "Upload failed!";
                    }
                }
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime d;
            args.IsValid = (DateTime.TryParseExact(args.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out d) || DateTime.TryParseExact(args.Value, "M/d/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out d));
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (Regex.IsMatch(args.Value, @"^(?:0?[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$") || Regex.IsMatch(args.Value, @"^(?:0?[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$"));
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            if (e.NewSelectedIndex != -1)
            {
                int Eventid = Convert.ToInt32(GridView1.DataKeys[e.NewSelectedIndex].Value);
                SqlDataSource4.SelectParameters["EventID"].DefaultValue = Eventid.ToString();
                eDetails.DataBind();
                Button1_ModalPopupExtender.Show();
            }
        }

        protected void CustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (Regex.IsMatch(args.Value, @"^(?:0?[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$") || Regex.IsMatch(args.Value, @"^(?:0?[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$"));
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime d;
            args.IsValid = (DateTime.TryParseExact(args.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out d) || DateTime.TryParseExact(args.Value, "M/d/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out d));
        }

        protected void eDetails_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void eDetails_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridView1.DataBind();
            GridView1.SelectRow(-1);
            Button1_ModalPopupExtender.Hide();
        }

        protected void EventGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (Session["SeatLeveltable"] != null)
            {
                tempTable = (DataTable)Session["SeatLeveltable"];
            }
            int index = Convert.ToInt32(e.RowIndex);
            tempTable.Rows.RemoveAt(e.RowIndex);
            this.EventGrid.DataSource = tempTable;
            this.EventGrid.DataBind();
            Session["SeatLeveltable"] = tempTable;
            EventGrid.Visible = true;
            lbPrice.Text = "Section was deleted successfully.";
            lbPrice.ForeColor = Color.Blue;
        }
    }
}