Select r."COD", 'De '||s1."Nombre"||' a '||s2."Nombre", cant_usado
From "Ruta" r, "Sucursal" s1, "Sucursal" s2, (Select Count(vr."CODRuta") as cant_usado, vr."CODRuta" as codRuta
						from "Veh-Rut" vr, "Traslado" t, "Envio" e
						where vr."COD"=t."CODVeh-Rut" and t."CODEnvio"=e."COD"
						group by vr."CODRuta") x
where r."CODSucursal1"=s1."COD" and r."CODSucursal2"=s2."COD" and r."COD"= x.codRuta
order by cant_usado DESC
limit 1