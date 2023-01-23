using ReactiveUI;
using Syncfusion.SfSkinManager;
using Syncfusion.Windows.Shared;
using Syncfusion.Windows.Tools.Controls;
using System;
using System.Collections.Generic;
using System.IO;
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
using Utad.Lab.G04.Domain.ViewModels;

namespace Utad.Lab.G04.DesktopWPF
{
    public partial class MainWindow : ChromelessWindow, IViewFor<ViewModel>
    {

        public static readonly DependencyProperty ViewModelProperty = DependencyProperty
            .Register(nameof(ViewModel), typeof(ViewModel), typeof(MainWindow));

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

        public MainWindow()
        {

            InitializeComponent();

            ViewModel = new ViewModel();

            this.WhenActivated(disposable =>   //disposable para evitar memory leaks
            {
                //ViewModel: vm, v: View (MainWindow)

                //Bind do Nome
                this.Bind(ViewModel, vm => vm.Nome, v => v.LabelNomeShow.Content).DisposeWith(disposable);

                //Bind do Email
                this.Bind(ViewModel, vm => vm.Email, v => v.TBEmailSHow.Text).DisposeWith(disposable);

                //Bind do Email  (SIDE PANEL)
                this.Bind(ViewModel, vm => vm.Email, v => v.SideEmail.Text).DisposeWith(disposable);

                //Bind do Utilizador  (SIDE PANEL)
                this.Bind(ViewModel, vm => vm.Nome, v => v.SideHeader.Header).DisposeWith(disposable);


                //Bind do Comando para abrir janela de adicionar lsita
                this.BindCommand(ViewModel, vm => vm.CmdLogout, v => v.LogOut).DisposeWith(disposable);

                //Bind do Comando para logOut
                this.BindCommand(ViewModel, vm => vm.CmdOpenAddLista, v => v.BTNAdd).DisposeWith(disposable);

                //Bind do Comando para editarPerfil
                this.BindCommand(ViewModel, vm => vm.CmdOpenEditarPerfil, v => v.BTNEditarPerfil).DisposeWith(disposable);

                //Bind do Comando para apagarPerfil
                this.BindCommand(ViewModel, vm => vm.CmdEliminar, v => v.BTNEliminarPerfil).DisposeWith(disposable);

                //Bind do Comando para mostar painel de perfil / conta
                this.BindCommand(ViewModel, vm => vm.CmdShowConta, v => v.NavConta).DisposeWith(disposable);

                //Bind do Comando para mostar painel de listas
                this.BindCommand(ViewModel, vm => vm.CmdShowListasDash, v => v.NavListas).DisposeWith(disposable);


                if (File.Exists("pfp.png"))
                {
                    PFP.ImageSource = new BitmapImage(new Uri(Directory.GetCurrentDirectory() + "/pfp.png"));
                }
                else
                {
                    PFP.ImageSource = new BitmapImage(new Uri(Directory.GetCurrentDirectory() + "/user.png"));

                }


            });

            ViewModel.CmdIsLogged
                .Execute()
                .Select(val => val ? true : false)
               .Subscribe(val =>
               {
                   if (val != true)
                   {
                       this.Hide();
                       Login dlg = new Login();
                       if (dlg.ShowDialog() == true)
                       {
                           ViewModel.CmdIsLogged.Execute().Subscribe();
                           LabelNomeShow.Content = ViewModel.Nome;
                           TBEmailSHow.Text = ViewModel.Email;

                           SideEmail.Text = ViewModel.Email;
                           SideHeader.Header = ViewModel.Nome;
                           this.Show();

                       }
                       else
                       {
                           this.Close();
                       }
                   }
                   else
                   {
                       LabelNomeShow.Content = ViewModel.Nome;
                       TBEmailSHow.Text = ViewModel.Email;

                       SideEmail.Text = ViewModel.Email;
                       SideHeader.Header = ViewModel.Nome;
                       this.Show();
                   }
               });

            ViewModel.CmdLogout
                .Where(val => val == true)
              .Subscribe(val =>
              {

                  this.Hide(); Login dlg = new Login();
                  if (dlg.ShowDialog() == true) { this.Show(); }
                  else { this.Close(); }
              });

            ViewModel.CmdOpenAddLista
                .Where(val => val == true)
               .Subscribe(val =>
               {
                   CriarLista dlg = new CriarLista("");
                   if (dlg.ShowDialog() == val)
                   {
                       ListasMain.Items.Clear();
                       listaSide.Items.Clear();

                       ViewModel.Listas.Clear();
                       ViewModel.CmdMostraListas.Execute().Subscribe();

                       foreach (var lista in ViewModel.Listas)
                       {
                           Button delBTN = new Button();
                           delBTN.Content = "Apagar";
                           delBTN.Width = 50;
                           delBTN.Margin = new Thickness(2);
                           delBTN.Name = lista.Key;
                           delBTN.HorizontalAlignment = HorizontalAlignment.Right;
                           delBTN.Click += DelBTN_Click;

                           Button editBTN = new Button();
                           editBTN.Content = "Editar";
                           editBTN.Margin = new Thickness(2);
                           editBTN.Width = 50;
                           editBTN.Name = lista.Key;
                           editBTN.HorizontalAlignment = HorizontalAlignment.Right;
                           editBTN.Click += EditBTN_Click;

                           CardViewItem CVI = new CardViewItem();
                           CVI.Header = lista.Key;
                           CVI.HorizontalAlignment = HorizontalAlignment.Right;


                           StackPanel SP = new StackPanel();
                           SP.Orientation = Orientation.Horizontal;
                           SP.HorizontalAlignment = HorizontalAlignment.Right;
                           SP.Children.Add(editBTN);
                           SP.Children.Add(delBTN);

                           CVI.Content = SP;


                           ListasMain.Items.Add(CVI);

                           listaSide.Items.Add(
                                    new CardViewItem()
                                    { Header = lista.Key, Width = 140 });
                       }
                   }
               });

            ViewModel.CmdShowConta
                .Where(val => val == true)
               .Subscribe(val =>
               {
                   conteudo.Visibility = Visibility.Hidden;
                   conta.Visibility = Visibility.Visible;
                   listaSide.Visibility = Visibility.Hidden;
                   contaSide.Visibility = Visibility.Visible;
                   LogOut.Visibility = Visibility.Visible;
                   circ1.Visibility = Visibility.Hidden;
                   circ2.Visibility = Visibility.Hidden;

               });

            ViewModel.CmdShowListasDash
                .Where(val => val == true)
               .Subscribe(val =>
               {
                   conteudo.Visibility = Visibility.Visible;
                   conta.Visibility = Visibility.Hidden;
                   listaSide.Visibility = Visibility.Visible;
                   contaSide.Visibility = Visibility.Hidden;
                   LogOut.Visibility = Visibility.Hidden;
                   circ1.Visibility = Visibility.Visible;
                   circ2.Visibility = Visibility.Visible;

               });

            ViewModel.CmdMostraListas
                .Execute()
                .Where(val => val == true)
               .Subscribe(val =>
               {

                   foreach (var lista in ViewModel.Listas)
                   {
                       Button delBTN = new Button();
                       delBTN.Content = "Apagar";
                       delBTN.Width = 50;
                       delBTN.Margin = new Thickness(2);
                       delBTN.Name = lista.Key;
                       delBTN.HorizontalAlignment = HorizontalAlignment.Right;
                       delBTN.Click += DelBTN_Click;

                       Button editBTN = new Button();
                       editBTN.Content = "Editar";
                       editBTN.Margin = new Thickness(2);
                       editBTN.Width = 50;
                       editBTN.Name = lista.Key;
                       editBTN.HorizontalAlignment = HorizontalAlignment.Right;
                       editBTN.Click += EditBTN_Click;

                       CardViewItem CVI = new CardViewItem();
                       CVI.Header = lista.Key;
                       CVI.HorizontalAlignment = HorizontalAlignment.Right;


                       StackPanel SP = new StackPanel();
                       SP.Orientation = Orientation.Horizontal;
                       SP.HorizontalAlignment = HorizontalAlignment.Right;
                       SP.Children.Add(editBTN);
                       SP.Children.Add(delBTN);

                       CVI.Content = SP;


                       ListasMain.Items.Add(CVI);

                       listaSide.Items.Add(
                                new CardViewItem()
                                { Header = lista.Key, Width = 140 });
                   }

               });



            ViewModel.CmdOpenEditarPerfil
                .Where(val => val == true)
            .Subscribe(val =>
            {
                ViewModel.CmdIsLogged.Execute().Subscribe();
                EditarConta editarContadlg = new EditarConta(ViewModel.Nome, ViewModel.Email);
                editarContadlg.ShowDialog();

                ViewModel.CmdIsLogged.Execute().Subscribe();
                LabelNomeShow.Content = ViewModel.Nome;
                TBEmailSHow.Text = ViewModel.Email;

                SideEmail.Text = ViewModel.Email;
                SideHeader.Header = ViewModel.Nome;

            });


            ViewModel.CmdEliminar
                    .Where(val => val == true)
                  .Subscribe(val =>
                  {

                      this.Hide(); Login dlg = new Login();
                      if (dlg.ShowDialog() == true) { this.Show(); }
                      else { this.Close(); }
                  });

        }

        private void DelBTN_Click(object sender, RoutedEventArgs e)
        {
            Button button = (Button)sender;
            string name = button.Name;
            ViewModel.LD = name;



            if (MessageBox.Show("Deseja apagar a lista " + name + "?",
                "Apagar Lista",
                MessageBoxButton.YesNo,
                MessageBoxImage.Question) == MessageBoxResult.Yes)
            {

                ViewModel.CmdDelLista
               .Execute()
               .Where(val => val == true)
           .Subscribe(val =>
           {

               MessageBox.Show("Lista " + name + " apagada", "Lista Apagada", MessageBoxButton.OK, MessageBoxImage.Information);

               listaSide.Items.Clear();
               ListasMain.Items.Clear();

               ViewModel.Listas.Clear();
               ViewModel.CmdMostraListas.Execute().Subscribe();
               foreach (var lista in ViewModel.Listas)
               {
                   Button delBTN = new Button();
                   delBTN.Content = "Apagar";
                   delBTN.Width = 50;
                   delBTN.Margin = new Thickness(2);
                   delBTN.Name = lista.Key;
                   delBTN.HorizontalAlignment = HorizontalAlignment.Right;
                   delBTN.Click += DelBTN_Click;

                   Button editBTN = new Button();
                   editBTN.Content = "Editar";
                   editBTN.Margin = new Thickness(2);
                   editBTN.Width = 50;
                   editBTN.Name = lista.Key;
                   editBTN.HorizontalAlignment = HorizontalAlignment.Right;
                   editBTN.Click += EditBTN_Click;

                   CardViewItem CVI = new CardViewItem();
                   CVI.Header = lista.Key;
                   CVI.HorizontalAlignment = HorizontalAlignment.Right;


                   StackPanel SP = new StackPanel();
                   SP.Orientation = Orientation.Horizontal;
                   SP.HorizontalAlignment = HorizontalAlignment.Right;
                   SP.Children.Add(editBTN);
                   SP.Children.Add(delBTN);

                   CVI.Content = SP;


                   ListasMain.Items.Add(CVI);

                   listaSide.Items.Add(
                            new CardViewItem()
                            { Header = lista.Key, Width = 140 });
               }

           });
            }
        }

        private void EditBTN_Click(object sender, RoutedEventArgs e)
        {
            Button button = (Button)sender;
            string name = button.Name;


            CriarLista dlg = new CriarLista(name);
            if (dlg.ShowDialog() == true)
            {
                listaSide.Items.Clear();
                ListasMain.Items.Clear();

                ViewModel.Listas.Clear();
                ViewModel.CmdMostraListas.Execute().Subscribe();
                foreach (var lista in ViewModel.Listas)
                {
                    Button delBTN = new Button();
                    delBTN.Content = "Apagar";
                    delBTN.Width = 50;
                    delBTN.Margin = new Thickness(2);
                    delBTN.Name = lista.Key;
                    delBTN.HorizontalAlignment = HorizontalAlignment.Right;
                    delBTN.Click += DelBTN_Click;

                    Button editBTN = new Button();
                    editBTN.Content = "Editar";
                    editBTN.Margin = new Thickness(2);
                    editBTN.Width = 50;
                    editBTN.Name = lista.Key;
                    editBTN.HorizontalAlignment = HorizontalAlignment.Right;
                    editBTN.Click += EditBTN_Click;

                    CardViewItem CVI = new CardViewItem();
                    CVI.Header = lista.Key;
                    CVI.HorizontalAlignment = HorizontalAlignment.Right;


                    StackPanel SP = new StackPanel();
                    SP.Orientation = Orientation.Horizontal;
                    SP.HorizontalAlignment = HorizontalAlignment.Right;
                    SP.Children.Add(editBTN);
                    SP.Children.Add(delBTN);

                    CVI.Content = SP;


                    ListasMain.Items.Add(CVI);

                    listaSide.Items.Add(
                             new CardViewItem()
                             { Header = lista.Key, Width = 140 });
                }

                MessageBox.Show("Lista " + name + " alterada", "Lista Alterada", MessageBoxButton.OK, MessageBoxImage.Information);
            }

        }


    }
}
