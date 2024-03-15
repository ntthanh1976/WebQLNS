using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
namespace WebQLNS
{
    public partial class ThemNhanVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btSave_Click(object sender, EventArgs e)
        {
            //lay gia tri chuoi ket noi trong Web.config
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["QLNhanVienConnectionString"].ConnectionString;
            //tao doi tuong Connection
            SqlConnection conn = new SqlConnection(chuoi_ket_noi);
            conn.Open();
            //tao cau sql de them nhan vien
            string sql = "insert into nhanvien(honv,tennv,phai,ngaysinh,noisinh,maphong) values (@honv,@tennv,@phai,@ngaysinh,@noisinh,@maphong)";
            SqlCommand cmd = new SqlCommand(sql,conn);
            //turyen gia tri cho cac tham so trong cau lenh sql
            cmd.Parameters.AddWithValue("@honv", txtHo.Text);
            cmd.Parameters.AddWithValue("@tennv", txtTen.Text);
            if(rdNam.Checked)
                cmd.Parameters.AddWithValue("@phai", true);
            else
                cmd.Parameters.AddWithValue("@phai", false);
           
            cmd.Parameters.AddWithValue("@ngaysinh", txtNgaySinh.Text);
            cmd.Parameters.AddWithValue("@noisinh", txtNoisinh.Text);
            cmd.Parameters.AddWithValue("@maphong", ddlPhong.SelectedValue);
            //thực hiện câu lệnh truy vấn đến CSDL
            if (cmd.ExecuteNonQuery() > 0)
                Response.Redirect("qlNhanVien.aspx");
            else
                lbThongBao.Text = "Thao tác thêm nhân viên thất bại";
        }
    }
}