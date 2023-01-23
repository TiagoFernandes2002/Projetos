using ReactiveUI;
using System;
using System.Collections.Generic;
using System.Linq;
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
using Syncfusion.Windows.Shared;
using Utad.Lab.G04.Domain.ViewModels;
using System.Reactive.Disposables;
using System.Reactive.Linq;

namespace Utad.Lab.G04.DesktopWPF
{

    public partial class Login : ChromelessWindow, IViewFor<ViewModel>
    {

        public static readonly DependencyProperty ViewModelProperty = DependencyProperty
            .Register(nameof(ViewModel), typeof(ViewModel), typeof(Login));

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

        public Login()
        {
            InitializeComponent();

            ViewModel = new ViewModel();


            this.WhenActivated(disposable =>   //disposable para evitar memory leaks
            {
                //vm: ViewModel, v: View (Login)

                //Bind do Email
                this.Bind(ViewModel, vm => vm.Email, v => v.TBMail.Text).DisposeWith(disposable);

                //Bind da Password
                this.Bind(ViewModel, vm => vm.Password, v => v.TBPassword.Text).DisposeWith(disposable);

                //Bind do Erro: Apenas usa One Way
                this.OneWayBind(ViewModel, vm => vm.ErroCredenciais, v => v.LabelLoginFailed.Content).DisposeWith(disposable);

                //Bind do Comando para Login
                this.BindCommand(ViewModel, vm => vm.CmdLogin, v => v.BTNLogin).DisposeWith(disposable);

                //Bind do Comando para Registo
                this.BindCommand(ViewModel, vm => vm.CmdOpenRegisto, v => v.BTNRegister).DisposeWith(disposable);

            });

            //verifica as credenciais
            ViewModel.CmdLogin
                .Where(val => val != false)
                .Subscribe(val =>
                {
                    DialogResult = val;
                });

            //abre o registo
            ViewModel.CmdOpenRegisto
                .Where(val => val != false)
                .Subscribe(val => { ViewModel.ErroCredenciais = ""; this.Hide(); Registar dlg = new Registar(); if (dlg.ShowDialog() == true) { this.ShowDialog(); } });
        }
    }

}

