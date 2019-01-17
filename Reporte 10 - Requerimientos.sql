SELECT u."Nombre", r."Nombre", a."Nombre", au."Descripcion", au."Fecha"
FROM "Accion-Usuario" au, "Usuario" u, "Accion" a, "Rol" r
Where u."COD"=au."codUsuario" and a."COD"=au."codAccion" and r."COD"=u."FK-RolU"
order by au."codUsuario", au."Fecha" DESC