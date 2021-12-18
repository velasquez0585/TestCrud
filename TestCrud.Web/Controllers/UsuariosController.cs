
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Authorization;
using TestCrud.EntityModel.Models;
using TestCrud.Services;
using System.Data;
using System;
using System.IO;
using System.Linq;

namespace TestCrud.Web.Controllers
{
    public class UsuariosController : Controller
    {
        private readonly IServicesUsuarios _servUsuarios;
        protected IConfiguration _configuration;
        protected string TituloExportar;
        public UsuariosController(IServicesUsuarios sm, IConfiguration conf)
        {
            _configuration = conf;
            _servUsuarios = sm;
            TituloExportar = "Usuarios";   
        }

        public virtual async Task<IActionResult> Index()
        {
           
            var lista = await _servUsuarios.TraerTodos();
            return View(lista);
        }

        public async Task<IActionResult> Details(int? id)
        {
            
            if (id == null)
            {
                return NotFound();
            }

            var model = await _servUsuarios.TraerPorId(id.Value);
            if (model == null)
            {
                return NotFound();
            }
            //await PrepararModelDetail(model);
            return View(model);

        }

        public async virtual Task<ActionResult> Create()
        {
            
            
            return View();
        }


        public async Task<IActionResult> Edit(int? id)
        {
            
            if (id == null)
            {
                return NotFound();
            }
            var model = await _servUsuarios.TraerPorId(id.Value);
            if (model == null)
            {
                return NotFound();
            }
           //await PrepararModelEdit(model);
            return View(model);
        }


        //[Authorize(Roles = "WEB_PasajesWKF_SuperAdministrador")]
        public virtual async Task<IActionResult> Delete(int? id)
        {
            
            if (id == null)
            {
                return NotFound();
            }

            var model = await _servUsuarios.TraerPorId(id.Value);
            if (model == null)
            {
                return NotFound();
            }

            return View(model);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
                await _servUsuarios.Eliminar(id);
                return RedirectToAction("Index");
        }


         

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Cod_Usario, Txt_User, Txt_Password, Txt_Nombre, Txt_Apellido, Nro_Doc, Cod_Rol, Sn_Activo")] Usuarios Usuarios)
        {
            ////verificar si ya existe ese Clase
            //if (((IServicesUsuarios)_servicio).ExisteClase(Usuarios.Descripcion, Usuarios.IdClase))
            //{
            //    ModelState.AddModelError(string.Empty, "Ya se cargó ese Clase anteriormente");
            //}

            if (ModelState.IsValid)
            {
                await _servUsuarios.Agregar(Usuarios);
                return RedirectToAction("Index");
            }
            
            return View(Usuarios);
            
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Cod_Usario, Txt_User, Txt_Password, Txt_Nombre, Txt_Apellido, Nro_Doc, Cod_Rol, Sn_Activo")] Usuarios Usuarios)
        {
            if (id != Usuarios.Cod_Usario)
            {
                return NotFound();
            }
            //verificar si ya existe ese Clase
            //if (((IServicesUsuarios)_servicio).ExisteClase(Usuarios.Descripcion, id))
            //{
            //    ModelState.AddModelError(string.Empty, "Ya se cargó ese Clase anteriormente");
            //}

            if (ModelState.IsValid)
            {
                var model = await _servUsuarios.TraerPorId(id);
                BindModel(Usuarios, ref model);
                await _servUsuarios.Modificar(model);
                return RedirectToAction("Index");
            }

            return View(Usuarios);
            
        }


        protected void BindModel(Usuarios model, ref Usuarios current)
        {            
            current.Cod_Usario = model.Cod_Usario;
            current.Txt_User = model.Txt_User;
            current.Txt_Password = model.Txt_Password;
            current.Txt_Nombre = model.Txt_Nombre;
            current.Txt_Apellido = model.Txt_Apellido;
            current.Nro_Doc = model.Nro_Doc;
            current.Cod_Rol = model.Cod_Rol;
            current.Sn_Activo = model.Sn_Activo;            
        }
    }
}