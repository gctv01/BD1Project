SELECT s."COD", s."Nombre", ser."Nombre"
FROM "Sucursal" s, "Gastos" g, "Servicio" ser
WHERE g."FK-SucursalG"=s."COD" and g."FK-ServicioG"=ser."COD"
