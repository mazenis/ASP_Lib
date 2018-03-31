<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 636px;
            height: 87px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="width: 988px; text-align: center;">
       
<asp:Button ID="Button2" runat="server" Text="Search" 
                Font-Bold="True" style="text-align: left" Width="58px" 
            BorderStyle="Double" Height="30px" CssClass="button-1" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="BookGroup" 
            DataValueField="BookGroup" EnableTheming="False" Height="30px" 
    Width="124px" Font-Bold="True" AutoPostBack="True">
    <asp:ListItem></asp:ListItem>
</asp:DropDownList>
   
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LibConnectionString %>" 
        SelectCommand="SELECT DISTINCT [BookGroup] FROM [Books]">
    </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="BookNum" DataSourceID="SqlDataSource1" Font-Size="Larger" 
            ForeColor="White" onselectedindexchanged="GridView1_SelectedIndexChanged" 
            Width="757px" CssClass="data-table1" HorizontalAlign="Center">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="BookNum" 
                    DataTextField="BookSubject" HeaderText="Subjects" 
                    DataNavigateUrlFormatString="BookDetails.aspx?BookN={0}" />
                <asp:BoundField DataField="WriterName" HeaderText="WriterName" 
                    SortExpression="WriterName" />
                <asp:BoundField DataField="BookGroup" HeaderText="BookGroup" 
                    SortExpression="BookGroup" />
                <asp:ImageField DataImageUrlField="CoverPic" 
                    DataImageUrlFormatString="Images/{0}" HeaderText="Cover Pictures">
                </asp:ImageField>
                <asp:BoundField DataField="BookNum" HeaderText="BookNum" ReadOnly="True" 
                    SortExpression="BookNum" Visible="False" />
            </Columns>
        </asp:GridView>
</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LibConnectionString %>" 
            SelectCommand="SELECT [BookNum], [BookSubject], [WriterName], [BookGroup], [CoverPic] FROM [Books] WHERE ([BookGroup] = @BookGroup)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" 
                    Name="BookGroup" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </p>
   
        <asp:TreeView ID="TVBooks" runat="server" 
        ontreenodepopulate="TVBooks_TreeNodePopulate" Width="177px">
        </asp:TreeView>
   
    <p>
        &nbsp;</p>
    </asp:Content>

