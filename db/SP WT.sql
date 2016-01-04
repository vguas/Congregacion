drop procedure if exists wt.Salon_ADD;

create procedure wt.Salon_ADD (in Codigo varchar(20), Direccion varchar(100), Colonia varchar(20),
	Zona smallint, IdMunicipio int, tel01 int, tel02 int, tel03 int)
    
insert into wt.Salon
(Codigo, Direccion, Colonia, Zona, IdMunicipio, Telefono01, Telefono02, Telefono03)
Values (Codigo, Direccion, Colonia, Zona, IdMunicipio, tel01, tel02, tel03);


drop procedure if exists wt.Salon_UPD;

create procedure wt.Salon_UPD (in Id1 int, Codigo varchar(20), Direccion varchar(100), Colonia varchar(20),
	Zona smallint, IdMunicipio int, tel01 int, tel02 int, tel03 int)
update wt.Salon 
set Codigo = Codigo, Direccion = Direccion, Colonia = Colonia, Zona = Zona, IdMunicipio = IdMunicipio,
	Telefono01 = tel01, Telefono02 = tel02, Telefono03 = tel03
where Id = Id1;

drop procedure if exists wt.Salon_DEL;

create procedure wt.Salon_DEL(in Id1 int)
delete from wt.salon
where Id = Id1;


drop procedure if exists wt.VMCAnio_Get;

create procedure wt.VMCAnio_Get ()
select distinct Anio 
from wt.VMCTema;


drop procedure if exists wt.VMCMes_Get;

create procedure wt.VMCMes_Get()
select distinct 
case Mes 
	when 1 then 'Enero' 
    when 2 then 'Febrero'
    when 3 then 'Marzo'
    when 4 then 'Abril'
    when 5 then 'Mayo'
    when 6 then 'Junio'
    when 7 then 'Julio'
    when 8 then 'Agosto'
    when 9 then 'Septiembre'
    when 10 then 'Octubre'
    when 11 then 'Noviembre'
    else 'Diciembre'
    end as Mes
from wt.VMCTema;


drop procedure if exists wt.VMCPrograma_Get;

CREATE PROCEDURE wt.VMCPrograma_Get(in inmes int, inanio int, inIdCongregacion int)

select date_format((D.FechaInicio+(C.IdDia-1)), '%d/%m/%Y') as Dia,
	B.Nombre as ParteReunion, D.Tema as Asignacion, J.Nombre as Sala,
    concat(H.Nombres, ' ', H.Apellidos) as Asignado, concat(I.Nombres, ' ', I.Apellidos) as Ayudante,
	concat(G.numero, ' - ', G.Nombre) as Aspecto
    
from wt.reunion A
	inner join wt.reunionparte B on A.Id = B.IdReunion
    inner join wt.reuniondia C on A.Id = C.IdReunion
    inner join wt.asignacion E on B.Id = E.IdReunionParte
    inner join wt.vmctema D on E.Id = D.IdAsignacion
    left outer join wt.vmcprograma F on C.IdCongregacion = F.IdCongregacion and F.Fecha = (D.FechaInicio+(C.IdDia-1)) and E.Id = F.IdAsignacion
    left outer join wt.vmcaspecto G on F.IdAspecto = G.Id 
    left outer join wt.persona H on F.IdAsignado = H.Id
    Left outer join wt.persona I on F.IdAyudante = I.Id 
    left outer join wt.vmcsala J on F.IdSala = J.Id
where D.anio = inanio and D.mes = inmes and C.IdCongregacion = inIdCongregacion    
order by (D.FechaInicio+(C.IdDia-1)), E.Id;


drop procedure if exists wt.VMCDias_Get;

create procedure wt.VMCDias_Get(in inanio int, inmes int, inIdCongregacion int)
select distinct date_format((D.FechaInicio+(C.IdDia-1)), '%d/%m/%Y') as Dia
from wt.reunion A
	inner join wt.reunionparte B on A.Id = B.IdReunion
    inner join wt.reuniondia C on A.Id = C.IdReunion
    inner join wt.asignacion E on B.Id = E.IdReunionParte
    inner join wt.vmctema D on E.Id = D.IdAsignacion
where D.anio = inanio and D.mes = inmes and C.IdCongregacion = inIdCongregacion 
order by (D.FechaInicio+(C.IdDia-1));    


drop procedure if exists wt.VMCReunionParte_Get;

create procedure wt.VMCReunionParte_Get(in inFecha date, inIdCongregacion int)
select distinct B.Nombre
from wt.reunion A
	inner join wt.reunionparte B on A.Id = B.IdReunion
    inner join wt.reuniondia C on A.Id = C.IdReunion
    inner join wt.asignacion E on B.Id = E.IdReunionParte
    inner join wt.vmctema D on E.Id = D.IdAsignacion
where date_format((D.FechaInicio+(C.IdDia-1)), '%d/%m/%Y') = inFecha and C.IdCongregacion = inIdCongregacion
order by B.Id;


drop procedure if exists wt.VMCAsignacion_Get;

create procedure wt.VMCAsignacion_Get(in inFecha date, inIdCongregacion int, inParteReunion varchar(50))
select distinct D.Tema as Nombre
from wt.reunion A
	inner join wt.reunionparte B on A.Id = B.IdReunion
	inner join wt.reuniondia C on A.Id = C.IdReunion
	inner join wt.asignacion E on B.Id = E.IdReunionParte
	inner join wt.vmctema D on E.Id = D.IdAsignacion
where (D.FechaInicio+(C.IdDia-1)) =  inFecha and C.IdCongregacion = inIdCongregacion 
	and B.Nombre = inParteReunion
order by E.Id;


drop procedure if exists wt.Personas_Get;

create procedure wt.Personas_Get(in inIdCongregacion int)
select concat(Nombres, ' ', Apellidos) as Nombre
from wt.persona
where IdCongregacion = inIdCongregacion and estaInscritoVMC = 1;


drop procedure if exists wt.VMCAspecto_Get;

create procedure wt.VMCAspecto_Get()
select concat(Numero, ' - ', Nombre) as Aspecto
from wt.vmcaspecto;


drop procedure if exists wt.VMCSala_Get;

create procedure wt.VMCSala_Get()
select Nombre
from wt.vmcsala
where estaActiva = 1;


drop procedure if exists wt.Programa_Add;

DELIMITER //
Create procedure wt.Programa_Add(in inIdCongregacion int, inFecha date, inTema varchar(100), inSala varchar(10), inAspecto varchar(105), 
	inAsignado varchar(200), inAyudante varchar(200))
Begin    
declare inIdSala int;
declare inIdTema int;
declare inIdAspecto int;
declare inIdAsignado int;
declare inIdAyudante int;
declare inIdAsignacion int;

set inIdTema  = (	select Id
					from wt.vmctema
					where inFecha between FechaInicio and FechaFin
						and Tema = inTema);
    

set inIdAsignacion = (	select IdAsignacion
						from wt.vmctema
						where inFecha between FechaInicio and FechaFin
							and Tema = inTema);

set inIdSala = (	select Id
					from wt.vmcsala
					where Nombre = inSala);

set inIdAspecto = (	select Id
					from wt.vmcaspecto
					where concat(numero, ' - ', Nombre) = inAspecto);

set inIdAsignado = (	select Id
						from wt.persona
						where concat(Nombres, ' ', Apellidos) = inAsignado);

set inIdAyudante = (	select Id
						from wt.persona
						where concat(Nombres, ' ', Apellidos) = inAyudante);    
    
 
insert into wt.vmcprograma (IdCongregacion, Fecha, IdAsignacion, IdSala, IdTema, IdAspecto, IdAsignado, IdAyudante, FechaIngreso)
values (inIdCongregacion, inFecha, inIdAsignacion, inIdSala, inIdTema, inIdAspecto, inIdAsignado, inIdAyudante, curdate());        
end//
DELIMITER ;

