Select s."COD", s."Nombre", count(pa."FK-Sucursal")
From "Sucursal" s, "Paquete" pa, "Envio" e
Where pa."FK-Sucursal"=s."COD" and pa."FK-EnvioP"=e."COD" and e."FechaInicio" between '01-03-2016' and '09-09-2018'
group by s."COD", s."Nombre"
order by count(pa."FK-Sucursal") DESC
limit 1