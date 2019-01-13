Select ((x.cant_usado*100)/x.envios) as porcentaje, x.tipo 
from (Select Count(vr."PlacaB") as cant_usado, COUNT(t.*) as envios, 'Barco' as tipo
	from "Veh-Rut" vr, "Traslado" t, "Envio" e
	where vr."COD"=t."CODVeh-Rut" and t."CODEnvio"=e."COD" and e."FechaInicio" between '15-12-2013' and '15-12-2018'
	group by tipo) x
Union
Select ((x.cant_usado*100)/x.envios) as porcentaje, x.tipo 
from (Select Count(vr."PlacaA") as cant_usado, COUNT(t.*) as envios, 'Avion' as tipo
	from "Veh-Rut" vr, "Traslado" t, "Envio" e 
	where vr."COD"=t."CODVeh-Rut" and t."CODEnvio"=e."COD" and e."FechaInicio" between '15-12-2013' and '15-12-2018'
	group by tipo) x
Union
Select ((x.cant_usado*100)/x.envios) as porcentaje, x.tipo 
from (Select Count(vr."PlacaT") as cant_usado, COUNT(t.*) as envios, 'Terrestre' as tipo
	from "Veh-Rut" vr, "Traslado" t, "Envio" e
	where vr."COD"=t."CODVeh-Rut" and t."CODEnvio"=e."COD" and e."FechaInicio" between '15-12-2013' and '15-12-2018'
	group by tipo) x
order by porcentaje