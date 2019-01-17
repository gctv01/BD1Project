Select u."COD", u."Nombre", count(au."Descripcion")
From "Accion-Usuario" au, "Usuario" u
Where au."Descripcion" like 'Registro el Envio%' and au."codUsuario"=u."COD"
Group by u."COD", u."Nombre"
order by count(au."Descripcion") DESC
limit 1