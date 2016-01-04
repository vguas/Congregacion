using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data;

namespace Congregacion
{
    /// <summary>
    /// Interaction logic for Salon.xaml
    /// </summary>
    public partial class Salon : Window
    {
        public Salon()
        {
            InitializeComponent();
        }

       
        private void LimpiarCampos_Click(object sender, RoutedEventArgs e)
        {
            LimpiarCampos();
        }

        private void LimpiarCampos()
        {
            txtCodigo.Text = "";
            txtColonia.Text = "";
            txtDireccion.Text = "";
            txtMunicipio.Text = "";
            txtTelefono1.Text = "";
            txtTelefono2.Text = "";
            txtTelefono3.Text = "";
            txtZona.Text = "";
        }

        private void Salir_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {

        }

        private void SalonAgregar_Click(object sender, RoutedEventArgs e)
        {
            string connectionString = "server=localhost;port=3306;database=wt;Persist Security Info=True;User Id=root;password=1234";
            MySqlConnection sql_conn = new MySqlConnection(connectionString);

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = sql_conn;
            cmd.CommandText = "Salon_ADD";
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("?Codigo", Convert.ToString(this.txtCodigo.Text));
            cmd.Parameters["?Codigo"].Direction = System.Data.ParameterDirection.Input;
            cmd.Parameters.AddWithValue("?Direccion", Convert.ToString(this.txtDireccion.Text));
            cmd.Parameters["?Direccion"].Direction = System.Data.ParameterDirection.Input;
            cmd.Parameters.AddWithValue("?Colonia", Convert.ToString(this.txtColonia.Text));
            cmd.Parameters["?Colonia"].Direction = System.Data.ParameterDirection.Input;
            cmd.Parameters.AddWithValue("?Zona", Convert.ToInt16(this.txtZona.Text));
            cmd.Parameters["?Zona"].Direction = System.Data.ParameterDirection.Input;
            cmd.Parameters.AddWithValue("?IdMunicipio", Convert.ToInt16(this.txtMunicipio.Text));
            cmd.Parameters["?IdMunicipio"].Direction = System.Data.ParameterDirection.Input;
            cmd.Parameters.AddWithValue("?tel01", Convert.ToInt32(this.txtTelefono1.Text)); 
            cmd.Parameters["?tel01"].Direction = System.Data.ParameterDirection.Input;
            cmd.Parameters.AddWithValue("?tel02", Convert.ToInt32(this.txtTelefono2.Text)); 
            cmd.Parameters["?tel02"].Direction = System.Data.ParameterDirection.Input;
            cmd.Parameters.AddWithValue("?tel03", Convert.ToInt32(this.txtTelefono3.Text)); 
            cmd.Parameters["?tel03"].Direction = System.Data.ParameterDirection.Input;

            MySqlDataReader myReader;

            try
            {
                sql_conn.Open();

                myReader = cmd.ExecuteReader();
                
                sql_conn.Close();
                LimpiarCampos();
                lblMessage.Content = "Registro almacenado";
                
                return;
            }
            catch (Exception v)
            {
                sql_conn.Close();
                MessageBoxResult result = MessageBox.Show(v.Message, "Error");
                lblMessage.Content = "No se almaceno el registro";
                return;

            }
        }

       
    }
}
