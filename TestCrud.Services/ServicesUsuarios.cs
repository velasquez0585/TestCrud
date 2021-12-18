using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using TestCrud.EntityModel.Models;
using System.Configuration;

using System.Data;

namespace TestCrud.Services
{
    public interface IServicesUsuarios
    {
        Task<IEnumerable<Usuarios>> TraerTodos();

        Task<Usuarios> TraerPorId(int id);

        bool Exists(int id);

        Task Agregar(Usuarios p);

        Task Modificar(Usuarios p);

        Task Eliminar(int id);

        //string[] Asociado(int id);

        void Dispose();
    }
    public class ServicesUsuarios : IServicesUsuarios
    {
        private readonly BDTestCrudContext _context;
       
    

        #region Constructor

        public ServicesUsuarios(BDTestCrudContext context)
        {
            
            _context = context;
        }
        
        #endregion

        public async Task<IEnumerable<Usuarios>> TraerTodos()
        {

              var listaUsuarios = _context.Usuarios.Include(u => u.CodRolNavigation).OrderBy(c => c.Txt_Nombre);

             return await listaUsuarios.ToListAsync();            
        }

       
        
        public async Task<Usuarios> TraerPorId(int id)
        {
            return await _context.Usuarios               
                .SingleOrDefaultAsync(m => m.Cod_Usario == id);
        }

        public async Task Agregar(Usuarios p)
        {
            int result = -1;
            _context.Add(p);

            try
            {
                result = await _context.SaveChangesAsync();
            }
            catch (DbUpdateException ex)
            {
                // Retrieve the error messages as a list of strings.
                var errorMessages = "";

                if (ex.InnerException != null)
                    errorMessages += ex.InnerException.Message;

                if (errorMessages == "")
                    if (!string.IsNullOrEmpty(ex.Message))
                        errorMessages = ex.Message;                          

                if (errorMessages == "")
                    errorMessages = "Ocurrió un error al actualizar el registro.";             

                // Combine the original exception message with the new one.
                var exceptionMessage = string.Concat("Error: ", errorMessages);
                //_logger.Here().Error(exceptionMessage);

                throw new DbUpdateException(exceptionMessage, ex.InnerException);
            }
           
            
        }

        public bool Exists(int id)
        {
            return _context.Usuarios.Any(e => e.Cod_Usario == id);
        }

        public async Task Modificar(Usuarios p)
        {
            int result = -1;
            try
            {
                _context.Update(p);
                result =  await _context.SaveChangesAsync();
            }
            catch (DbUpdateException ex)
            {
                // Retrieve the error messages as a list of strings.
                var errorMessages = "";

                if (ex.InnerException != null)
                    errorMessages += ex.InnerException.Message;

                if (errorMessages == "")
                    if (!string.IsNullOrEmpty(ex.Message))
                        errorMessages = ex.Message;

                if (errorMessages == "")
                    errorMessages = "Ocurrió un error al actualizar el registro.";

                // Combine the original exception message with the new one.
                var exceptionMessage = string.Concat("Error: ", errorMessages);
                //_logger.Here().Error(exceptionMessage);

                throw new DbUpdateException(exceptionMessage, ex.InnerException);
            }

        }

        public async Task Eliminar(int id)
        {            
            var paises = _context.Usuarios.SingleOrDefault(m => m.Cod_Usario == id);
            _context.Usuarios.Remove(paises);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException ex)
            {
                // Retrieve the error messages as a list of strings.
                var errorMessages = "";

                if (ex.InnerException != null)
                    errorMessages += ex.InnerException.Message;

                if (errorMessages == "")
                    if (!string.IsNullOrEmpty(ex.Message))
                        errorMessages = ex.Message;

                if (errorMessages == "")
                    errorMessages = "Ocurrió un error al actualizar el registro.";

                // Combine the original exception message with the new one.
                var exceptionMessage = string.Concat("Error: ", errorMessages);

                //_logger.Here().Error(exceptionMessage);

                throw new DbUpdateException(exceptionMessage, ex.InnerException);
            }


        }

        /*
        public string[]  Asociado(int idClase)
        {
           List<string> asociados = new List<string>();            
            if (_context.MarcaExterna.Any(x => x.IdClase == idClase) == true)         
                asociados.Add("No se puede eliminar dado que está asociado a Marcas externas");
            if (_context.MarcasBaliarda.Any(x => x.IdClase == idClase) == true)
                asociados.Add("no se puede eliminar dado que está asociado a Marcas de baliarda");


            return asociados.ToArray(); 
        }
        */

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
