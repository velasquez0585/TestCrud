using System;
using Microsoft.AspNetCore.Mvc;


namespace TestCrud.EntityModel.Models
{
    [ModelMetadataType(typeof(UsuariosMetadata))]
    public partial class Usuarios
    {
    }

    [ModelMetadataType(typeof(RolesMetadata))]
    public partial class Roles
    {
    }

}
