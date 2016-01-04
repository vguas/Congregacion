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
using System.Data.OleDb;
using System.Data.SqlClient;
using MySql.Data;
using MySql.Data.MySqlClient;


namespace Congregacion
{
    /// <summary>
    /// Interaction logic for Congregacion.xaml
    /// </summary>
    public partial class Congregacion : Window
    {
        public Congregacion()
        {
            InitializeComponent();
            //Coneccion_Prueba();
            LimpiarCampos();
            
            
        }

        
        private void Salir_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void LimpiarCampos_Click(object sender, RoutedEventArgs e)
        {
            LimpiarCampos();
        }

        private void LimpiarCampos()
        {
            txtNumero.Text = "";
            txtNombre.Text = "";
            txtDireccion.Text = "";
            txtTelefono1.Text = "";
            txtTelefono2.Text = "";
            txtTelefono3.Text = "";
            txtCiudad.Text = "";
            txtPais.Text = "";
            txtCorreo.Text = "";
            txtNumero.Focus();
        }
    

        //private void CongregacionAgregar_Click(int Numero, string Nombre, int Telefono1, int Telefono2, int Telefono3, string Email, string Ciudad, string Pais)

      

        private void CongregacionAgregar_Click(object sender, RoutedEventArgs e)
        { 


            

            string connectionString = @"Data Source=.\VG2012;Database=WT;Integrated Security=SSPI";
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("CongregacionAgregar", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Numero", int.Parse(txtNumero.Text));
            cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
            cmd.Parameters.AddWithValue("@Direccion", txtDireccion.Text);
            cmd.Parameters.AddWithValue("@Telefono1", txtTelefono1.Text);
            cmd.Parameters.AddWithValue("@Telefono2", txtTelefono2.Text);
            cmd.Parameters.AddWithValue("@Telefono3", txtTelefono3.Text);
            cmd.Parameters.AddWithValue("@Email", txtCorreo.Text);
            cmd.Parameters.AddWithValue("@Ciudad", txtCiudad.Text);
            cmd.Parameters.AddWithValue("@Pais", txtPais.Text);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblMessage.Content = "Registro almacenado";
                return;
            }
            catch (Exception v)
            {
                con.Close();
                MessageBoxResult result = MessageBox.Show(v.Message, "Error");
                lblMessage.Content = "No se almaceno el registro";
                return;
                
            }
        }


        private void Coneccion_Prueba()
        {
            //SqlConnection con = new SqlConnection("Data Source=(localhost\\VG2012)\v11.0; Persist Security Info=True;Password=;User ID=sa; Initial Catalog=WT;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False");
            //SqlConnection con = new SqlConnection(@"Server=(J--215-2V9B8P1\\VG2012);Database=WT;Trusted_Connection=Yes;");

            string connectionString = @"Data Source=.\VG2012;Database=WT;Integrated Security=SSPI";
            using (SqlConnection con = new SqlConnection(connectionString))

            try
            {
                con.Open();
                lblMessage.Content = "Connected successfully";

            }
            catch (SqlException ex)
            {
                lblMessage.Content = ex.Message;
            }
        }
    }
}
