<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="BookDetails.aspx.cs" Inherits="BookDetails" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <asp:FormView ID="FormView1" runat="server" 
            BorderColor="White" BorderWidth="3px" CellPadding="4" 
            CellSpacing="2" DataKeyNames="BookNum" DataSourceID="SqlDataSource1" 
            Font-Bold="True" Font-Size="Larger" ForeColor="Black" GridLines="Both" 
            Height="64px" Width="771px" 
            onpageindexchanging="FormView1_PageIndexChanging" CssClass="data-table1">
            <FooterStyle BackColor="White" />
            <RowStyle BackColor="White" />
            <EditItemTemplate>
                BookSubject:
                <asp:TextBox ID="BookSubjectTextBox" runat="server" 
                    Text='<%# Bind("BookSubject") %>' />
                <br />
                PublisherName:
                <asp:TextBox ID="PublisherNameTextBox" runat="server" 
                    Text='<%# Bind("PublisherName") %>' />
                <br />
                WriterName:
                <asp:TextBox ID="WriterNameTextBox" runat="server" 
                    Text='<%# Bind("WriterName") %>' />
                <br />
                BookGroup:
                <asp:TextBox ID="BookGroupTextBox" runat="server" 
                    Text='<%# Bind("BookGroup") %>' />
                <br />
                Summary:
                <asp:TextBox ID="SummaryTextBox" runat="server" Text='<%# Bind("Summary") %>' />
                <br />
                CopyCount:
                <asp:TextBox ID="CopyCountTextBox" runat="server" 
                    Text='<%# Bind("CopyCount") %>' />
                <br />
                CoverPic:
                <asp:TextBox ID="CoverPicTextBox" runat="server" 
                    Text='<%# Bind("CoverPic") %>' />
                <br />
                BookNum:
                <asp:Label ID="BookNumLabel1" runat="server" Text='<%# Eval("BookNum") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                BookSubject:
                <asp:TextBox ID="BookSubjectTextBox" runat="server" 
                    Text='<%# Bind("BookSubject") %>' />
                <br />
                PublisherName:
                <asp:TextBox ID="PublisherNameTextBox" runat="server" 
                    Text='<%# Bind("PublisherName") %>' />
                <br />
                WriterName:
                <asp:TextBox ID="WriterNameTextBox" runat="server" 
                    Text='<%# Bind("WriterName") %>' />
                <br />
                BookGroup:
                <asp:TextBox ID="BookGroupTextBox" runat="server" 
                    Text='<%# Bind("BookGroup") %>' />
                <br />
                Summary:
                <asp:TextBox ID="SummaryTextBox" runat="server" Text='<%# Bind("Summary") %>' />
                <br />
                CopyCount:
                <asp:TextBox ID="CopyCountTextBox" runat="server" 
                    Text='<%# Bind("CopyCount") %>' />
                <br />
                CoverPic:
                <asp:TextBox ID="CoverPicTextBox" runat="server" 
                    Text='<%# Bind("CoverPic") %>' />
                <br />
                BookNum:
                <asp:TextBox ID="BookNumTextBox" runat="server" Text='<%# Bind("BookNum") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                BookSubject:
                <asp:Label ID="BookSubjectLabel" runat="server" 
                    Text='<%# Bind("BookSubject") %>' />
                <br />
                <br />
                PublisherName:
                <asp:Label ID="PublisherNameLabel" runat="server" 
                    Text='<%# Bind("PublisherName") %>' />
                <br />
                <br />
                WriterName:
                <asp:Label ID="WriterNameLabel" runat="server" 
                    Text='<%# Bind("WriterName") %>' />
                <br />
                <br />
                BookGroup:
                <asp:Label ID="BookGroupLabel" runat="server" Text='<%# Bind("BookGroup") %>' />
                <br />
                <br />
                Summary:
                <asp:Label ID="SummaryLabel" runat="server" Text='<%# Bind("Summary") %>' />
                <br />
                <br />
                CopyCount:
                <asp:Label ID="CopyCountLabel" runat="server" Text='<%# Bind("CopyCount") %>' />
                <br />
                CoverPic:<br />
                &nbsp;<asp:Image ID="Image1" runat="server" 
                    ImageUrl='<%# "Images/"+Eval("CoverPic") %>' />
                <br />
                <br />
            </ItemTemplate>
            <PagerStyle BackColor="White" ForeColor="White" HorizontalAlign="Left" />
            <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LibConnectionString %>" 
            SelectCommand="SELECT * FROM [Books]" 
            onselecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
    </p>
             
           
    &nbsp;<asp:Button ID="Button1" runat="server" BorderColor="White" Font-Bold="True" 
                        onclick="Button1_Click" Text="Add to Basket" 
        CssClass="button-1" />
                    <br />
           
   
</asp:Content>

