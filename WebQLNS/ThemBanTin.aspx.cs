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
    public partial class ThemBanTin : System.Web.UI.Page
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
            //tao cau sql de them bản tin
            string sql = "insert into bantin(tieude,tomtat,noidung,hinh,ngaydang,trangthai,theloaiid)" +
                " values (@tieude,@tomtat,@noidung,@hinh,@ngaydang,@trangthai,@theloaiid)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            //turyen gia tri cho cac tham so trong cau lenh sql
            cmd.Parameters.AddWithValue("@tieude",txtTieude.Text);
            cmd.Parameters.AddWithValue("@tomtat", txtTomTat.Text);
            cmd.Parameters.AddWithValue("@noidung", txtNoidung.Text);

            if (FHinh.HasFile)
            {
                //xu ly upload hinh
                string duong_dan = Server.MapPath("~/Uploads/") + FHinh.FileName;
                FHinh.SaveAs(duong_dan);
                cmd.Parameters.AddWithValue("@hinh", FHinh.FileName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@hinh", "no_image.png");
            }

            cmd.Parameters.AddWithValue("@ngaydang", txtNgayDang.Text);
            cmd.Parameters.AddWithValue("@trangthai", chkTrangthai.Checked);         
            cmd.Parameters.AddWithValue("@theloaiid", ddlTheLoai.SelectedValue);
            //thực hiện câu lệnh truy vấn đến CSDL
            if (cmd.ExecuteNonQuery() > 0)
                Response.Redirect("qlTinTuc.aspx");
            else
                lbThongBao.Text = "Thao tác thêm tin thất bại";

        }
    }
}