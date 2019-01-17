Select (Count(vr."PlacaB")*100)/Count(t."COD") as cant_usado, 'Barco' as tipo 
from "Veh-Rut" vr, "Traslado" t, "Envio" e 
where vr."COD"=t."CODVeh-Rut" and t."CODEnvio"=e."COD" and e."FechaInicio" between '01-01-2013' and '01-12-2019' 
group by tipo 
Union 
Select (Count(vr."PlacaA")*100)/Count(t."COD")  as cant_usado, 'Avion' as tipo 
from "Veh-Rut" vr, "Traslado" t, "Envio" e 
where vr."COD"=t."CODVeh-Rut" and t."CODEnvio"=e."COD" and e."FechaInicio" between '01-01-2013' and '01-12-2019' 
group by tipo 
Union 
Select (Count(vr."PlacaT")*100)/Count(t."COD")  as cant_usado, 'Terrestre' as tipo 
from "Veh-Rut" vr, "Traslado" t, "Envio" e 
where vr."COD"=t."CODVeh-Rut" and t."CODEnvio"=e."COD" and e."FechaInicio" between '01-01-2013' and '01-12-2019'  
group by tipo 
order by cant_usado DESC 
