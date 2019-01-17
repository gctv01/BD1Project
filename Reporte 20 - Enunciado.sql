SELECT s."COD", s."Nombre", AVG(cont)
FROM "Sucursal" s, (select COUNT("FechaInicio") as cont, s2."COD"
from "Envio" env, "Sucursal" s2, "Empleado" em2 
where s2."COD"=em2."FK-SucursalEmp" and env."FK-EmpleadoE"=em2."CI"
group by s2."COD", env."FechaInicio"
order by cont) x
WHERE s."COD"= x."COD"
GROUP BY s."COD", s."Nombre"
order by s."Nombre"