using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication
{
    public class Contato
    {
        public Contato() { }
        public int Id { get; set; }
        public String Nome { get; set; }
        public String Email { get; set; }
        public String DataNascimento { get; set; }
        public String Cpf { get; set; }
        public String Cidade { get; set; }
        public String Estado { get; set; }
        public String Endereco { get; set; }

    }
}