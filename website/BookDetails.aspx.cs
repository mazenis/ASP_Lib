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

public partial class BookDetails : System.Web.UI.Page
{
    string BookN;
    protected void Page_Load(object sender, EventArgs e)
    {
        string SSelectIndex;
        SSelectIndex = Request.QueryString["BookN"];
        SqlDataSource1.SelectCommand = " Select * FROM Books WHERE BookNum =" + SSelectIndex;
        BookN = SSelectIndex;
    }
protected void  Button1_Click(object sender, EventArgs e)
{
    
    Response.Redirect("~/Shopping.aspx?EBookNum=" + BookN);

}
protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
{

}
protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
{

}
}
