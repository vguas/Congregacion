/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     11/10/2015 3:11:55 PM                        */
/*==============================================================*/


drop table if exists wt.Asignacion;

drop table if exists wt.Congregacion;

drop table if exists wt.Persona;

drop table if exists wt.Reunion;

drop table if exists wt.ReunionDia;

drop table if exists wt.ReunionParte;

drop table if exists wt.Salon;

drop table if exists wt.VMCAspecto;

drop table if exists wt.VMCCalificacion;

drop table if exists wt.VMCFuente;

drop table if exists wt.VMCPrograma;

drop table if exists wt.VMCSala;

drop table if exists wt.VMCTema;

/*==============================================================*/
/* Table: Asignacion                                            */
/*==============================================================*/
create table wt.Asignacion
(
   Id                   int not null auto_increment,
   IdReunionParte       int,
   Nombre               varchar(50),
   Descripcion          varbinary(50),
   estaActivo           bit,
   esDiscurso           bit,
   esLectura            bit,
   esPrimeraVisita      bit,
   esRevisita           bit,
   esEstudio            bit,
   primary key (Id)
)
auto_increment = 1;

/*==============================================================*/
/* Table: Congregacion                                          */
/*==============================================================*/
create table wt.Congregacion
(
   Id                   int not null auto_increment,
   IdSalon              int,
   Numero               int,
   Nombre               varchar(50),
   Email01              varchar(20),
   Email02              varchar(20),
   primary key (Id)
)
auto_increment = 1;

alter table wt.Congregacion comment 'Registra las congregaciones que utilizaran el sistema';

/*==============================================================*/
/* Table: Persona                                               */
/*==============================================================*/
create table wt.Persona
(
   Id                   int not null auto_increment,
   Nombres              varchar(100),
   Apellidos            varchar(100),
   Direccion            varchar(100),
   IdColonia            int,
   Zona                 int,
   IdMunicipio          int,
   Telefono01           int,
   Telefono02           int,
   Movil01              int,
   Movil02              int,
   Email01              varchar(25),
   Email02              varchar(25),
   FechaNacimiento      date,
   FechaBautismo        date,
   estaBautizado        bit,
   esHombre             bit,
   esPublicador         bit,
   esSoltero            bit,
   estaInscritoVMC      bit,
   IdConyuge            int,
   IdCongregacion       int,
   primary key (Id)
)
auto_increment = 1;



/*==============================================================*/
/* Table: Reunion                                               */
/*==============================================================*/
create table wt.Reunion
(
   Id                   int not null auto_increment,
   Nombre               varchar(50),
   Descripcion          varchar(50),
   FechaInicio          date,
   FechaFin             date,
   Anio                 int,
   estaActivo           bit,
   esVMC                bit,
   esPublica            bit,
   primary key (Id)
)
auto_increment = 1;

/*==============================================================*/
/* Table: ReunionDia                                            */
/*==============================================================*/
create table wt.ReunionDia
(
   IdCongregacion       int,
   IdReunion            int,
   IdDia                int,
   Hora                 time
);

/*==============================================================*/
/* Table: ReunionParte                                          */
/*==============================================================*/
create table wt.ReunionParte
(
   Id                   int not null auto_increment,
   IdReunion            int,
   Nombre               varchar(50),
   Descripcion          varbinary(50),
   estaActivo           bit,
   primary key (Id)
)
auto_increment = 1;

/*==============================================================*/
/* Table: Salon                                                 */
/*==============================================================*/
create table wt.Salon
(
   Id                   int not null auto_increment,
   Codigo               varchar(20),
   Direccion            varchar(100),
   Colonia              varchar(20),
   Zona                 int,
   IdMunicipio          int not null,
   Telefono01           int,
   Telefono02           int,
   Telefono03           int,
   primary key (Id)
)
auto_increment = 1;
alter table wt.Salon comment 'Almacena los lugares de reunion';

/*==============================================================*/
/* Table: VMCAspecto                                            */
/*==============================================================*/
create table wt.VMCAspecto
(
   Id                   int not null auto_increment,
   Numero               int,
   Nombre               varchar(100),
   Descripcion          varchar(100),
   esLectura			bit,
   esDemostracion		bit,
   esDiscurso			bit,
   primary key (Id)
)
auto_increment = 1;

/*==============================================================*/
/* Table: VMCCalificacion                                       */
/*==============================================================*/
create table wt.VMCCalificacion
(
   IdPrograma           int not null,
   sePresento           bit,
   aproboAspecto        bit,
   Aspecto              int
);

/*==============================================================*/
/* Table: VMCFuente                                             */
/*==============================================================*/
create table wt.VMCFuente
(
   Id                   int not null auto_increment,
   Nombre               varchar(50),
   Codigo               varchar(20),
   primary key (Id)
)
auto_increment = 1;

/*==============================================================*/
/* Table: VMCPrograma                                           */
/*==============================================================*/
create table wt.VMCPrograma
(
   Id                   int not null auto_increment,
   IdCongregacion       int,
   Fecha                date,
   IdAsignacion         int,
   IdSala               int,
   IdTema               int,
   IdAspecto            int,
   IdAsignado           int,
   IdAyudante           int,
   FechaIngreso			date,
   primary key (Id)
)
auto_increment = 1;

/*==============================================================*/
/* Table: VMCSala                                               */
/*==============================================================*/
create table wt.VMCSala
(
   Id                   int not null auto_increment,
   Nombre               varchar(10),
   Descripcion          varchar(50),
   IdEncargado          int,
   IdAuxiliar           int,
   esPrincipal          bit,
   estaActiva           bit,
   primary key (Id)
)
auto_increment = 1;

/*==============================================================*/
/* Table: VMCTema                                               */
/*==============================================================*/
create table wt.VMCTema
(
   Id                   int not null auto_increment,
   IdFuente             int,
   IdAsignacion			int,
   Mes					int,
   Anio					int,
   FechaInicio          date,
   FechaFin             date,
   Paginas              varchar(50),
   Tema                 varchar(100),
   primary key (Id)
)
auto_increment = 1;

