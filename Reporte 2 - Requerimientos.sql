Select s."COD", s."Nombre", SUM("MontoTotal") as monto, Extract(MONTH FROM p."Fecha") as mes, 'INGRESOS'
from "Sucursal" s, "Pago" p, "Envio" e, "Empleado" em
where p."FK-EnvioP"=e."COD" and e."FK-EmpleadoE"=em."CI" and s."COD"=em."FK-SucursalEmp"
group by Extract(MONTH FROM p."Fecha"), s."COD", s."Nombre"
Union
Select s."COD", s."Nombre", SUM(se."Costo"+m."Costo"+em."SalarioAsig") as monto, Extract(MONTH FROM g."Fecha")as mes, 'EGRESOS'
from "Sucursal" s, "Gastos" g, "Servicio" se, "Mantenimiento" m, "Empleado" em
where g."FK-SucursalG"=s."COD" and (g."FK-ServicioG"=se."COD" or g."FK-MantenimientoG"=m."COD") and em."FK-SucursalEmp"=s."COD"
group by Extract(MONTH FROM g."Fecha"), s."COD", s."Nombre"
order by mes
