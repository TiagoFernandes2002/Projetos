using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Utad.Lab.G04.MobileDroid.ViewModels;
using System.Collections.ObjectModel;

namespace Utad.Lab.G04.MobileDroid.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class CriarLista : ContentPage
    {
        
        public CriarLista()
        {   
            
            InitializeComponent();
         
        }

        private async void btnCancelar(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new NavigationPage(new ListasDeCompras()));
        }


        private async void btnNovoProduto(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new NavigationPage(new NovoProduto()));
        }

        

        }
        
    }
    