Select te."Placa", s."Nombre"
From "Terrestre" te, "Sucursal" s
WHERE te."FK-SucursalT"=s."COD"
order by s."Nombre"