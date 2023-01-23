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
    /// Page to show the setting.
    /// </summary>
    [Preserve(AllMembers = true)]
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PrimeiraPagina : ContentPage, IViewFor<ViewModel>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="PrimeiraPagina" /> class.
        /// </summary>

        public static readonly BindableProperty ViewModelProperty = BindableProperty
            .Create(nameof(ViewModel), typeof(ViewModel), typeof(PrimeiraPagina));

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

        public PrimeiraPagina()
        {
            this.InitializeComponent();

            ViewModel = new ViewModel();

            this.WhenActivated(disposable =>   //disposable para evitar memory leaks
            {
                //vm: ViewModel, v: View (Login)

                //Bind do Comando para Login
                this.BindCommand(ViewModel, vm => vm.CmdOpenPerfil, v => v.btnPerfil).DisposeWith(disposable);

                //Bind do Comando para Registo
                this.BindCommand(ViewModel, vm => vm.CmdOpenListas, v => v.btnListas).DisposeWith(disposable);

                this.BindCommand(ViewModel, vm => vm.CmdLogout, v => v.btnLogout).DisposeWith(disposable);

            });

            ViewModel.CmdLogout
               .Where(val => val != true)
             .Subscribe(val =>
             {
                 Navigation.PushModalAsync(new NavigationPage(new LoginPage()));
             });

            ViewModel.CmdOpenEditarPerfil
               .Where(val => val != true)
             .Subscribe(val =>
             {
                 Navigation.PushModalAsync(new NavigationPage(new ProfilePage()));
             });

            ViewModel.CmdOpenListas
               .Where(val => val == true)
             .Subscribe(val =>
             {
                 Navigation.PushModalAsync(new NavigationPage(new ListasDeCompras()));
             });
        }
    }
}