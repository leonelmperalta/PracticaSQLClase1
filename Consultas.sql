#1 Obtener los datos completos de los empleados.

SELECT * FROM empleados;

#2 Listar el nombre de los departamentos.

SELECT nombreDpto FROM departamentos;

#3 Obtener el nombre y cargo de todos los empleados, ordenado por salario.

SELECT nomEMP, cargoE , salEMP from empleados ORDER BY salEMP DESC;

#4 Obtener la lista de los empleados que ganan una comision superior a su sueldo.

SELECT * FROM empleados WHERE empleados.comisionE > empleados.salEMP;

#5 Listar los empleados cuya comision es menor o igual que el 30% de su sueldo.

SELECT * from empleados WHERE empleados.comisionE <= (empleados.salEMP * 0.3);

#6 Muestra los empleados cuyo nombre empiece entre las letras J y Z(rango). Liste estos empleados y su cargo por orden alfabetico.

SELECT * FROM empleados WHERE empleados.nomEMP >= 'A' AND empleados.nomEMP <= 'J';

#7 Hallar los empleados cuyo nombre no contiene la cadena "MA"

SELECT * FROM empleados WHERE empleados.nomEMP NOT LIKE '%MA%';
 
#8 Listar los datos de los empleados cuyo nombre iniciar por la letra 'M' , su salario es mayor a $800.000 o reciben comision y trabajan para el departamento de 'VENTAS'

SELECT * FROM empleados 
WHERE empleados.nomEMP LIKE 'M' 
OR empleados.salEMP > 800000 
OR (empleados.comisionE > 0 
AND empleados.codDepto = (SELECT departamentos.codDepto FROM departamentos WHERE departamentos.nombreDpto = 'VENTAS'))

#9 Mostrar el salario mas alto de la empresa

SELECT max(empleados.salEMP) as salarioMasAlto from empleados;

#10 Hallar el salario mas alto, el mas bajo y la diferencia entre ellos.

SELECT max(empleados.salEMP) as 'salario mas alto' , min(empleados.salEMP) as 'salario mas bajo' , max(empleados.salEMP) - min(empleados.salEMP) as 'diferencia' FROM empleados

#11 Mostrar el numero de empleados de sexo femenino y de sexo masculino, por departamento.

SELECT COUNT(empleados.sexEMP LIKE 'M') as 'Masculinos', COUNT(empleados.sexEMP LIKE 'F') as 'Femeninos', empleados.codDepto FROM empleados GROUP BY empleados.codDepto

#12 Hallar los departamentos que tienen mas de tres empleados. Mostrar el numero de empleados de esos departamentos.

SELECT SUM(empleados.codDepto = departamentos.codDepto) as 'Cantidad de empleados', departamentos.nombreDpto 
FROM empleados , departamentos 
GROUP BY departamentos.codDepto 
HAVING SUM(empleados.codDepto = departamentos.codDepto) > 3

#13 Mostrar el codigo y nombre de cada jefe, junto al numero de emleados que dirige. Solo los que tengan mas de dos empleados(2 incluido).

SELECT SUM(empleados.jefeID = jefes.jefeID) as 'Cantidad de empleados', jefes.* 
FROM empleados , jefes 
GROUP BY jefes.jefeID 
HAVING SUM(empleados.jefeID = jefes.jefeID) >= 2

#14 Hallar los departamentos que no tienen empleados

SELECT departamentos.nombreDpto , departamentos.codDepto FROM departamentos , empleados GROUP BY departamentos.codDepto HAVING sum(departamentos.codDepto = empleados.codDepto) = 0

#15 Mostrar el nombre del departamento cuya suma de salarios sea la mas alta , iondicando el valor de la suma.

SELECT SUM(empleados.salEMP) as Total FROM empleados , departamentos WHERE empleados.codDepto = departamentos.codDepto GROUP BY departamentos.codDepto ORDER BY Total DESC LIMIT 1















