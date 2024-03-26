<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="qlTheLoai.aspx.cs" Inherits="WebQLNS.qlTheLoai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <h2>Quản lý thể loại tin</h2>
    <hr />

    <asp:SqlDataSource ID="dsTheLoai" runat="server" 
        ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>"
        DeleteCommand="DELETE FROM [TheLoai] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [TheLoai] ([TenTheLoai], [TrangThai]) VALUES (@TenTheLoai, @TrangThai)"
        SelectCommand="SELECT * FROM [TheLoai]" 
        UpdateCommand="UPDATE [TheLoai] SET [TenTheLoai] = @TenTheLoai, [TrangThai] = @TrangThai WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenTheLoai" Type="String" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenTheLoai" Type="String" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:ListView ID="lvTheLoai" runat="server" DataSourceID="dsTheLoai" DataKeyNames="Id" InsertItemPosition="LastItem">
       <%-- <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="TenTheLoaiLabel" runat="server" Text='<%# Eval("TenTheLoai") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Eval("TrangThai") %>' Enabled="false" />
                </td>
            </tr>
        </AlternatingItemTemplate>--%>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TenTheLoaiTextBox" runat="server" Text='<%# Bind("TenTheLoai") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Bind("TrangThai") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="TenTheLoaiTextBox" runat="server" Text='<%# Bind("TenTheLoai") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Bind("TrangThai") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" OnClientClick="return confirm('Are you sure to delete?')" CommandName="Delete" Text="Xoá" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Sửa" />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="TenTheLoaiLabel" runat="server" Text='<%# Eval("TenTheLoai") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Eval("TrangThai") %>' Enabled="false" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-bordered">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server">Id</th>
                                <th runat="server">Tên thể loại</th>
                                <th runat="server">Trạng thái</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="TenTheLoaiLabel" runat="server" Text='<%# Eval("TenTheLoai") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Eval("TrangThai") %>' Enabled="false" />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

</asp:Content>
