Select t."Nombre", l."Nombre", l2."Nombre"
FROM "Taller" t, "Lugar" l, "Lugar" l2
WHERE t."FK-LugarT"=l."COD" and l."Fk-LugarL"=l2."COD"