using System;
using System.Collections.Generic;

namespace TestCrud.EntityModel.Models
{
    public partial class Roles
    {
        public int Cod_Rol { get; set; }
        public string Txt_Desc { get; set; }

        public int Sn_Activo { get; set; }

        public Usuarios UsuariosNavigation { get; set; }
    }
}
