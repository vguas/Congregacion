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
using System.Data.Common;
using System.Drawing;
using System.Data;
using System.Runtime.InteropServices;
using System.Windows.Interop;
using System.IO;
using System.Configuration;
using System.Collections.Specialized;

namespace Congregacion
{
    /// <summary>
    /// Interaction logic for Programa.xaml
    /// </summary>
    public partial class Programa : Window
    {
        public Programa()
        {
            InitializeComponent();
            MySql_loadAnio();
            MySql_loadMes();
            Salas_Get();
            lblSugerencias.Visibility = Visibility.Collapsed;
            lblSugerencias.ItemsSource = null;
            lblSugerencias2.Visibility = Visibility.Collapsed;
            lblSugerencias2.ItemsSource = null;
            lblSugerencias3.Visibility = Visibility.Collapsed;
            lblSugerencias3.ItemsSource = null;

            //FillGrid();
          
            
            //MessageBox.Show(cmbMes.SelectedItem.ToString());
            
        }

        private void MySql_loadAnio()
        {
            try
            {

                //string connectionString = "server=localhost;port=3306;database=wt;Persist Security Info=True;User Id=root"; //;password=1234
                String connectionString = ConfigurationManager.ConnectionStrings["WT"].ConnectionString;
                MySqlConnection sql_conn = new MySqlConnection(connectionString);
                sql_conn.Open();
                string com = "VMCAnio_Get";
                MySqlCommand cmd = new MySqlCommand(com, sql_conn);
                MySqlDataReader mdr = cmd.ExecuteReader();

                while (mdr.Read())
                {
                    cmbAnio.Items.Add(mdr.GetString("Anio"));
                }
                sql_conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            


        }


        private void MySql_loadMes()
        {
            try
            {

                String connectionString = ConfigurationManager.ConnectionStrings["WT"].ConnectionString;
                MySqlConnection sql_conn = new MySqlConnection(connectionString);
                sql_conn.Open();
                string com = "VMCMes_Get";
                MySqlCommand cmd = new MySqlCommand(com, sql_conn);
                MySqlDataReader mdr = cmd.ExecuteReader();

                while (mdr.Read())
                {
                    cmbMes.Items.Add(mdr.GetString("Mes"));
                }
                sql_conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Dias_load()
        {
            try
            {

                cmbDia.Items.Clear();

                String connectionString = ConfigurationManager.ConnectionStrings["WT"].ConnectionString;
                MySqlConnection sql_conn = new MySqlConnection(connectionString);



                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = sql_conn;
                cmd.CommandText = "VMCDias_Get";
                cmd.CommandType = CommandType.StoredProcedure;


                if (Convert.ToInt32(cmbAnio.SelectedIndex) != -1)
                {
                    cmd.Parameters.AddWithValue("inanio", cmbAnio.SelectedItem.ToString());
                    cmd.Parameters["inanio"].Direction = ParameterDirection.Input;
                }
                else
                {
                    cmd.Parameters.AddWithValue("inanio", 0);
                    cmd.Parameters["inanio"].Direction = ParameterDirection.Input;
                }


                if (Convert.ToInt32(cmbMes.SelectedIndex) != -1)
                {

                    int mes;
                    mes = 0;
                    switch (cmbMes.SelectedItem.ToString())
                    {
                        case "Enero":
                            mes = 1;
                            break;
                        case "Febrero":
                            mes = 2;
                            break;
                    }

                    cmd.Parameters.AddWithValue("inmes", mes.ToString());
                    cmd.Parameters["inmes"].Direction = ParameterDirection.Input;
                }
                else
                {
                    cmd.Parameters.AddWithValue("inmes", 0);
                    cmd.Parameters["inmes"].Direction = ParameterDirection.Input;
                }

                cmd.Parameters.AddWithValue("inIdCongregacion", 1);
                cmd.Parameters["inIdCongregacion"].Direction = ParameterDirection.Input;

                sql_conn.Open();

                MySqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                //MySqlDataReader mdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    cmbDia.Items.Add(rdr.GetString("Dia"));
                }
                sql_conn.Close();
                
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
 
        }

        private void ReunionParte_load()
        {
            try
            {

                cmbParteReunion.Items.Clear();
                   
                String connectionString = ConfigurationManager.ConnectionStrings["WT"].ConnectionString;
                MySqlConnection sql_conn = new MySqlConnection(connectionString);



                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = sql_conn;
                cmd.CommandText = "VMCReunionParte_Get";
                cmd.CommandType = CommandType.StoredProcedure;


                if (Convert.ToInt32(cmbDia.SelectedIndex) != -1)
                {
                    cmd.Parameters.AddWithValue("inFecha", cmbAnio.SelectedItem.ToString());
                    cmd.Parameters["inFecha"].Direction = ParameterDirection.Input;
                }
                else
                {
                    cmd.Parameters.AddWithValue("inFecha", 0);
                    cmd.Parameters["inFecha"].Direction = ParameterDirection.Input;
                }


                
                cmd.Parameters.AddWithValue("inIdCongregacion", 1);
                cmd.Parameters["inIdCongregacion"].Direction = ParameterDirection.Input;

                sql_conn.Open();

                MySqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                //MySqlDataReader mdr = cmd.ExecuteReader();

                //cmbParteReunion.SelectedIndex = -1;
                //cmbParteReunion.Items.Clear();

                while (rdr.Read())
                {
                    cmbParteReunion.Items.Add(rdr.GetString("Nombre"));
                }
                sql_conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Asignacion_Get()
        {
            try
            {
                cmbAsignacion.Items.Clear();
                String connectionString = ConfigurationManager.ConnectionStrings["WT"].ConnectionString;
                MySqlConnection sql_conn = new MySqlConnection(connectionString);



                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = sql_conn;
                cmd.CommandText = "VMCAsignacion_Get";
                cmd.CommandType = CommandType.StoredProcedure;


                if (Convert.ToInt32(cmbDia.SelectedIndex) != -1)
                {

                    var date = DateTime.Parse(cmbDia.SelectedItem.ToString());
                    string m = date.ToString("yyyy-MM-dd");
                    
                    cmd.Parameters.AddWithValue("inFecha", m);
                    cmd.Parameters["inFecha"].Direction = ParameterDirection.Input;
                }
                else
                {
                    cmd.Parameters.AddWithValue("inFecha", 0);
                    cmd.Parameters["inFecha"].Direction = ParameterDirection.Input;
                }



                cmd.Parameters.AddWithValue("inIdCongregacion", 1);
                cmd.Parameters["inIdCongregacion"].Direction = ParameterDirection.Input;


                if (Convert.ToInt32(cmbParteReunion.SelectedIndex) != -1)
                {
                    cmd.Parameters.AddWithValue("inParteReunion", cmbParteReunion.SelectedItem.ToString());
                    cmd.Parameters["inParteReunion"].Direction = ParameterDirection.Input;
                }
                else
                {
                    cmd.Parameters.AddWithValue("inParteReunion", 0);
                    cmd.Parameters["inParteReunion"].Direction = ParameterDirection.Input;
                }
                

                sql_conn.Open();

                MySqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                //MySqlDataReader mdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    cmbAsignacion.Items.Add(rdr.GetString("Nombre"));
                }
                sql_conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Salas_Get()
        {
            try
            {
                cmbSala.Items.Clear();
                String connectionString = ConfigurationManager.ConnectionStrings["WT"].ConnectionString;
                MySqlConnection sql_conn = new MySqlConnection(connectionString);



                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = sql_conn;
                cmd.CommandText = "VMCSala_Get";
                cmd.CommandType = CommandType.StoredProcedure;


                sql_conn.Open();

                MySqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                //MySqlDataReader mdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    cmbSala.Items.Add(rdr.GetString("Nombre"));
                }
                sql_conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            //MessageBox.Show(cmbAnio.SelectedItem.ToString());
            FillGrid();
            Dias_load();
            
        }

        private void cmbMes_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
                                
            //MessageBox.Show(mes.ToString());

            FillGrid();
            Dias_load();
        }


        public void FillGrid()
        {


            
            
            String connectionString = ConfigurationManager.ConnectionStrings["WT"].ConnectionString;
            MySqlConnection sql_conn = new MySqlConnection(connectionString);

            

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = sql_conn;
            cmd.CommandText = "VMCPrograma_Get";
            cmd.CommandType = CommandType.StoredProcedure;

            if (Convert.ToInt32(cmbMes.SelectedIndex) != -1)
            {

                int mes;
                mes = 0;
                switch (cmbMes.SelectedItem.ToString())
                {
                    case "Enero":
                        mes = 1;
                        break;
                    case "Febrero":
                        mes = 2;
                        break;
                }

                cmd.Parameters.AddWithValue("inmes", mes.ToString());
                cmd.Parameters["inmes"].Direction = ParameterDirection.Input;
            }
            else
            {
                cmd.Parameters.AddWithValue("inmes", 0);
                cmd.Parameters["inmes"].Direction = ParameterDirection.Input;
            }
            


            if (Convert.ToInt32(cmbAnio.SelectedIndex) != -1)
            {
                cmd.Parameters.AddWithValue("inanio", cmbAnio.SelectedItem.ToString());
                cmd.Parameters["inanio"].Direction = ParameterDirection.Input;
            }
            else
            {
                cmd.Parameters.AddWithValue("inanio", 0);
                cmd.Parameters["inanio"].Direction = ParameterDirection.Input;
            }

            

            cmd.Parameters.AddWithValue("inIdCongregacion", 1);
            cmd.Parameters["inIdCongregacion"].Direction = ParameterDirection.Input;

            sql_conn.Open();

            MySqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable dt = new DataTable();
            dt.Load(rdr);
            
            //MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            

            //dtgAsignaciones.DataContext = dt;
            dtgAsignaciones.ItemsSource = dt.DefaultView;
            sql_conn.Close();

            
        }

        private void mnuitmLimpiar_Click(object sender, RoutedEventArgs e)
        {
            try
            {

                cmbAnio.Items.Clear();
                cmbMes.Items.Clear();
                cmbDia.Items.Clear();
                cmbParteReunion.Items.Clear();
                cmbAsignacion.Items.Clear();

                MySql_loadAnio();
                MySql_loadMes();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }

        private void cmbDia_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {


            
            ReunionParte_load();
        }

        private void cmbParteReunion_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Asignacion_Get();
        }

        private void AutoCompleteText()
        {
            
        }

        private void txtAsignado_TextChanged(object sender, TextChangedEventArgs e)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["WT"].ConnectionString;
            MySqlConnection sql_conn = new MySqlConnection(connectionString);



            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = sql_conn;
            cmd.CommandText = "Personas_Get";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("inIdCongregacion", 1);
            cmd.Parameters["inIdCongregacion"].Direction = ParameterDirection.Input;

            sql_conn.Open();

            MySqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            //DataTable dt = new DataTable();
            //dt.Load(rdr);

            List<string> nameList = new List<string>();

            while (rdr.Read())
            {
                nameList.Add(rdr.GetString("Nombre"));
            }
            sql_conn.Close();
            
            
            string typeString = txtAsignado.Text;
            List<string> autoList = new List<string>();
            autoList.Clear();

            foreach (string item in nameList)
            {
                if (!string.IsNullOrEmpty(txtAsignado.Text))
                {
                    if (item.Contains(typeString))
                    {
                        autoList.Add(item);
                    }
                }
            }

            if (autoList.Count > 0)
            {
                lblSugerencias.ItemsSource = autoList;
                lblSugerencias.Visibility = Visibility.Visible;
            }
            else if (txtAsignado.Text.Equals(""))
            {
                lblSugerencias.Visibility = Visibility.Collapsed;
                lblSugerencias.ItemsSource = null;
            }
            else
            {
                lblSugerencias.Visibility = Visibility.Collapsed;
                lblSugerencias.ItemsSource = null;
            }
        }

        private void lblSugerencias_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (lblSugerencias.ItemsSource != null)
            {
                lblSugerencias.Visibility = Visibility.Collapsed;
                txtAsignado.TextChanged-= new TextChangedEventHandler(txtAsignado_TextChanged);
                if (lblSugerencias.SelectedIndex != -1)
                {
                    txtAsignado.Text = lblSugerencias.SelectedItem.ToString();
                }
                txtAsignado.TextChanged += new TextChangedEventHandler(txtAsignado_TextChanged);
            }
        }

        private void txtAyudante_TextChanged(object sender, TextChangedEventArgs e)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["WT"].ConnectionString;
            MySqlConnection sql_conn = new MySqlConnection(connectionString);



            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = sql_conn;
            cmd.CommandText = "Personas_Get";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("inIdCongregacion", 1);
            cmd.Parameters["inIdCongregacion"].Direction = ParameterDirection.Input;

            sql_conn.Open();

            MySqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            //DataTable dt = new DataTable();
            //dt.Load(rdr);

            List<string> nameList = new List<string>();

            while (rdr.Read())
            {
                nameList.Add(rdr.GetString("Nombre"));
            }
            sql_conn.Close();


            string typeString = txtAyudante.Text;
            List<string> autoList = new List<string>();
            autoList.Clear();

            foreach (string item in nameList)
            {
                if (!string.IsNullOrEmpty(txtAyudante.Text))
                {
                    if (item.Contains(typeString))
                    {
                        autoList.Add(item);
                    }
                }
            }

            if (autoList.Count > 0)
            {
                lblSugerencias2.ItemsSource = autoList;
                lblSugerencias2.Visibility = Visibility.Visible;
            }
            else if (txtAyudante.Text.Equals(""))
            {
                lblSugerencias2.Visibility = Visibility.Collapsed;
                lblSugerencias2.ItemsSource = null;
            }
            else
            {
                lblSugerencias2.Visibility = Visibility.Collapsed;
                lblSugerencias2.ItemsSource = null;
            }
        }

        private void lblSugerencias2_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (lblSugerencias2.ItemsSource != null)
            {
                lblSugerencias2.Visibility = Visibility.Collapsed;
                txtAyudante.TextChanged -= new TextChangedEventHandler(txtAyudante_TextChanged);
                if (lblSugerencias2.SelectedIndex != -1)
                {
                    txtAyudante.Text = lblSugerencias2.SelectedItem.ToString();
                }
                txtAyudante.TextChanged += new TextChangedEventHandler(txtAyudante_TextChanged);
            }

            if (txtAsignado.Text.Equals(txtAyudante.Text))
            {
                MessageBox.Show("No pueden ser iguales");
                txtAyudante.Text = "";
            }
        }

        private void txtAspecto_TextChanged(object sender, TextChangedEventArgs e)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["WT"].ConnectionString;
            MySqlConnection sql_conn = new MySqlConnection(connectionString);



            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = sql_conn;
            cmd.CommandText = "VMCAspecto_Get";
            cmd.CommandType = CommandType.StoredProcedure;

            sql_conn.Open();

            MySqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            //DataTable dt = new DataTable();
            //dt.Load(rdr);

            List<string> nameList = new List<string>();

            while (rdr.Read())
            {
                nameList.Add(rdr.GetString("Aspecto"));
            }
            sql_conn.Close();


            string typeString = txtAspecto.Text;
            List<string> autoList = new List<string>();
            autoList.Clear();

            foreach (string item in nameList)
            {
                if (!string.IsNullOrEmpty(txtAspecto.Text))
                {
                    if (item.Contains(typeString))
                    {
                        autoList.Add(item);
                    }
                }
            }

            if (autoList.Count > 0)
            {
                lblSugerencias3.ItemsSource = autoList;
                lblSugerencias3.Visibility = Visibility.Visible;
            }
            else if (txtAspecto.Text.Equals(""))
            {
                lblSugerencias3.Visibility = Visibility.Collapsed;
                lblSugerencias3.ItemsSource = null;
            }
            else
            {
                lblSugerencias3.Visibility = Visibility.Collapsed;
                lblSugerencias3.ItemsSource = null;
            }
        }

        private void lblSugerencias3_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (lblSugerencias3.ItemsSource != null)
            {
                lblSugerencias3.Visibility = Visibility.Collapsed;
                txtAspecto.TextChanged -= new TextChangedEventHandler(txtAspecto_TextChanged);
                if (lblSugerencias3.SelectedIndex != -1)
                {
                    txtAspecto.Text = lblSugerencias3.SelectedItem.ToString();
                }
                txtAspecto.TextChanged += new TextChangedEventHandler(txtAspecto_TextChanged);
            }

        }

        private void mnuitmGuardar_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show(cmbAnio.SelectedItem.ToString() + cmbMes.SelectedItem.ToString() + cmbDia.SelectedItem.ToString()  + 
                cmbParteReunion.SelectedItem.ToString() + cmbAsignacion.SelectedItem.ToString() + txtAsignado.Text + txtAyudante.Text +
              txtAspecto.Text + cmbSala.SelectedItem.ToString()
                );

            String connectionString = ConfigurationManager.ConnectionStrings["WT"].ConnectionString;
            MySqlConnection sql_conn = new MySqlConnection(connectionString);



            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = sql_conn;
            cmd.CommandText = "Programa_Add";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("inIdCongregacion", 1);
            cmd.Parameters["inIdCongregacion"].Direction = ParameterDirection.Input;

            if (Convert.ToInt32(cmbDia.SelectedIndex) != -1)
            {

                var date = DateTime.Parse(cmbDia.SelectedItem.ToString());
                string m = date.ToString("yyyy-MM-dd");

                cmd.Parameters.AddWithValue("inFecha", m);
                cmd.Parameters["inFecha"].Direction = ParameterDirection.Input;
            }
            else
            {
                cmd.Parameters.AddWithValue("inFecha", 0);
                cmd.Parameters["inFecha"].Direction = ParameterDirection.Input;
            }

            cmd.Parameters.AddWithValue("inTema", cmbAsignacion.SelectedItem.ToString());
            cmd.Parameters["inTema"].Direction = ParameterDirection.Input;

            cmd.Parameters.AddWithValue("inSala", cmbSala.SelectedItem.ToString());
            cmd.Parameters["inSala"].Direction = ParameterDirection.Input;

            cmd.Parameters.AddWithValue("inAspecto", txtAspecto.Text);
            cmd.Parameters["inAspecto"].Direction = ParameterDirection.Input;

            cmd.Parameters.AddWithValue("inAsignado", txtAsignado.Text);
            cmd.Parameters["inAsignado"].Direction = ParameterDirection.Input;
            
            cmd.Parameters.AddWithValue("inAyudante", txtAyudante.Text);
            cmd.Parameters["inAyudante"].Direction = ParameterDirection.Input;


            sql_conn.Open();

            MySqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            //DataTable dt = new DataTable();
            //dt.Load(rdr);

            sql_conn.Close();

            FillGrid();

            
        }

     


        
        
       
    }
}
