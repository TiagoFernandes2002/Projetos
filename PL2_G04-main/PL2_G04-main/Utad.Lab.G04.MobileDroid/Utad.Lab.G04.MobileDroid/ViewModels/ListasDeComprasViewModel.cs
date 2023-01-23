using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;
using System.Windows.Input;
using Utad.Lab.G04.MobileDroid.Validators;
using Utad.Lab.G04.MobileDroid.Validators.Rules;
using Xamarin.Forms;
using Xamarin.Forms.Internals;
using Utad.Lab.G04.Domain;

namespace Utad.Lab.G04.MobileDroid.ViewModels
{
    public class ListasDeComprasViewModel
    {
        public ObservableCollection<Listas> Listass { get; set; }
        public ICommand AddListaCommand { get; set; }
        public string Desc { get; set; }
        public ListasDeComprasViewModel()
        {

            Listass = new ObservableCollection<Listas>();
            //Listass.Add(new Listas { Descricao = "a" });
            AddListaCommand = new Command(AddLista);
        }

        public void AddLista()
        {
            Listass.Add(new Listas { Descricao =  "a"});
        }

       /* private void BtnApagarLista(object sender, EventArgs e)
        {
            Lista.Remove(ListaSelecionada);
        }
       */
    }
}
