using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
using ReactiveUI;
using Syncfusion.SfSkinManager;
using Syncfusion.Windows.Shared;
using Syncfusion.Windows.Tools.Controls;
using Utad.Lab.G04.Domain.Models;
using Utad.Lab.G04.Domain.ViewModels;

namespace Utad.Lab.G04.DesktopWPF
{
    public partial class JanelaProduto : ChromelessWindow, IViewFor<ViewModel>
    {

        public static readonly DependencyProperty ViewModelProperty = DependencyProperty
            .Register(nameof(ViewModel), typeof(ViewModel), typeof(JanelaProduto));

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

        public JanelaProduto(string desc, string quant, string cat, string listaD)
        {
            InitializeComponent();

            ViewModel = new ViewModel();


            this.WhenActivated(disposable =>   //disposable para evitar memory leaks
            {
                //vm: ViewModel, v: View (JanelaProduto)

                CBCat.SelectionChanged += CBCatSelectionChanged;


                this.BindCommand(ViewModel, vm => vm.CmdShowCats, v => v.CBCat).DisposeWith(disposable);

                this.BindCommand(ViewModel, vm => vm.CmdCloseDlg, v => v.BTNCancela).DisposeWith(disposable);

                if (!string.IsNullOrEmpty(desc) && !string.IsNullOrEmpty(quant) && !string.IsNullOrEmpty(cat))
                {
                    LBP.Content = "Editar Produto";
                    TBDesc.Text = desc;
                    ViewModel.PD = desc;
                    ViewModel.ItemDescricao = desc;

                    TBQuant.Text = quant;
                    ViewModel.PQ = quant;

                    CBCat.SelectedValue = cat.Replace("_", " ");

                }
                ViewModel.PC = cat.Replace("_", " ");

                switch (LBP.Content)
                {
                    case "Novo Produto":
                        //Bind dos Produtos (adicionar)
                        this.Bind(ViewModel, vm => vm.ItemDescricao, v => v.TBDesc.Text).DisposeWith(disposable);
                        this.Bind(ViewModel, vm => vm.ItemQuantidade, v => v.TBQuant.Text).DisposeWith(disposable);
                        if (NewCatBox.IsVisible)
                        {
                            this.Bind(ViewModel, vm => vm.ItemCat, v => v.TBNewCat.Text).DisposeWith(disposable);
                            CBCat.SelectedValue = "Outra";
                        }
                        else
                        {
                            this.Bind(ViewModel, vm => vm.ItemCat, v => v.CBCat.SelectedValue).DisposeWith(disposable);
                        }

                        this.BindCommand(ViewModel, vm => vm.CmdAddItem, v => v.BTNConcluido).DisposeWith(disposable);


                        break;
                    case "Editar Produto":
                        //Bind dos Produtos (para editar)
                        this.Bind(ViewModel, vm => vm.PD, v => v.TBDesc.Text).DisposeWith(disposable);
                        this.Bind(ViewModel, vm => vm.PQ, v => v.TBQuant.Text).DisposeWith(disposable);

                        if (NewCatBox.IsVisible)
                        {
                            this.Bind(ViewModel, vm => vm.PC, v => v.TBNewCat.Text).DisposeWith(disposable);
                            CBCat.SelectedValue = "Outra";
                        }
                        else
                        {
                            this.Bind(ViewModel, vm => vm.PC, v => v.CBCat.SelectedValue).DisposeWith(disposable);
                        }

                        this.BindCommand(ViewModel, vm => vm.CmdEditItem, v => v.BTNConcluido).DisposeWith(disposable);
                        break;
                }

                void CBCatSelectionChanged(object sender, SelectionChangedEventArgs e)
                {
                    ComboBoxAdv cb = (ComboBoxAdv)sender;

                    if (CBCat.SelectedValue == null)
                    {
                        CBCat.SelectedValue = "Outra";

                    }

                    if (CBCat.SelectedValue.ToString() == "Outra")
                    {

                        NewCatBox.Visibility = Visibility.Visible;
                        TBNewCat.Visibility = Visibility.Visible;
                        this.Bind(ViewModel, vm => vm.PC, v => v.TBNewCat.Text).DisposeWith(disposable);
                        return;
                    }
                    else
                    {
                        NewCatBox.Visibility = Visibility.Hidden;
                        TBNewCat.Visibility = Visibility.Hidden;
                        CBCat.SelectedValue = cb.SelectedValue;
                        ViewModel.PC = cb.SelectedValue.ToString();
                        //this.Bind(ViewModel, vm => vm.PC, v => v.CBCat.SelectedValue).DisposeWith(disposable);
                        return;
                    }

                }


            });



            ViewModel.ListaDescricao = listaD;

            ViewModel.CmdAddItem
              .Subscribe(val =>
              {
                  if (val)
                  {
                      DialogResult = val;
                      this.Close();
                  }
                  else
                  {
                      LDadosErrados.Visibility = Visibility.Visible;
                  }

              });

            ViewModel.CmdEditItem
             .Subscribe(val =>
             {
                 if (val)
                 {
                     DialogResult = val;
                     this.Close();
                 }
                 else
                 {
                     LDadosErrados.Visibility = Visibility.Visible;
                 }

             });

            ViewModel.CmdCloseDlg
          .Where(val => val != true)
          .Subscribe(val => { this.Close(); });

            ViewModel.CmdShowCats
                .Execute()
                .Where(val => val == true)
               .Subscribe(val =>
               {
                   foreach (var cat in ViewModel.Cat.Descricao)
                   {
                       CBCat.Items.Add(cat);
                   }
               });
        }


    }

}

