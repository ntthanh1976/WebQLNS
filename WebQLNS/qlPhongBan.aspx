<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="qlPhongBan.aspx.cs" Inherits="WebQLNS.qlPhongBan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row w-50 m-auto">
        <div class="col-md-12 form-inline mt-3 mb-3 text-center">
              Chọn phòng ban: <asp:DropDownList ID="ddlPhong" runat="server" CssClass="form-control"
                  DataSourceID="dsPhong" DataTextField="TenPhong" 
                  DataValueField="MaPhong" AutoPostBack="true" ></asp:DropDownList>
        </div>
    </div>

     <asp:GridView ID="gvNhanVien" runat="server" AutoGenerateColumns="False" 
        CssClass="table table-bordered table-hover"  DataSourceID="dsNhanVienTheoPhong" DataKeyNames="MaNV">
        <Columns>
            <asp:BoundField DataField="MaNV" HeaderText="Mã nv" ReadOnly="True"  />
            <asp:BoundField DataField="HoNV" HeaderText="Họ nhân viên" />
            <asp:BoundField DataField="TenNV" HeaderText="Tên nhân viên"  />
            <asp:CheckBoxField DataField="Phai" HeaderText="Phái"  />
            <asp:BoundField DataField="NgaySinh" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày sinh "  />
            <asp:BoundField DataField="NoiSinh" HeaderText="Nơi sinh"  />
            <asp:BoundField DataField="MaPhong" HeaderText="Mã phòng"  />          
            <asp:CommandField ButtonType="Button" ShowDeleteButton="true" />           
        </Columns>
        <HeaderStyle CssClass="bg-secondary text-light" />  
        <EmptyDataTemplate>
            <div class="alert alert-warning">
                 Không có nhân viên nào thuộc phòng ban này
            </div>
        </EmptyDataTemplate> 
    </asp:GridView>


    <asp:SqlDataSource ID="dsPhong" runat="server" 
        ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" 
        SelectCommand="SELECT * FROM [PhongBan]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsNhanVienTheoPhong" runat="server"
        ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" 
        DeleteCommand="DELETE FROM [NhanVien] WHERE [MaNV] = @MaNV" 
        SelectCommand="SELECT * FROM [NhanVien] WHERE ([MaPhong] = @MaPhong)"
       >
        <DeleteParameters>
            <asp:Parameter Name="MaNV" Type="Int32" />
        </DeleteParameters>       
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlPhong" Name="MaPhong" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>       
    </asp:SqlDataSource>
</asp:Content>
