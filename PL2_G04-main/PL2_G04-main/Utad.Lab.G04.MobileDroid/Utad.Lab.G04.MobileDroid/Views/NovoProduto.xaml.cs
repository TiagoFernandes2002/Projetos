using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Syncfusion.XForms.ComboBox;

namespace Utad.Lab.G04.MobileDroid.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class NovoProduto : ContentPage
    {
        public NovoProduto()
        {
            InitializeComponent();
            ////StackLayout mainLayout = new StackLayout() { Padding = new Thickness(0, 30, 0, 0) };
            //SfComboBox comboBox = new SfComboBox();
            //cbNovoProduto.ComboBoxSource = new List<string>() { 
            //                "Charcutaria",
            //                "Congelados",
            //                "Frutas e Legumes",
            //                "Limpeza",
            //                "Padaria",
            //                "Peixaria",
            //                "Higiene",
            //                "Bebidas",
            //                "Laticínios",
            //                "Bricolage",
            //                "Animais"
            //};
            //comboBox.IsEditableMode = true;
            //comboBox.AllowFiltering = true;
            //comboBox.HeightRequest = 40;
            //comboBox.NoResultsFoundText = "Categoria não encontrada";
            ////mainLayout.Children.Add(comboBox);
            ////this.Content = mainLayout;
        }

        private async void btnCancelar(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new Lista());
        }
    }
}