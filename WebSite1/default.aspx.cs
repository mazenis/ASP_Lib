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

public partial class _Default : System.Web.UI.Page
{
    DataTable BooksDT = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        TVBooks.Nodes.Clear();
        String ConStr;
        ConStr = System.Configuration.ConfigurationManager.
         ConnectionStrings["LibConnectionString"].ConnectionString;

        SqlConnection sqlCON = new SqlConnection();
        sqlCON.ConnectionString = ConStr;

        SqlCommand SelectQu = new SqlCommand("Select * from Books order by BookNum ASC");
        SelectQu.Connection = sqlCON;
        try
        {
            sqlCON.Open();
  SqlDataReader dr = SelectQu.ExecuteReader();
  BooksDT.Load(dr);
  foreach (DataRow row in BooksDT.Rows)
  {
      TreeNode node = new TreeNode(row["BookSubject"].ToString(), row["BookNum"].ToString());
      node.PopulateOnDemand = true;
      TVBooks.Nodes.Add(node);
  }
  
      }
        catch (Exception)
        {
            
            throw;
        }
      
    }


    void AddNodes(int id, TreeNodeCollection tn)
    {
 
        foreach (DataRow row1 in BooksDT.Select("BookNum = " + id))
        {
            TreeNode node = new TreeNode(row1["BookGroup"].ToString(), row1["BookNum"].ToString());
            TreeNode ChildNode = new TreeNode(row1["BookSubject"].ToString(), "");
            TreeNode ChildNode1 = new TreeNode(row1["PublisherName"].ToString(), "");
            TreeNode AddedNode = new TreeNode ();
            tn.Add(node);

       //     AddNodes(Convert.ToInt32(row1["BookNum"].ToString()), node.ChildNodes);
        }
    }

     protected void PopulateNode(Object sender, TreeNodeEventArgs e)
 {


 }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void TVBooks_TreeNodePopulate(object sender, TreeNodeEventArgs e)
    {
        int x = 0;
        foreach (DataRow row in BooksDT.Rows)
        {
            //if (x == BooksDT.Rows.Count)
            //{
            //    break;
            //}
            if (e.Node.ChildNodes.Count == 0)
            {
                e.Node.PopulateOnDemand = true;
            }
            foreach (DataRow row1 in BooksDT.Select("BookNum = " + row["BookNum"].ToString()))
            {
                //if (row1["BookNum"].ToString() == row["BookNum"].ToString())
                //{
                    TreeNode node = new TreeNode(row1["BookGroup"].ToString(), row1["BookNum"].ToString());
                    TreeNode ChildNode = new TreeNode(row1["BookSubject"].ToString(), "");
                    TreeNode ChildNode1 = new TreeNode(row1["PublisherName"].ToString(), "");
                    e.Node.ChildNodes.Add(node);
                    e.Node.ChildNodes.Add(ChildNode);
                    e.Node.ChildNodes.Add(ChildNode1);
                    break;
                //}
                //x++;
            }

            return;
        }
        return;
    }
}
