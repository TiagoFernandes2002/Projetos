using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utad.Lab.G04.Domain.ViewModels;
using Xamarin.Forms;
using Xamarin.Forms.Internals;
using Xamarin.Forms.Xaml;
using ReactiveUI;
using System.Reactive.Disposables;
using System.Reactive.Linq;

namespace Utad.Lab.G04.MobileDroid.Views
{
    /// <summary>
    /// This page used for adding Profile image with Name and phone number.
    /// </summary>
    [Preserve(AllMembers = true)]
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class ProfilePage : ContentPage, IViewFor<ViewModel>
    {
        public static readonly BindableProperty ViewModelProperty = BindableProperty
        .Create(nameof(ViewModel), typeof(ViewModel), typeof(ProfilePage));

        public ViewModel ViewModel
        {
            get => (ViewModel)GetValue(ViewModelProperty);
            set => SetValue(ViewModelProperty, value);
        }

        object IViewFor.ViewModel
        {
            get => ViewModel;
            set => ViewModel = (ViewModel)value;
        }
        public ProfilePage()
        {
            this.InitializeComponent();

            ViewModel = new ViewModel();

            //this.WhenActivated(disposable =>   //disposable para evitar memory leaks
            //{
            //    //vm: ViewModel, v: View (Login)

            //    //Bind do Nome
            //    this.Bind(ViewModel, vm => vm., v => v.NameEntry.Text).DisposeWith(disposable);

            //    //Bind da Email
            //    this.Bind(ViewModel, vm => vm.Email, v => v.EmailEntry.Text).DisposeWith(disposable);

            //    //Bind da Password
            //    this.Bind(ViewModel, vm => vm.Password, v => v.PasswordEntry.Text).DisposeWith(disposable);


            //});
        }

        private async void BtEdit_Clicked(object sender, System.EventArgs e)
        {
            await Navigation.PushModalAsync(new NavigationPage(new EditProfile()));
        }

        private async void BtDel_Clicked(object sender, System.EventArgs e)
        {
            await Navigation.PushModalAsync(new NavigationPage(new LoginPage()));
        }

        private async void backButton_Clicked(object sender, System.EventArgs e)
        {
            await Navigation.PushModalAsync(new NavigationPage(new PrimeiraPagina()));
        }
    }
}