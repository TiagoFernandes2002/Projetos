using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Internals;
using Xamarin.Forms.Xaml;

namespace Utad.Lab.G04.MobileDroid.Views
{
    public partial class MainPage : ContentPage
    {

        //public ObservableCollection<string> lista { get; set; } = new ObservableCollection<string>();

        public MainPage()
        {
            //InitializeComponent();


            //LvFeed.ItemsSource = lista;

            //lista.Add("Feed 1");
            //lista.Add("Feed 2");
            //lista.Add("Feed 3");
        }
        private async void BtX_Clicked(object sender, System.EventArgs e)
        {
            await Navigation.PushModalAsync(new NavigationPage(new ProfilePage()));
        }
        /*
        private async void Add_Clicked(object sender, EventArgs e)
        {            
            string Name = await DisplayPromptAsync("Feed Name", "Introduza o nome do Feed");
            string Link = await DisplayPromptAsync("Feed Link", "Introduza o Link do Feed");
            if(Name != string.Empty && Name != null)
                lista.Add(Name);           
        }

        private async void LvFeed_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            string[] butons = new string[3];
            butons[0] = "Abrir";
            butons[1] = "Apagar";
            butons[2] = "Editar";

            string choice = await DisplayActionSheet(Convert.ToString(LvFeed.SelectedItem),"Cancel","",butons);           

            if(choice == "Apagar")
            {
                lista.Remove(Convert.ToString(LvFeed.SelectedItem));
            }

            else if(choice == "Editar")
            {
                string Name = await DisplayPromptAsync("Feed Name", "Introduza o nome do Feed");
                string Link = await DisplayPromptAsync("Feed Link", "Introduza o Link do Feed");

                lista[lista.IndexOf(Convert.ToString(LvFeed.SelectedItem))] = Name;                               
            }

            else if(choice == "Abrir")
            {
                await Navigation.PushAsync(new FeedPage(lista.IndexOf(Convert.ToString(LvFeed.SelectedItem))));
            }

        }

        private async void Notification_Clicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Notifications());
        }

        private async void Perfil_Clicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Perfil());
        }*/
    }
}
