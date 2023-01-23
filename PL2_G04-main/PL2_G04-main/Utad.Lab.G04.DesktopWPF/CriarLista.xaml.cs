using System;
using System.Collections;
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
using ReactiveUI;
using Syncfusion.SfSkinManager;
using Syncfusion.Windows.Shared;
using Syncfusion.Windows.Tools.Controls;
using Utad.Lab.G04.Domain.ViewModels;

namespace Utad.Lab.G04.DesktopWPF
{
    public partial class CriarLista : ChromelessWindow, IViewFor<ViewModel>
    {

        public static readonly DependencyProperty ViewModelProperty = DependencyProperty
            .Register(nameof(ViewModel), typeof(ViewModel), typeof(CriarLista));

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
        public CriarLista(string titulo)
        {
            InitializeComponent();
            SfSkinManager.SetTheme(this, new FluentTheme() { ThemeName = "FluentDark", ShowAcrylicBackground = true });

            ViewModel = new ViewModel();


            this.WhenActivated(disposable =>   //disposable para evitar memory leaks
            {
                //vm: ViewModel, v: View (CriarLista)

                this.Bind(ViewModel, vm => vm.ListaDescricao, v => v.TBDesc.Text).DisposeWith(disposable);


                //Bind do Comando para Adicionar Produto
                this.BindCommand(ViewModel, vm => vm.CmdOpenAddItem, v => v.BTNAddItem).DisposeWith(disposable);
                this.BindCommand(ViewModel, vm => vm.CmdCloseDlg, v => v.BTNCancela).DisposeWith(disposable);



                if (!string.IsNullOrEmpty(titulo))
                {
                    ViewModel.LD = titulo;
                    TBDesc.Text = titulo;
                    NL.Content = "Editar Lista";


                    CVItems.Items.Clear();
                    ViewModel.Produtos.Clear();
                    ViewModel.CmdMostraItems.Execute().Subscribe();


                    foreach (var item in ViewModel.Produtos)
                    {
                        Button delBTN = new Button();
                        delBTN.Content = "Apagar";
                        delBTN.Width = 50;
                        delBTN.Margin = new Thickness(2);
                        delBTN.Name = item.Value.Descricao + "_" +
                                      item.Value.Quantidade.ToString() + "_" +
                                      item.Value.Categoria.Replace(" ", "_");
                        delBTN.HorizontalAlignment = HorizontalAlignment.Right;
                        delBTN.Click += DelBTN_Click;

                        Button editBTN = new Button();
                        editBTN.Content = "Editar";
                        editBTN.Width = 50;
                        editBTN.Margin = new Thickness(2);
                        editBTN.Name = item.Value.Descricao + "_" +
                                       item.Value.Quantidade.ToString() + "_" +
                                       item.Value.Categoria.Replace(" ", "_"); ;
                        editBTN.HorizontalAlignment = HorizontalAlignment.Right;
                        editBTN.Click += EditBTN_Click;

                        CardViewItem CVI = new CardViewItem();
                        CVI.Header = item.Key;
                        CVI.HorizontalAlignment = HorizontalAlignment.Right;

                        Label desc = new Label();
                        desc.Content = "Quantidade: " + item.Value.Quantidade.ToString()
                                     + "\n"
                                     + "Categoria: " + item.Value.Categoria.ToString();

                        StackPanel SP = new StackPanel();
                        SP.Children.Add(desc);
                        SP.Children.Add(editBTN);
                        SP.Children.Add(delBTN);

                        CVI.Content = SP;

                        CVItems.Items.Add(CVI);
                    }
                }

                switch (NL.Content)
                {
                    case "Nova Lista":
                        //Bind das Listas (adicionar)
                        //Bind do Comando para Adicionar Lista
                        //Bind da Descricao
                        this.Bind(ViewModel, vm => vm.ListaDescricao, v => v.TBDesc.Text).DisposeWith(disposable);
                        this.BindCommand(ViewModel, vm => vm.CmdAddLista, v => v.BTNConcluido).DisposeWith(disposable);
                        break;
                    case "Editar Lista":
                        //Bind das Listas (para editar)
                        //Bind da Descricao

                        this.BindCommand(ViewModel, vm => vm.CmdEditLista, v => v.BTNConcluido).DisposeWith(disposable);
                        break;
                }

            });

            ViewModel.CmdAddLista
               .Where(val => val == true)
              .Subscribe(val =>
              {

                  ErrorLBL.Visibility = Visibility.Hidden;
                  DialogResult = val;
                  this.Close();
              });

            ViewModel.CmdAddLista
               .Where(val => val == false)
              .Subscribe(val =>
              {
                  ErrorLBL.Visibility = Visibility.Visible;
              });

            ViewModel.CmdEditLista
               .Where(val => val == true)
              .Subscribe(val =>
              {

                  ErrorLBL.Visibility = Visibility.Hidden;
                  DialogResult = val;
                  this.Close();
              });

            ViewModel.CmdEditLista
               .Where(val => val == false)
              .Subscribe(val =>
              {
                  ErrorLBL.Visibility = Visibility.Visible;
              });

            ViewModel.CmdCloseDlg
            .Where(val => val != true)
            .Subscribe(val => { this.Close(); });

            ViewModel.CmdOpenAddItem
              .Where(val => val == true)
             .Subscribe(val =>
             {
                 JanelaProduto dlg = new JanelaProduto(TBDesc.Text, "", "", ViewModel.ListaDescricao); if (dlg.ShowDialog() == val)
                 {
                     this.Show();
                     CVItems.Items.Clear();
                     ViewModel.Produtos.Clear();
                     ViewModel.CmdMostraItems.Execute().Subscribe();


                     foreach (var item in ViewModel.Produtos)
                     {
                         Button delBTN = new Button();
                         delBTN.Content = "Apagar";
                         delBTN.Width = 50;
                         delBTN.Margin = new Thickness(2);
                         delBTN.Name = item.Value.Descricao + "_" +
                                       item.Value.Quantidade.ToString() + "_" +
                                       item.Value.Categoria.Replace(" ", "_");
                         delBTN.HorizontalAlignment = HorizontalAlignment.Right;
                         delBTN.Click += DelBTN_Click;

                         Button editBTN = new Button();
                         editBTN.Content = "Editar";
                         editBTN.Width = 50;
                         editBTN.Margin = new Thickness(2);
                         editBTN.Name = item.Value.Descricao + "_" +
                                        item.Value.Quantidade.ToString() + "_" +
                                        item.Value.Categoria.Replace(" ", "_"); ;
                         editBTN.HorizontalAlignment = HorizontalAlignment.Right;
                         editBTN.Click += EditBTN_Click;

                         CardViewItem CVI = new CardViewItem();
                         CVI.Header = item.Key;
                         CVI.HorizontalAlignment = HorizontalAlignment.Right;

                         Label desc = new Label();
                         desc.Content = "Quantidade: " + item.Value.Quantidade.ToString()
                                      + "\n"
                                      + "Categoria: " + item.Value.Categoria.ToString();

                         StackPanel SP = new StackPanel();
                         SP.Children.Add(desc);
                         SP.Children.Add(editBTN);
                         SP.Children.Add(delBTN);

                         CVI.Content = SP;

                         CVItems.Items.Add(CVI);
                     }

                 }


             });

        }

        private void DelBTN_Click(object sender, RoutedEventArgs e)
        {
            Button button = (Button)sender;
            var fullname = button.Name.Split("_");
            string name = fullname[0];
            ViewModel.PD = name;
            ViewModel.LD = ViewModel.ListaDescricao;



            if (MessageBox.Show("Deseja apagar o item " + name + "?",
                "Apagar Item",
                MessageBoxButton.YesNo,
                MessageBoxImage.Question) == MessageBoxResult.Yes)
            {

                ViewModel.CmdDelItem
               .Execute()
               .Where(val => val == true)
           .Subscribe(val =>
           {

               MessageBox.Show("Item " + name + " apagado", "Item Apagado", MessageBoxButton.OK, MessageBoxImage.Information);

               CVItems.Items.Clear();


               ViewModel.Produtos.Clear();
               ViewModel.CmdMostraItems.Execute().Subscribe();
               foreach (var item in ViewModel.Produtos)
               {
                   Button delBTN = new Button();
                   delBTN.Content = "Apagar";
                   delBTN.Width = 50;
                   delBTN.Margin = new Thickness(2);
                   delBTN.Name = item.Value.Descricao + "_" +
                                 item.Value.Quantidade.ToString() + "_" +
                                 item.Value.Categoria.Replace(" ", "_");
                   delBTN.HorizontalAlignment = HorizontalAlignment.Right;
                   delBTN.Click += DelBTN_Click;

                   Button editBTN = new Button();
                   editBTN.Content = "Editar";
                   editBTN.Width = 50;
                   editBTN.Margin = new Thickness(2);
                   editBTN.Name = item.Value.Descricao + "_" +
                                  item.Value.Quantidade.ToString() + "_" +
                                  item.Value.Categoria.Replace(" ", "_"); ;
                   editBTN.HorizontalAlignment = HorizontalAlignment.Right;
                   editBTN.Click += EditBTN_Click;

                   CardViewItem CVI = new CardViewItem();
                   CVI.Header = item.Key;
                   CVI.HorizontalAlignment = HorizontalAlignment.Right;

                   Label desc = new Label();
                   desc.Content = "Quantidade: " + item.Value.Quantidade.ToString()
                                + "\n"
                                + "Categoria: " + item.Value.Categoria.ToString();

                   StackPanel SP = new StackPanel();
                   SP.Children.Add(desc);
                   SP.Children.Add(editBTN);
                   SP.Children.Add(delBTN);

                   CVI.Content = SP;

                   CVItems.Items.Add(CVI);
               }

           });
            }
        }

        private void EditBTN_Click(object sender, RoutedEventArgs e)
        {
            Button button = (Button)sender;
            var fullname = button.Name.Split("_");
            string desc = fullname[0];
            string quant = fullname[1];
            string cat = fullname[2];
            if (fullname.Count() == 5)
            {
                cat = fullname[2] + "_" + fullname[3] + "_" + fullname[4];
            }
            ViewModel.PD = desc;
            ViewModel.PQ = quant;
            ViewModel.PC = cat;
            ViewModel.LD = ViewModel.ListaDescricao;


            JanelaProduto dlg = new JanelaProduto(desc, quant, cat, ViewModel.ListaDescricao);
            if (dlg.ShowDialog() == true)
            {
                MessageBox.Show("Produto " + desc + " alterado", "Lista Alterada", MessageBoxButton.OK, MessageBoxImage.Information);
                CVItems.Items.Clear();


                ViewModel.Produtos.Clear();
                ViewModel.CmdMostraItems.Execute().Subscribe();
                foreach (var item in ViewModel.Produtos)
                {
                    Button delBTN = new Button();
                    delBTN.Content = "Apagar";
                    delBTN.Width = 50;
                    delBTN.Margin = new Thickness(2);
                    delBTN.Name = item.Value.Descricao + "_" +
                                  item.Value.Quantidade.ToString() + "_" +
                                  item.Value.Categoria.Replace(" ", "_");
                    delBTN.HorizontalAlignment = HorizontalAlignment.Right;
                    delBTN.Click += DelBTN_Click;

                    Button editBTN = new Button();
                    editBTN.Content = "Editar";
                    editBTN.Width = 50;
                    editBTN.Margin = new Thickness(2);
                    editBTN.Name = item.Value.Descricao + "_" +
                                   item.Value.Quantidade.ToString() + "_" +
                                   item.Value.Categoria.Replace(" ", "_"); ;
                    editBTN.HorizontalAlignment = HorizontalAlignment.Right;
                    editBTN.Click += EditBTN_Click;

                    CardViewItem CVI = new CardViewItem();
                    CVI.Header = item.Key;
                    CVI.HorizontalAlignment = HorizontalAlignment.Right;

                    Label descL = new Label();
                    descL.Content = "Quantidade: " + item.Value.Quantidade.ToString()
                                 + "\n"
                                 + "Categoria: " + item.Value.Categoria.ToString();

                    StackPanel SP = new StackPanel();
                    SP.Children.Add(descL);
                    SP.Children.Add(editBTN);
                    SP.Children.Add(delBTN);

                    CVI.Content = SP;

                    CVItems.Items.Add(CVI);
                }
            }
        }
    }
}
