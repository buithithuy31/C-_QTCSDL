﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace quanlihoadon
{
    public partial class frmdangnhap : Form
    {
        public frmdangnhap()
        {
            InitializeComponent();
        }

        private void btnDangnhap_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=.\\DESKTOP-B8N6V6G;Initial Catalog=nhaphang;Integrated Security=True");
            try
            {
                conn.Open();
                string tk = txtTendangnhap.Text;
                string mk = txtMatkhau.Text;
                string sql = "select * from Taikhoan where Taikhoan='" + tk + "' and Matkhau='" + mk + "'";
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dta = cmd.ExecuteReader();
                if(dta.Read() == true)
                {
                    MessageBox.Show("Đăng nhập thành công");
                    frmquanlichung KT = new frmquanlichung();
                    KT.Show();
                    this.Hide();
                }
                else
                {
                    MessageBox.Show("Đăng nhập thất bại");
                }
            }
            catch(Exception)
            {
                MessageBox.Show("Lỗi kết nối");
            }

        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void frmdangnhap_Load(object sender, EventArgs e)
        {

        }

        private void txtTendangnhap_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
}
