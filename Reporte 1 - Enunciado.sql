Select s."COD", s."Nombre", estado
From "Sucursal" s, "Lugar" l, (Select "Nombre" as estado, "COD"
		 From "Lugar"
		 Where "Tipo"='Estado'
		 Order by estado) x
where s."FK-LugarS"=l."COD" and l."Fk-LugarL"=x."COD" 
Order by estado, s."Nombre"

DDDDDDDDDDDDDD
