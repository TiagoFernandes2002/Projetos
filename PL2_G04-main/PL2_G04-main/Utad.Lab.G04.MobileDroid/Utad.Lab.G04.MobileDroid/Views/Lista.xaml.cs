using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Internals;
using Xamarin.Forms.Xaml;
using Utad.Lab.G04.MobileDroid.ViewModels;

namespace Utad.Lab.G04.MobileDroid.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Lista : ContentPage
    {
 

        public Lista()
        {
            InitializeComponent();
        }

        private async void Button_Clicked(object sender, EventArgs e)
        {

            await Navigation.PushModalAsync(new NovoProduto());
            
        }

        private void mi_cliked(object sender, EventArgs e)
        {

        }

        private void lvSelected(object sender, SelectedItemChangedEventArgs e)
        {

        }

        private async void backButton_Clicked(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new NavigationPage(new ListasDeCompras()));
        }
    }
}