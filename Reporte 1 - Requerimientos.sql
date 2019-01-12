Select s."COD", s."Nombre", cant_envios
From "Sucursal" s, (Select Count(em."FK-SucursalEmp") as cant_envios, em."FK-SucursalEmp"
			from "Empleado" em, "Envio" e
			Where e."FK-EmpleadoE"=em."CI"
			Group by em."FK-SucursalEmp"
			Order by Count(em."FK-SucursalEmp") DESC
			limit 1) x
Where s."COD" = x."FK-SucursalEmp"
Union
Select s2."COD", s2."Nombre", cant_recibidos
From "Sucursal" s2, (Select Count(r."CODSucursal2") as cant_recibidos, r."CODSucursal2"
			from "Ruta" r, "Veh-Rut" vr, "Traslado" t, "Envio" e
			Where vr."CODRuta"=r."COD" and vr."COD"=t."CODVeh-Rut" and t."CODEnvio"=e."COD"
			Group by r."CODSucursal2"
			Order by Count(r."CODSucursal2") DESC
			limit 1) y
Where s2."COD" = y."CODSucursal2"