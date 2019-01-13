Select Count(vr."PlacaB") as cant_usado, 'Barco' as tipo
from "Veh-Rut" vr, "Traslado" t, "Envio" e
where vr."COD"=t."CODVeh-Rut" and t."CODEnvio"=e."COD"
group by tipo
Union
Select Count(vr."PlacaA") as cant_usado, 'Avion' as tipo
from "Veh-Rut" vr, "Traslado" t, "Envio" e
where vr."COD"=t."CODVeh-Rut" and t."CODEnvio"=e."COD"
group by tipo
Union
Select Count(vr."PlacaT") as cant_usado, 'Terrestre' as tipo
from "Veh-Rut" vr, "Traslado" t, "Envio" e
where vr."COD"=t."CODVeh-Rut" and t."CODEnvio"=e."COD"
group by tipo
order by cant_usado DESC
limit 1