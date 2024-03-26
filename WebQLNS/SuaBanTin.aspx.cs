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
    public partial class SuaBanTin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //b1. lay giá trị id của bản tin
                int id = int.Parse(Request.QueryString["id"]);
                //b2.truy cap CSDL de doc ban tin theo id
                //lay gia tri chuoi ket noi trong Web.config
                string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["QLNhanVienConnectionString"].ConnectionString;
                //tao doi tuong Connection
                SqlConnection conn = new SqlConnection(chuoi_ket_noi);
                conn.Open();
                //tao doi tuong thuc thi truy van du lieu
                SqlCommand cmd = new SqlCommand("select * from bantin where id=" + id, conn);
                SqlDataReader rd = cmd.ExecuteReader();
                //b3. hien thi thong tin len trang sua tin
                if (rd.Read())
                {
                    txtTieude.Text = rd["tieude"].ToString();
                    txtTomTat.Text = rd["tomtat"].ToString();
                    txtNoidung.Text = rd["noidung"].ToString();
                    txtNgayDang.Text = rd["ngaydang"].ToString();
                    ddlTheLoai.SelectedValue = rd["theloaiid"].ToString();
                    chkTrangthai.Checked = bool.Parse(rd["trangthai"].ToString());

                    oldImg.ImageUrl = "uploads/" + rd["hinh"].ToString();
                    lbOldImg.Text = rd["hinh"].ToString();
                }

            }
        }

        protected void btSave_Click(object sender, EventArgs e)
        {
            //lay gia tri chuoi ket noi trong Web.config
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["QLNhanVienConnectionString"].ConnectionString;
            //tao doi tuong Connection
            SqlConnection conn = new SqlConnection(chuoi_ket_noi);
            conn.Open();
            //tao cau sql de sửa bản tin
            string sql = "update bantin set tieude=@tieude,tomtat=@tomtat,noidung=@noidung,hinh=@hinh,ngaydang=@ngaydang,trangthai=@trangthai,theloaiid=@theloaiid " +
               " where id=@id";
            SqlCommand cmd = new SqlCommand(sql, conn);
            //turyen gia tri cho cac tham so trong cau lenh sql
            cmd.Parameters.AddWithValue("@tieude", txtTieude.Text);
            cmd.Parameters.AddWithValue("@tomtat", txtTomTat.Text);
            cmd.Parameters.AddWithValue("@noidung", txtNoidung.Text);

            if (FHinh.HasFile) 
            {
                //xu ly upload hinh
                string duong_dan = Server.MapPath("~/Uploads/") + FHinh.FileName;
                FHinh.SaveAs(duong_dan);
                cmd.Parameters.AddWithValue("@hinh", FHinh.FileName);
            }
            else //ko chọn hình mới
            {
                cmd.Parameters.AddWithValue("@hinh",lbOldImg.Text);
            }

            cmd.Parameters.AddWithValue("@ngaydang", txtNgayDang.Text);
            cmd.Parameters.AddWithValue("@trangthai", chkTrangthai.Checked);
            cmd.Parameters.AddWithValue("@theloaiid", ddlTheLoai.SelectedValue);
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);

            //thực hiện câu lệnh truy vấn đến CSDL
            if (cmd.ExecuteNonQuery() > 0)
                Response.Redirect("qlTinTuc.aspx");
            else
                lbThongBao.Text = "Thao tác cập nhật bản tin thất bại";

        }
    }
}