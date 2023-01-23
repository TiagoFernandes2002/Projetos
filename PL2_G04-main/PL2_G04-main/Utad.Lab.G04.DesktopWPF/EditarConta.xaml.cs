using System;
using System.Collections.Generic;
using System.Linq;
using System.Reactive.Disposables;
using System.Reactive.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Microsoft.Win32;
using ReactiveUI;
using Syncfusion.Windows.Shared;
using Utad.Lab.G04.Domain.ViewModels;

namespace Utad.Lab.G04.DesktopWPF
{
    /// <summary>
    /// Interaction logic for EditarConta.xaml
    /// </summary>
    /// 
    public partial class EditarConta : ChromelessWindow, IViewFor<ViewModel>
    {

        public static readonly DependencyProperty ViewModelProperty = DependencyProperty
            .Register(nameof(ViewModel), typeof(ViewModel), typeof(EditarConta));

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

        public EditarConta(string _Nome, string _Email)
        {
            InitializeComponent();

            ViewModel = new ViewModel();


            this.WhenActivated(disposable =>   //disposable para evitar memory leaks
            {
                //vm: ViewModel, v: View (Register)

                //TBNome.Text = _Nome;
                //TBMail.Text = _Email;
                ViewModel.Nome = _Nome;
                ViewModel.Email = _Email;

                //Bind do Email
                this.Bind(ViewModel, vm => vm.Email, v => v.TBMail.Text).DisposeWith(disposable);

                //Bind do Nome
                this.Bind(ViewModel, vm => vm.Nome, v => v.TBNome.Text).DisposeWith(disposable);

                //Bind da Password
                this.Bind(ViewModel, vm => vm.Password, v => v.TBPassword.Text).DisposeWith(disposable);

                //Bind da Password Confirm
                this.Bind(ViewModel, vm => vm.PasswordConfirm, v => v.TBPasswordConf.Text).DisposeWith(disposable);

                //Bind da Password Confirm
                this.OneWayBind(ViewModel, vm => vm.ErroCredenciais, v => v.LabelPasswordError.Content).DisposeWith(disposable);

                //Bind do Comando para Alterar
                this.BindCommand(ViewModel, vm => vm.CmdEdit, v => v.BTNEditar).DisposeWith(disposable);

            });

            //abre o edit
            ViewModel.CmdEdit
                .Where(val => val != false)
                .Subscribe(val =>
                {

                    DialogResult = val;

                });

        }

    }
}
