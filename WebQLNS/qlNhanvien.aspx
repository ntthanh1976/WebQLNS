<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="qlNhanvien.aspx.cs" Inherits="WebQLNS.qlNhanvien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
   </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="text-center">DANH SÁCH NHÂN VIÊN</h2>
    <hr />
    <div class="text-right">
         <a href="ThemNhanVien.aspx" class="btn btn-info">Thêm nhân viên</a>    
    </div>

    <asp:SqlDataSource ID="dsNhanVien" runat="server"
        ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>"
        SelectCommand="SELECT * FROM [NhanVien]"
        DeleteCommand="DELETE FROM [NhanVien] WHERE [MaNV] = @MaNV"
        InsertCommand="INSERT INTO [NhanVien] ([HoNV], [TenNV], [Phai], [NgaySinh], [NoiSinh], [MaPhong]) VALUES (@HoNV, @TenNV, @Phai, @NgaySinh, @NoiSinh, @MaPhong)"
        UpdateCommand="UPDATE [NhanVien] SET [HoNV] = @HoNV, [TenNV] = @TenNV, [Phai] = @Phai, [NgaySinh] = @NgaySinh, [NoiSinh] = @NoiSinh, [MaPhong] = @MaPhong WHERE [MaNV] = @MaNV">
        <DeleteParameters>
            <asp:Parameter Name="MaNV" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="HoNV" Type="String" />
            <asp:Parameter Name="TenNV" Type="String" />
            <asp:Parameter Name="Phai" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="NgaySinh" />
            <asp:Parameter Name="NoiSinh" Type="String" />
            <asp:Parameter Name="MaPhong" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="HoNV" Type="String" />
            <asp:Parameter Name="TenNV" Type="String" />
            <asp:Parameter Name="Phai" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="NgaySinh" />
            <asp:Parameter Name="NoiSinh" Type="String" />
            <asp:Parameter Name="MaPhong" Type="Int32" />
            <asp:Parameter Name="MaNV" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="gvNhanVien" runat="server" AutoGenerateColumns="False"
        CssClass="table table-bordered table-hover" AllowPaging="true" PageSize="5"
        DataSourceID="dsNhanVien" DataKeyNames="MaNV">
        <Columns>
            <asp:BoundField DataField="MaNV" HeaderText="Mã nv" ReadOnly="True" />
            <asp:BoundField DataField="HoNV" HeaderText="Họ nhân viên" />
            <asp:BoundField DataField="TenNV" HeaderText="Tên nhân viên" />
            <asp:CheckBoxField DataField="Phai" HeaderText="Phái" />
            <asp:BoundField DataField="NgaySinh" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày sinh " />
            <asp:BoundField DataField="NoiSinh" HeaderText="Nơi sinh" />
            <asp:BoundField DataField="MaPhong" HeaderText="Mã phòng" />
            <asp:CommandField ShowEditButton="true" ButtonType="Button" ShowDeleteButton="true" />
        </Columns>
        <HeaderStyle CssClass="bg-secondary text-light" />
        <PagerStyle HorizontalAlign="Center" CssClass="pagination-ys" />
       
    </asp:GridView>
</asp:Content>
