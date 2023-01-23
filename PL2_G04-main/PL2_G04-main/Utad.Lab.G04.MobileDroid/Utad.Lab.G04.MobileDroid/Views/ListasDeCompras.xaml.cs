using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Utad.Lab.G04.MobileDroid.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class ListasDeCompras : ContentPage
    {
        public ListasDeCompras()
        {
            InitializeComponent();
        }

        private async void btnCriarLista(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new NavigationPage(new CriarLista()));
        }

        private async void btnEditarLista(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new EditarLista());
        }

        private void btnApagarLista(object sender, EventArgs e)
        {
            //
        }


        private async void lvListas_ItemTapped(object sender, Syncfusion.ListView.XForms.ItemTappedEventArgs e)
        {
            await Navigation.PushModalAsync(new Lista());
        }

        private async void btnMenu(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new PrimeiraPagina());
        }

        private void lvLista_ItemHolded(object sender, Syncfusion.ListView.XForms.ItemHoldingEventArgs e)
        {

        }
    }
}