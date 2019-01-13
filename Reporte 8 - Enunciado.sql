Select c."CI", c."Nombre", s2."Nombre", mes||'-'||ano, count
from "Cliente" c, "Sucursal" s2, (select COUNT(p2.*) as count, EXTRACT(YEAR FROM e."FechaInicio") as ano, 
			EXTRACT(MONTH FROM e."FechaInicio") as mes, s."COD", c2."CI" 
			from "Cliente" c2,"Paquete" p2, "Envio" e, "Empleado" em, "Sucursal" s
			where p2."FK-Cliente1"=c2."CI" and p2."FK-EnvioP"=e."COD" 
			and e."FK-EmpleadoE"=em."CI" and em."FK-SucursalEmp"=s."COD"
			group by ano, mes, s."COD", c2."CI") x
where c."CI"=x."CI"and s2."COD"=x."COD" and x.count>=5
order by c."Nombre"