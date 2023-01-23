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
    /// Page to reset old password
    /// </summary>
    [Preserve(AllMembers = true)]
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class EditProfile : IViewFor<ViewModel>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="EditProfile" /> class.
        /// </summary>
        /// 

        public static readonly BindableProperty ViewModelProperty = BindableProperty
        .Create(nameof(ViewModel), typeof(ViewModel), typeof(EditProfile));

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
        public EditProfile()
        {
            this.InitializeComponent();

            ViewModel = new ViewModel();

            this.WhenActivated(disposable =>   //disposable para evitar memory leaks
            {
                //vm: ViewModel, v: View (Login)

                //Bind do Nome
                this.Bind(ViewModel, vm => vm.Nome, v => v.NameEntry.Text).DisposeWith(disposable);

                //Bind da Password
                this.Bind(ViewModel, vm => vm.Password, v => v.NewPasswordEntry.Text).DisposeWith(disposable);
                
                //Bind da Password Confirm
                this.Bind(ViewModel, vm => vm.PasswordConfirm, v => v.ConfirmNewPasswordEntry.Text).DisposeWith(disposable);

                this.Bind(ViewModel, vm => vm.ErroCredenciais, v => v.ConfirmPasswordValidationLabel.Text).DisposeWith(disposable);

                this.BindCommand(ViewModel, vm => vm.CmdEdit, v => v.btnAlterar).DisposeWith(disposable);

            });
        }

        private async void BtX_Clicked(object sender, System.EventArgs e)
        {
            await Navigation.PushModalAsync(new NavigationPage(new ProfilePage()));
        }

        private async void BtEdit_clicked(object sender, System.EventArgs e)
        {
            await Navigation.PushModalAsync(new NavigationPage(new LoginPage()));
        }
    }
}