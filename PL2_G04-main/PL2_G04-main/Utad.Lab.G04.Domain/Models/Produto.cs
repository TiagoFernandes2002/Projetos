﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utad.Lab.G04.Domain.Models
{
    public class Produto
    {
        public int Id { get; set; }

        public string Descricao { get; set; }

        public string Categoria { get; set; }

        public int Quantidade { get; set; }

        public bool Comprado { get; set; }


    }
}
