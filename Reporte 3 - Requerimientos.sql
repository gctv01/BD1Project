Select s."COD", s."Nombre", x.prom_paq
From "Sucursal" s, (Select AVG(p."Peso") as prom_paq, em."FK-SucursalEmp" 
			from "Empleado" em, "Envio" e, "Paquete" p
			Where e."FK-EmpleadoE"=em."CI" and p."FK-EnvioP"=e."COD"
			Group by em."FK-SucursalEmp"
			Order by prom_paq DESC) x
Where s."COD" = x."FK-SucursalEmp" 
Order by x.prom_paq DESC