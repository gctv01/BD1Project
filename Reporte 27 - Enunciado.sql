Select b."Placa", s."Nombre", to_char(Max(m."FechaFinal"),'DD-MM-YYYY') as fin, 'Barco' as tipo
From "Barco" b, "Mantenimiento" m, "Sucursal" s, "Puerto" p 
Where b."Placa"=m."PlacaB" and b."FK-PuertoB"=p."COD" and p."FK-Sucursal"=s."COD"
group by b."Placa", s."COD", s."Nombre"
UNION
Select b."Placa", s."Nombre", to_char(Max(m."FechaFinal"),'DD-MM-YYYY')as fin, 'Avion' as tipo
From "Avion" b, "Mantenimiento" m, "Sucursal" s, "Puerto" p 
Where b."Placa"=m."PlacaA" and b."FK-Aeropuerto"=p."COD" and p."FK-Sucursal"=s."COD"
group by b."Placa", s."COD", s."Nombre"
UNION
Select b."Placa", s."Nombre", to_char(Max(m."FechaFinal"),'DD-MM-YYYY')as fin, 'Terrestre' as tipo
From "Terrestre" b, "Mantenimiento" m, "Sucursal" s
Where b."Placa"=m."PlacaT" and b."FK-SucursalT"=s."COD"
group by b."Placa", s."COD", s."Nombre"
order by fin DESC