using System;
using System.Collections.Generic;
using System.Text;

namespace Utad.Lab.G04.MobileDroid.ViewModels
{
    public class Produto
    {
        public int Id { get; set; }

        public string Descricao { get; set; }

        public int Quantidade { get; set; }

        public string Categoria { get; set; } // referenciar as pre-defenidas

        public bool Comprado { get; set; }
    }
}
