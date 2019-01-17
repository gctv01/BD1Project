Select DISTINCT e."CI", e."Nombre", h."HorarioInicio", h."HorarioFinal", s."Nombre", z."Nombre"
From "Empleado" e, "Horario" h, "Zona" z, "Sucursal" s, "Asistencia" asi
Where e."FK-HorarioEmp"=h."COD" and asi."CIEmpleado"= e."CI" and asi."CODZona"=z."COD" and e."FK-SucursalEmp" = s."COD" and z."FK-SucursalZ"=s."COD"
order by s."Nombre", e."CI"