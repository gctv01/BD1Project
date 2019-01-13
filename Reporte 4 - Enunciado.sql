--Listado de todos los empleados indicando su información básica, cargo que ocupa y fecha de ingreso o egreso a la compañía. 
--Al final del listado se debe colocar el total de empleados activos y total de empleados desincorporados. Por rango de fechas.

Select "CI", "Nombre"||' '||"Apellido", to_char("FechaNac",'DD-MM-YYYY'), "Profesion", "CantHijos",  
to_char("FechaContratado",'DD-MM-YYYY')
from "Empleado"
where "FechaContratado" between '15-12-2013' and '15-12-2014'
order by "FechaContratado"