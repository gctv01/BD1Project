SELECT s."COD", s."Nombre", l."Nombre", l2."Nombre"
FROM "Sucursal" s, "Lugar" l, "Lugar" l2
WHERE s."FK-LugarS"=l."COD" and l."Fk-LugarL"=l2."COD"