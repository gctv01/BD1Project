SELECT s."COD", s."Nombre", l2."Nombre", Max(s."Capacidad") as maxCap
FROM "Sucursal" s, "Lugar" l, "Lugar" l2
WHERE s."FK-LugarS"=l."COD" and l."Fk-LugarL"=l2."COD"
group by l2."Nombre", s."COD", s."Nombre"
order by maxCap DESC