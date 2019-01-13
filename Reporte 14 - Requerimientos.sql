-- Total de gastos generados por revisión de flotas por mes y por sucursal.
Select SUM(m."Costo") as costoT, Extract(MONTH FROM m."FechaIni"), s."COD", s."Nombre", 'BARCO'
from "Mantenimiento" m, "Barco" b, "Puerto" p, "Sucursal" s
where (m."PlacaB"=b."Placa") and 
((b."FK-PuertoB"=p."COD" and p."FK-Sucursal"=s."COD"))
Group by s."COD", Extract(MONTH FROM m."FechaIni")
Union 
Select SUM(m2."Costo")as costoT, Extract(MONTH FROM m2."FechaIni"), s2."COD", s2."Nombre", 'AVION'
from "Mantenimiento" m2, "Avion" av, "Aeropuerto" ae, "Sucursal" s2
where (m2."PlacaA"=av."Placa") and 
((av."FK-Aeropuerto"=ae."COD" and ae."FK-SucursalA"=s2."COD"))
Group by s2."COD", Extract(MONTH FROM m2."FechaIni")
Union 
Select SUM(m3."Costo")as costoT, Extract(MONTH FROM m3."FechaIni"), s3."COD", s3."Nombre", 'TERRESTRE'
from "Mantenimiento" m3, "Terrestre" t, "Sucursal" s3
where (m3."PlacaT"=t."Placa") and 
(t."FK-SucursalT"=s3."COD")
Group by s3."COD", Extract(MONTH FROM m3."FechaIni")
order by costoT Desc