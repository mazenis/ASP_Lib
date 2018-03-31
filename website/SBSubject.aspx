<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="SBSubject.aspx.cs" Inherits="SBSubject" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="height: 1px; width: 937px; margin-bottom: 0px;">
    <asp:TextBox ID="TextBox1" runat="server" style="text-align: center"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Find By Subject" 
            onclick="Button1_Click" CssClass="button-1" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="White" BorderWidth="1px" 
        CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" 
        GridLines="Vertical" Width="727px" Height="215px" 
        style="margin-bottom: 20px; text-align: center; margin-top: 46px;" 
            DataKeyNames="BookNum" CssClass="data-table1">
        <RowStyle BackColor="White" BorderStyle="Double" HorizontalAlign="Center" 
            VerticalAlign="Middle" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="BookNum" 
                DataNavigateUrlFormatString="BookDetails.aspx?BookN={0}" 
                DataTextField="BookSubject" HeaderText="Subjects" />
            <asp:BoundField DataField="WriterName" HeaderText="WriterName" 
                SortExpression="WriterName" />
            <asp:BoundField DataField="BookGroup" HeaderText="BookGroup" 
                SortExpression="BookGroup" />
            <asp:BoundField DataField="BookNum" HeaderText="BookNum" ReadOnly="True" SortExpression="BookNum" Visible="False" />
            <asp:ImageField DataImageUrlField="CoverPic" 
                DataImageUrlFormatString="Images/{0}" HeaderText="Cover Pictures">
            </asp:ImageField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Center" 
            VerticalAlign="Middle" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#254476" BorderStyle="Double" Font-Bold="True" 
            ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
        <AlternatingRowStyle BackColor="White" /></asp:GridView>
</p>
<p style="height: 2px; width: 877px; text-align: center; margin-top: 308px;">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LibConnectionString %>" 
        
        SelectCommand="SELECT [BookSubject], [WriterName], [BookGroup], [CoverPic], [BookNum] FROM [Books]">
    </asp:SqlDataSource>
</p>
</asp:Content>

