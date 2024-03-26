<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="qlTinTuc.aspx.cs" Inherits="WebQLNS.qlTinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="text-right mt-2 mb-2">
            <a href="ThemBanTin.aspx" class="btn btn-info">Thêm bản tin</a>
     </div>

    <asp:SqlDataSource ID="dsBanTin" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" DeleteCommand="DELETE FROM [BanTin] WHERE [Id] = @Id" InsertCommand="INSERT INTO [BanTin] ([TieuDe], [TomTat], [NoiDung], [Hinh], [NgayDang], [TrangThai], [TheLoaiID]) VALUES (@TieuDe, @TomTat, @NoiDung, @Hinh, @NgayDang, @TrangThai, @TheLoaiID)" SelectCommand="SELECT * FROM [BanTin]" UpdateCommand="UPDATE [BanTin] SET [TieuDe] = @TieuDe, [TomTat] = @TomTat, [NoiDung] = @NoiDung, [Hinh] = @Hinh, [NgayDang] = @NgayDang, [TrangThai] = @TrangThai, [TheLoaiID] = @TheLoaiID WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TieuDe" Type="String" />
            <asp:Parameter Name="TomTat" Type="String" />
            <asp:Parameter Name="NoiDung" Type="String" />
            <asp:Parameter Name="Hinh" Type="String" />
            <asp:Parameter Name="NgayDang" Type="DateTime" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
            <asp:Parameter Name="TheLoaiID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TieuDe" Type="String" />
            <asp:Parameter Name="TomTat" Type="String" />
            <asp:Parameter Name="NoiDung" Type="String" />
            <asp:Parameter Name="Hinh" Type="String" />
            <asp:Parameter Name="NgayDang" Type="DateTime" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
            <asp:Parameter Name="TheLoaiID" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
     </asp:SqlDataSource>

    <asp:GridView ID="gvBanTin" runat="server" CssClass="table table-bordered" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dsBanTin">
        <Columns>
           
            <asp:BoundField DataField="TieuDe" HeaderText="Tiêu đề" SortExpression="TieuDe" />
            <asp:BoundField DataField="TomTat" HeaderText="Tóm tắt" SortExpression="TomTat" />
            <asp:ImageField DataImageUrlField="hinh" HeaderText="Hình minh hoạ" DataImageUrlFormatString="~/uploads/{0}" ControlStyle-Width="100px" />
            <asp:BoundField DataField="TheLoaiID" HeaderText="Thể loại" SortExpression="TheLoaiID" />
            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/SuaBanTin.aspx?id={0}" Text="Edit" />
           <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ItemStyle-Wrap="false" />
        </Columns>
     </asp:GridView>
</asp:Content>
