using System;
using System.Collections.Generic;
using System.Text;

namespace Utad.Lab.G04.Domain.Models
{
    public class Categorias
    {
        public int ID { get; set; }


        //categorias permanentes
        public IList<string> Descricao = new List<string>
        {
            "Padaria",
            "Bazar",
            "Mercearia",
            "Frios e Laticínios",
            "Limpeza",
            "Ferragens" ,
            "Bricolage",
            "Automóveis",
            "Outra"
        };
    }
}
