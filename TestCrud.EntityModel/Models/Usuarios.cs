using System;
using System.Collections.Generic;


namespace TestCrud.EntityModel.Models
{
    public partial class Usuarios
    {
        public int Cod_Usario { get; set; }
        public string Txt_User { get; set; }
        public string Txt_Password { get; set; }
        public string Txt_Nombre { get; set; }
        public string Txt_Apellido { get; set; }
        public string Nro_Doc { get; set; }
        public int Cod_Rol { get; set; }
        public int Sn_Activo { get; set; }

        public Roles CodRolNavigation { get; set; }




        //public BusquedaExterna IdBusquedaExternaNavigation { get; set; }
    }
}
