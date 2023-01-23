using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;
using Utad.Lab.G04.MobileDroid.Validators;
using Utad.Lab.G04.MobileDroid.Validators.Rules;
using Xamarin.Forms;
using Xamarin.Forms.Internals;

namespace Utad.Lab.G04.MobileDroid.ViewModels
{
    public class ListaViewModel
    {
        public ObservableCollection<Produto> Produto { get; set; } 

        public ListaViewModel()
        {
            // "Maçãs", "Massa", "Atum", "Ovos", "a", "b", "c", "d", "e", "f", "g" };
            
            //Produto = new ObservableCollection<Produto>();

            //Produto.Add(new Produto { Quantidade = 2, Descricao = "Descrição", Categoria = "Charcutaria e Queijos" });
            //Produto.Add(new Produto { Quantidade = 4, Descricao = "Descrição", Categoria = "Fruta" });
            //Produto.Add(new Produto { Quantidade = 3, Descricao = "Descrição", Categoria = "Laticínios" });
            //Produto.Add(new Produto { Quantidade = 1, Descricao = "Descrição", Categoria = "Roupa" });
            //Produto.Add(new Produto { Quantidade = 2, Descricao = "Descrição", Categoria = "Livraria e Papelaria" });
   
        }
    }
}
