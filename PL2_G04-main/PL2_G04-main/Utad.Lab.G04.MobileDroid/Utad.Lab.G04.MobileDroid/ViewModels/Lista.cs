using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;

namespace Utad.Lab.G04.MobileDroid.ViewModels
{
    public class Listas
    {
        public string Descricao { get; set; }

        public void CriarLista() { } //pode ser Constructor??

        public void ApagarLista() { }

        public void AlterarLista() { }

        public List<Produto> Produtos { get; private set; }

        
    }
    
}
