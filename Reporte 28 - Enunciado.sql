Select s."COD", s."Nombre", SUM("MontoTotal") as monto, 'INGRESOS' as tipo
from "Sucursal" s, "Pago" p, "Envio" e, "Empleado" em
where p."FK-EnvioP"=e."COD" and e."FK-EmpleadoE"=em."CI" and s."COD"=em."FK-SucursalEmp" and p."Fecha" between '15-01-2010' and '15-01-2020'
group by s."COD", s."Nombre"
Union
Select s."COD", s."Nombre", SUM(se."Costo"+m."Costo"+em."SalarioAsig") as monto, 'EGRESOS' as tipo
from "Sucursal" s, "Gastos" g, "Servicio" se, "Mantenimiento" m, "Empleado" em
where g."FK-SucursalG"=s."COD" and (g."FK-ServicioG"=se."COD" or g."FK-MantenimientoG"=m."COD") and em."FK-SucursalEmp"=s."COD" and
g."Fecha" between '15-01-2010' and '15-01-2020'
group by s."COD", s."Nombre"
order by tipo
