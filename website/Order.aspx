<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <br />
    <asp:FormView ID="OrderFView" runat="server" AllowPaging="True" CellPadding="4" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" Visible="False" 
    Width="636px" CssClass="sub-category-grid" Font-Size="Larger">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditItemTemplate>
            CustomerAddress:
            <asp:TextBox ID="CustomerAddressTextBox" runat="server" 
                Text='<%# Bind("CustomerAddress") %>' />
            <br />
            CustomerEmail:
            <asp:TextBox ID="CustomerEmailTextBox" runat="server" 
                Text='<%# Bind("CustomerEmail") %>' />
            <br />
            CustVisaCartNu:
            <asp:TextBox ID="CustVisaCartNuTextBox" runat="server" 
                Text='<%# Bind("CustVisaCartNu") %>' />
            <br />
            Customer Number:
            <asp:Label ID="Customer_NumberLabel1" runat="server" 
                Text='<%# Eval("[Customer Number]") %>' />
            <br />
            BookNum:
            <asp:Label ID="BookNumLabel1" runat="server" Text='<%# Eval("BookNum") %>' />
            <br />
            CopyOfBook:
            <asp:TextBox ID="CopyOfBookTextBox" runat="server" 
                Text='<%# Bind("CopyOfBook") %>' />
            <br />
            CustomerName:
            <asp:TextBox ID="CustomerNameTextBox" runat="server" 
                Text='<%# Bind("CustomerName") %>' />
            <br />
            BookSubject:
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSource3" DataTextField="BookSubject" 
                DataValueField="BookSubject">
            </asp:DropDownList>
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            CustomerAddress:
            <asp:TextBox ID="CustomerAddressTextBox" runat="server" 
                Text='<%# Bind("CustomerAddress") %>' />
            <br />
            CustomerEmail:
            <asp:TextBox ID="CustomerEmailTextBox" runat="server" 
                Text='<%# Bind("CustomerEmail") %>' />
            <br />
            CustVisaCartNu:
            <asp:TextBox ID="CustVisaCartNuTextBox" runat="server" 
                Text='<%# Bind("CustVisaCartNu") %>' />
            <br />
            CopyOfBook:
            <asp:TextBox ID="CopyOfBookTextBox" runat="server" 
                Text='<%# Bind("CopyOfBook") %>' />
            <br />
            CustomerName:
            <asp:TextBox ID="CustomerNameTextBox" runat="server" 
                Text='<%# Bind("CustomerName") %>' />
            <br />
            BookSubject:
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSource3" DataTextField="BookSubject" 
                DataValueField="BookSubject">
            </asp:DropDownList>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            CustomerAddress:
            <asp:Label ID="CustomerAddressLabel" runat="server" 
                Text='<%# Bind("CustomerAddress") %>' />
            <br />
            CustomerEmail:
            <asp:Label ID="CustomerEmailLabel" runat="server" 
                Text='<%# Bind("CustomerEmail") %>' />
            <br />
            CustVisaCartNu:
            <asp:Label ID="CustVisaCartNuLabel" runat="server" 
                Text='<%# Bind("CustVisaCartNu") %>' />
            <br />
            Customer Number:
            <asp:Label ID="Customer_NumberLabel" runat="server" 
                Text='<%# Eval("[Customer Number]") %>' />
            <br />
            BookNum:
            <asp:Label ID="BookNumLabel" runat="server" Text='<%# Eval("BookNum") %>' />
            <br />
            CopyOfBook:
            <asp:Label ID="CopyOfBookLabel" runat="server" 
                Text='<%# Bind("CopyOfBook") %>' />
            <br />
            CustomerName:
            <asp:Label ID="CustomerNameLabel" runat="server" 
                Text='<%# Bind("CustomerName") %>' />
            <br />
            BookSubject:
            <asp:Label ID="BookSubjectLabel" runat="server" 
                Text='<%# Bind("BookSubject") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
    </asp:FormView>
    <asp:Button ID="butOrder" runat="server" Font-Bold="True" ForeColor="#254476" 
        onclick="butOrder_Click" Text="Order" />
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="CustomerName" 
        DataValueField="CustomerNum">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LibConnectionString %>" 
        DeleteCommand="DELETE FROM [Order] FROM [Order] INNER JOIN ShoppingBasket ON [Order].CustomerNum = ShoppingBasket.CustomerNum WHERE ([Order].CustomerNum = @CustomerNum)" 
        InsertCommand="INSERT INTO [Order] ([CustomerNum], [CustomerAddress], [CustomerEmail], [CustVisaCartNu]) VALUES (@CustomerNum, @CustomerAddress, @CustomerEmail, @CustVisaCartNu)" 
        SelectCommand="SELECT [Order].CustomerAddress, [Order].CustomerEmail, [Order].CustVisaCartNu, ShoppingBasket.CustomerNum AS [Customer Number], Books.BookNum, ShoppingBasket.CopyOfBook, ShoppingBasket.CustomerName, Books.BookSubject FROM [Order] INNER JOIN ShoppingBasket ON [Order].CustomerNum = ShoppingBasket.CustomerNum INNER JOIN Books ON ShoppingBasket.BookNum = Books.BookNum WHERE (ShoppingBasket.CustomerNum = @Num)" 
        
        UpdateCommand="UPDATE [Order] SET CustomerAddress = @CustomerAddress, CustomerEmail = @CustomerEmail, CustVisaCartNu = @CustVisaCartNu FROM [Order] INNER JOIN ShoppingBasket ON [Order].CustomerNum = ShoppingBasket.CustomerNum INNER JOIN Books ON ShoppingBasket.BookNum = Books.BookNum WHERE ([Order].CustomerNum = @CustomerNum)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="Num" 
                PropertyName="SelectedValue" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="CustomerNum" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CustomerAddress" Type="String" />
            <asp:Parameter Name="CustomerEmail" Type="String" />
            <asp:Parameter Name="CustVisaCartNu" Type="Int32" />
            <asp:Parameter Name="CustomerNum" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="CustomerNum" Type="Int32" />
            <asp:Parameter Name="CustomerAddress" Type="String" />
            <asp:Parameter Name="CustomerEmail" Type="String" />
            <asp:Parameter Name="CustVisaCartNu" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LibConnectionString %>" 
        SelectCommand="SELECT * FROM [Books]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LibConnectionString %>" 
        SelectCommand="SELECT [CustomerNum], [CustomerName] FROM [ShoppingBasket]">
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>

