Select pa."COD", pa."Peso", pa."Volumen", tp."Clasificacion", s."Nombre", c1."Nombre", c2."Nombre", pa."Estatus"
From "Paquete" pa, "Sucursal" s, "TipoPaquete" tp, "Cliente" c1, "Cliente" c2
WHERE s."COD"=pa."FK-Sucursal" and tp."COD"=pa."FK-TipoPaquete" and pa."FK-Cliente1"=c1."CI" and pa."FK-Cliente2"=c2."CI"
Order by pa."Estatus"