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
using System.Data.SqlClient;

public partial class Shopping : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
             String SBookNumber;
            SBookNumber = Request.QueryString["EBookNum"];
            if (SBookNumber != null)
            {
                SqlDataSource2.SelectCommand = "SELECT ShoppingBasket.CustomerNum, ShoppingBasket.CustomerName, ShoppingBasket.CopyOfBook, Books.CopyCount, Books.BookNum, Books.BookSubject FROM ShoppingBasket INNER JOIN Books ON ShoppingBasket.BookNum = Books.BookNum Where Books.BookNum =" + SBookNumber;
                SqlDSforBookNum.SelectCommand = "SELECT * FROM [Books]Where Books.BookNum =" + SBookNumber;
            }
            else
            {
                DetailsView1.Visible = true;
                DropDownList1.Visible = false;
                SqlDataSource2.DataBind();
                txtCopyOfNum.Visible = false;
                Button2.Visible = false;
                Label1.Visible = false; Label2.Visible = false;
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
        {
        int CustBooks;
        if (!int.TryParse(txtCopyOfNum.Text, out CustBooks))
        {
            Label1.Text = "Enter an Integer here";
            return;
        }
        string StrCopy = DropDownList1.Text;
        int amount = (int.Parse(StrCopy)- int.Parse(txtCopyOfNum.Text));
        if ( amount< 0)
        {
            lbl1.Text = " Sorry we dont have this amount of Copies, We can sale You: " + StrCopy;
            txtCopyOfNum.Text = StrCopy;
            txtCopyOfNum.Focus();
            return;
        }
        lbl1.Text = "";
        try
        {
            string lastCopyAmount = (int.Parse(StrCopy) - int.Parse(txtCopyOfNum.Text)).ToString();
            int atre = int.Parse(lastCopyAmount);

            String ConStr;
            ConStr = System.Configuration.ConfigurationManager.
             ConnectionStrings["LibConnectionString"].ConnectionString;

            SqlConnection sqlCON = new SqlConnection();
            sqlCON.ConnectionString = ConStr;

            SqlCommand InsertCom = new SqlCommand();
            InsertCom.Connection = sqlCON;
            String sql;
            sql = "INSERT INTO [Books] ([CopyCount]) VALUES (@CCount)";
            InsertCom.Parameters.Add("@CCont", SqlDbType.Int);
            InsertCom.Parameters["@CCont"].Value = atre;




            SqlDataSource2.Insert();
            DetailsView1.Visible = true;
            DropDownList1.Visible = false;
            SqlDataSource2.DataBind();
            txtCopyOfNum.Text = "";
            txtCusName.Text = "";
            txtCusName.Visible = false;
            txtCopyOfNum.Visible = false;
            Button2.Visible = false;
            Label1.Visible = false; Label2.Visible = false;
        }
        catch
        { }
    }


}