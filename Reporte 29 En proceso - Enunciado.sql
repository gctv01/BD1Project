
SELECT ss."COD", ss."Nombre", lp2."Nombre"
FROM "Sucursal" ss, "Lugar" lp, "Lugar" lp2,
(Select s."COD", SUM(se."Costo"+m."Costo"+em."SalarioAsig") as monto, l2."Nombre"
from "Sucursal" s, "Gastos" g, "Servicio" se, "Mantenimiento" m, "Empleado" em, "Lugar" l, "Lugar" l2
where g."FK-SucursalG"=s."COD" and (g."FK-ServicioG"=se."COD" or g."FK-MantenimientoG"=m."COD") and em."FK-SucursalEmp"=s."COD" 
and s."FK-LugarS"=l."COD" and l."Fk-LugarL"=l2."COD"
group by l2."Nombre", s."COD"
order by l2."Nombre") x
WHERE ss."FK-LugarS"=lp."COD" and lp."Fk-LugarL"=lp2."COD" and ss."COD"=x."COD" 
