<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Shopping.aspx.cs" Inherits="Shopping" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        &nbsp;</p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" DataKeyNames="CustomerNum,BookNum" 
            DataSourceID="SqlDataSource2" Font-Size="Larger" ForeColor="White" 
            Height="50px" Width="666px" Visible="False" CssClass="data-table1">
            <Fields>
<asp:BoundField DataField="CustomerName" HeaderText="Customer Name" 
                    SortExpression="CustomerName"></asp:BoundField>
                <asp:BoundField DataField="CustomerNum" HeaderText="Customer Number" 
                    SortExpression="CustomerNum" ReadOnly="True" InsertVisible="False" 
                    Visible="False" />
                <asp:BoundField DataField="CopyOfBook" HeaderText="Copy Of Book" 
                    SortExpression="CopyOfBook" />
                <asp:BoundField DataField="CopyCount" HeaderText="Books Available" 
                    SortExpression="CopyCount" ReadOnly="True" />
                <asp:BoundField DataField="BookNum" HeaderText="BookNum" 
                    SortExpression="BookNum" ReadOnly="True" InsertVisible="False" 
                    Visible="False" />
                <asp:BoundField DataField="BookSubject" HeaderText="The Subject of Book" ReadOnly="True" 
                    SortExpression="BookSubject" />
                <asp:CommandField ShowDeleteButton="True" />
            </Fields>
            <HeaderStyle ForeColor="#E3AE17" />
            <HeaderTemplate>
                Shopping Basket
            </HeaderTemplate>
        </asp:DetailsView>
        </p>
    <p>
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
            Text="Send information" Height="25px" CssClass="button-1" />
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LibConnectionString %>" 
            InsertCommand="INSERT INTO [ShoppingBasket] ([CustomerName], [CopyOfBook],[BookNum]) VALUES (@x,@y,@z)" 
            
            SelectCommand="SELECT ShoppingBasket.CustomerNum, ShoppingBasket.CustomerName, ShoppingBasket.CopyOfBook, Books.CopyCount, Books.BookNum, Books.BookSubject FROM ShoppingBasket INNER JOIN Books ON ShoppingBasket.BookNum = Books.BookNum" 
            DeleteCommand="DELETE FROM [ShoppingBasket] WHERE [CustomerNum] = @CustomerNum" 
            
            
            UpdateCommand="UPDATE [ShoppingBasket] SET [CustomerName] = @CustomerName, [CopyOfBook] = @CopyOfBook, [ShBookNum] = @BookNum WHERE [CustomerNum] = @CustomerNum">
            <DeleteParameters>
                <asp:Parameter Name="CustomerNum" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="CustomerName" Type="String" />
                <asp:Parameter Name="CopyOfBook" Type="Int32" />
                <asp:Parameter Name="BookNum" />
                <asp:Parameter Name="CustomerNum" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txtCusName" DefaultValue="1" Name="x" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="txtCopyOfNum" DefaultValue="1" Name="y" 
                    PropertyName="Text" />
                <asp:QueryStringParameter Name="z" QueryStringField="EBookNum" />
            </InsertParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;</p>
    <p>
        <asp:Label ID="Label1" runat="server" Font-Size="Medium" ForeColor="Black" 
            Text="Enter How many Copy you want The Copies Available is" 
            style="font-weight: 700" CssClass="text"></asp:Label>
        &nbsp;
        ,<asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDSforBookNum" DataTextField="CopyCount" 
            DataValueField="CopyCount" Height="20px">
        </asp:DropDownList>
        &nbsp;
    &nbsp;&nbsp;<asp:TextBox ID="txtCopyOfNum" runat="server" ToolTip="Copy Count" 
            Height="21px" Width="130px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" Font-Size="Medium" ForeColor="Black" 
            Text="Enter Your Name" CssClass="text"></asp:Label>
&nbsp;<asp:TextBox ID="txtCusName" runat="server" style="margin-bottom: 0px" ToolTip="C Name"></asp:TextBox>
        </p>
    <p>
        <asp:Label ID="lbl1" runat="server" Font-Size="Medium" ForeColor="White"></asp:Label>
        <asp:SqlDataSource ID="SqlDSforBookNum" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LibConnectionString %>" 
            SelectCommand="SELECT * FROM [Books]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <br />
    </p>
</asp:Content>

