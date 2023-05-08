--select cod_documento, count(dni_cliente)
--from venta
--group by cod_documento
--order by cod_documento


create view V_DetalleVentas
as

select a.*, b.fecha_venta, b.dni_cliente, c.cod_vendedor--, b.vendedor
from DETALLE_VENTA a
left join venta b
on  a.cod_documento = b.cod_documento
left join vendedor c
on replace(b.vendedor,'Ã‘','Ñ') = CONCAT(c.apellido_vendedor,', ',c.nombre_vendedor)
--SELECT REPLACE('SQL Tutorial', 'T', 'M');
--select *
--from venta

create view V_DetalleVentasALL
as

select a.cod_documento,a.dni_cliente,a.vendedor,a.estado,a.fecha_venta, c.cod_vendedor--, b.vendedor
from venta a
left join vendedor c
on replace(a.vendedor,'Ã‘','Ñ') = CONCAT(c.apellido_vendedor,', ',c.nombre_vendedor)