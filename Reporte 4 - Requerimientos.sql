Select Count(EXTRACT(MONTH FROM "FechaInicio"))as conteo_envio, EXTRACT(MONTH FROM "FechaInicio") as mes_utilizado
from "Envio" e
Group by mes_utilizado
Order by conteo_envio DESC
limit 1
