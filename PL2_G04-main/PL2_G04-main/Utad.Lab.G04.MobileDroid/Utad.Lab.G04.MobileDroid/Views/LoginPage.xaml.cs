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
    /// Page to login with user name and password
    /// </summary>
    [Preserve(AllMembers = true)]
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class LoginPage : IViewFor<ViewModel>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="LoginPage" /> class.
        /// </summary>

        public static readonly BindableProperty ViewModelProperty = BindableProperty
        .Create(nameof(ViewModel), typeof(ViewModel), typeof(LoginPage));

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

        public LoginPage()
        {
            InitializeComponent();

            ViewModel = new ViewModel();

            this.WhenActivated(disposable =>   //disposable para evitar memory leaks
                {
                    //vm: ViewModel, v: View (Login)

                    //Bind do Email
                    this.Bind(ViewModel, vm => vm.Email, v => v.EmailEntry.Text).DisposeWith(disposable);

                    //Bind da Password
                    this.Bind(ViewModel, vm => vm.Password, v => v.PasswordEntry.Text).DisposeWith(disposable);

                    //Bind do Erro: Apenas usa One Way
                    this.OneWayBind(ViewModel, vm => vm.ErroCredenciais, v => v.ValidationLabel.Text).DisposeWith(disposable);

                    //Bind do Comando para Login
                    this.BindCommand(ViewModel, vm => vm.CmdLogin, v => v.btnLogin).DisposeWith(disposable);

                    //Bind do Comando para Registo
                    this.BindCommand(ViewModel, vm => vm.CmdOpenRegisto, v => v.btnRegister).DisposeWith(disposable);

                });

            ViewModel.CmdOpenRegisto.Where(val => val != false).Subscribe(val =>
            { ViewModel.ErroCredenciais = ""; Navigation.PushModalAsync(new NavigationPage(new RegisterPage())); });

            ViewModel.CmdLogin.Where(val => val == false).Subscribe(val => { Navigation.PushModalAsync(new NavigationPage(new PrimeiraPagina())); });

        }

        //private async void BtRegister_Clicked(object sender, System.EventArgs e)
        //{
        //    ViewModel.CmdOpenRegisto.Where(val => val != false).Subscribe(val => 
        //    { ViewModel.ErroCredenciais = ""; Navigation.PushModalAsync(new NavigationPage(new RegisterPage())); });
        //    //.Where(val => val != false)
        //    //.Subscribe(val =>
        //    //{

        //    //});   
            

        //}

        //private async void BtLogin_Clicked(object sender, EventArgs e)
        //{
        //    ViewModel.CmdLogin.Where(val => val != false).Subscribe(val => { Navigation.PushModalAsync(new NavigationPage(new MainPage())); });

        //}
    }
}