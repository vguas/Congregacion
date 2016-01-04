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

namespace Congregacion
{
    /// <summary>
    /// Interaction logic for Persona.xaml
    /// </summary>
    public partial class Persona : Window
    {
        public Persona()
        {
            InitializeComponent();
            LimpiarCampos();
        }

        private void Salir_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void LimpiarCampos()
        {
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtDireccion.Text = "";
            txtTelefono1.Text = "";
            txtTelefono2.Text = "";
            txtMovil1.Text = "";
            txtMovil2.Text = "";
            txtCorreo.Text = "";
            txtCorreo1.Text = "";
            txtConyuge.Text = "";
            chkHombre.IsChecked = false;
            chkPublicador.IsChecked = false;
            chkEscuela.IsChecked = false;
            chkBautizado.IsChecked = false;
            chkSoltero.IsChecked = false;
            dtpFechaNac.SelectedDate = null;
            dtpFechaBau.SelectedDate = null;
            txtNombre.Focus();

            
        }

        private void LimpiarCampos_Click(object sender, RoutedEventArgs e)
        {
            LimpiarCampos();
        }
    }
}
