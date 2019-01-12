Select s."COD", s."Nombre", 'Puerto de '||l."Nombre"
from "Sucursal" s, "Puerto" p, "Lugar" l
where p."FK-Sucursal"=s."COD" and p."FK-LugarP"=l."COD"