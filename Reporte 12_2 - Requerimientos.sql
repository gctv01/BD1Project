Select s."COD", s."Nombre", 'Aeropuerto de '||l."Nombre"
from "Sucursal" s, "Aeropuerto" p, "Lugar" l
where p."FK-SucursalA"=s."COD" and p."FK-LugarAe"=l."COD"