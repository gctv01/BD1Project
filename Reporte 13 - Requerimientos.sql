Select m."COD",t."Nombre", "PlacaB" as Placa, "Descripcion",('Desde ' ||to_char("FechaIni", 'DD-MM-YYYY')||' hasta '||to_char("FechaFinal", 'DD-MM-YYYY')) as Duracion, 'BARCO'
From "Mantenimiento" m, "Taller" t
Where "PlacaB" is not null and t."COD"="CODTaller"
Union
Select m."COD",t."Nombre", "PlacaA" as Placa, "Descripcion",('Desde ' ||to_char("FechaIni", 'DD-MM-YYYY')||' hasta '||to_char("FechaFinal", 'DD-MM-YYYY')) as Duracion, 'AVION'
From "Mantenimiento" m, "Taller" t
Where "PlacaA" is not null and t."COD"="CODTaller"
Union
Select m."COD",t."Nombre", "PlacaT" as Placa, "Descripcion",('Desde ' ||to_char("FechaIni", 'DD-MM-YYYY')||' hasta '||to_char("FechaFinal", 'DD-MM-YYYY')) as Duracion, 'TERRESTRE'
From "Mantenimiento" m, "Taller" t
Where "PlacaT" is not null and t."COD"="CODTaller"
order by Duracion