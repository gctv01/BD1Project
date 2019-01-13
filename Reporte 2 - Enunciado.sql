Select "Placa" as Placa, ma."Nombre"||', '||mo."Nombre", "FechaCreacion", 'Barco' as tipo
From "Barco", "Marca" ma, "Modelo" mo
where "FK-ModeloB"=mo."COD" and mo."FK-MarcaM"=ma."COD"
Union
Select "Placa" as Placa, ma."Nombre"||', '||mo."Nombre", "FechaCreacion", 'Avion' as tipo
From "Avion", "Marca" ma, "Modelo" mo
where "FK-ModeloA"=mo."COD" and mo."FK-MarcaM"=ma."COD"
Union
Select "Placa" as Placa, ma."Nombre"||', '||mo."Nombre", "FechaCreacion", 'Terrestre' as tipo
From "Terrestre", "Marca" ma, "Modelo" mo
where "FK-ModeloT"=mo."COD" and mo."FK-MarcaM"=ma."COD"
order by tipo, Placa