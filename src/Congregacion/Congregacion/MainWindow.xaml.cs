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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Congregacion
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            //Login ingreso = new Login();
            //ingreso.Tag = "vg";
            //ingreso.ShowDialog();
            Programa from = new Programa();
            from.ShowDialog();
            
        }

        private void Salir_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void frmSalon_Click(object sender, RoutedEventArgs e)
        {
            Salon form = new Salon();
            form.ShowDialog();
        }

        private void frmCongregacion_Click(object sender, RoutedEventArgs e)
        {
            Congregacion form = new Congregacion();
            form.ShowDialog();
        }


        private void frmPersona_Click(object sender, RoutedEventArgs e)
        {
            Persona form = new Persona();
            form.ShowDialog();
        }

        private void frmEmtSala_Click(object sender, RoutedEventArgs e)
        {
            emtSala form = new emtSala();
            form.ShowDialog();
        }

        private void frmPrograma_Click(object sender, RoutedEventArgs e)
        {
            Programa from = new Programa();
            from.ShowDialog();
        }

        
        
    }
}
