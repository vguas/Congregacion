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
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        public Login()
        {
            InitializeComponent();
            txtTest.Text = Convert.ToString(this.Tag);
            lblTest.Content = Convert.ToString(this.Tag);
        }

        private void btnCancelar_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
         

            
        }
    }
}
