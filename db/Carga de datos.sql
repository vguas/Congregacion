insert into wt.Salon
(Codigo, Direccion, Colonia, Zona, IdMunicipio, Telefono01, Telefono02)
Values ("Z501GT", "33 Avenida A 27-72", "Arrivillaga", 5, 1, 23355465, 23356326);

select * from wt.Salon;
select * from wt.congregacion;

insert into wt.Congregacion
(Id, IdSalon, Numero, Nombre)
Values (1,1, 26, "Palmita");

select * from wt.Reunion;

insert into wt.Reunion
(Id, Nombre, Descripcion, FechaInicio, Anio, estaActivo, esVMC)
Values(1, "Vida y Ministerio Cristianos", "Reunión entre semana", "2016/01/01", 2016, 1, 1);

select * from wt.ReunionDia;

insert into wt.ReunionDia
(IdCongregacion, IdReunion, IdDia, Hora)
Values(1,1,3,"19:00");

select * from wt.ReunionParte;

insert into wt.ReunionParte (Id, IdReunion, Nombre, Descripcion, estaActivo) values(1,1,"TESOROS DE LA BIBLIA", "Tesoros de la Biblia", 1);
insert into wt.ReunionParte (Id, IdReunion, Nombre, Descripcion, estaActivo) values(2,1,"SEAMOS MEJORES MAESTROS", "Seamos mejores maestros", 1);
insert into wt.ReunionParte (Id, IdReunion, Nombre, Descripcion, estaActivo) values(3,1,"NUESTRA VIDA CRISTIANA", "Nuestra vida cristiana", 1);

select * from wt.Asignacion;


/*TESOROS DE LA BIBLIA*/
insert into wt.Asignacion (Id, IdReunionParte, Nombre, Descripcion, estaActivo, esDiscurso, esLectura, esPrimeraVisita, esRevisita, esEstudio)
Values(1,1,"Discurso","Discurso", 1,1,0,0,0,0);

insert into wt.Asignacion (Id, IdReunionParte, Nombre, Descripcion, estaActivo, esDiscurso, esLectura, esPrimeraVisita, esRevisita, esEstudio)
Values(2,1,"Busquemos perlas escondidas","Preguntas y respuestas", 1,1,0,0,0,0);

insert into wt.Asignacion (Id, IdReunionParte, Nombre, Descripcion, estaActivo, esDiscurso, esLectura, esPrimeraVisita, esRevisita, esEstudio)
Values(3,1,"Lectura de la Biblia","Lectura de la Biblia", 1,0,1,0,0,0);

/*SEAMOS MEJORES MAESTROS*/
insert into wt.Asignacion (Id, IdReunionParte, Nombre, Descripcion, estaActivo, esDiscurso, esLectura, esPrimeraVisita, esRevisita, esEstudio)
Values(4,2,"Preparemos las presentaciones de este mes","Preparemos las presentaciones de este mes", 1,1,0,0,0,0);

insert into wt.Asignacion (Id, IdReunionParte, Nombre, Descripcion, estaActivo, esDiscurso, esLectura, esPrimeraVisita, esRevisita, esEstudio)
Values(5,2,"Primera Conversación","Primera Conversación", 1,0,0,1,0,0);

insert into wt.Asignacion (Id, IdReunionParte, Nombre, Descripcion, estaActivo, esDiscurso, esLectura, esPrimeraVisita, esRevisita, esEstudio)
Values(6,2,"Revisita","Revisita", 1,0,0,0,1,0);

insert into wt.Asignacion (Id, IdReunionParte, Nombre, Descripcion, estaActivo, esDiscurso, esLectura, esPrimeraVisita, esRevisita, esEstudio)
Values(7,2,"Curso Bíblico","Curso Bíblico", 1,0,0,0,0,1);

/*NUESTRA VIDA CRISTIANA*/
insert into wt.Asignacion (Id, IdReunionParte, Nombre, Descripcion, estaActivo, esDiscurso, esLectura, esPrimeraVisita, esRevisita, esEstudio)
Values(8,3,"Discurso 1","Discurso 1", 1,1,0,0,0,0);

insert into wt.Asignacion (Id, IdReunionParte, Nombre, Descripcion, estaActivo, esDiscurso, esLectura, esPrimeraVisita, esRevisita, esEstudio)
Values(9,3,"Discurso 2","Discurso 2", 1,1,0,0,0,0);

insert into wt.Asignacion (Id, IdReunionParte, Nombre, Descripcion, estaActivo, esDiscurso, esLectura, esPrimeraVisita, esRevisita, esEstudio)
Values(10,3,"Estudio Bíblico de la Congregación","Estudio Bíblico de la Congregación", 1,1,0,0,0,0);

select * from wt.VMCAspecto;

Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (1,1,"Lectura precisa","Lectura precisa",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (2,2,"Articulación clara","Articulación clara",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (3,3,"Pronunciacióncorrecta","Pronunciacióncorrecta",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (4,4,"Fluidez","Fluidez",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (5,5,"Uso adecuado delas pausas","Uso adecuado delas pausas",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (6,6,"Énfasis acertado","Énfasis acertado",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (7,7,"Énfasis en las ideas principales","Énfasis en lasideas principales",1,0,0);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (8,8,"Volumen adecuado","Volumen adecuado",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (9,9,"Modulación","Modulación",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (10,10,"Entusiasmo","Entusiasmo",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (11,11,"Afecto y otros sentimientos","Afecto y otrossentimientos",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (12,12,"Ademanes y expresiones faciales","Ademanes y expresiones faciales",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (13,13,"Contacto visual","Contacto visual",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (14,14,"Naturalidad","Naturalidad",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (15,15,"Buena apariencia","Buena apariencia",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (16,16,"Aplomo","Aplomo",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (17,17,"Buen uso del micrófono","Buen uso del micrófono",1,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (18,18,"Uso de la Bibliapara contestar preguntas","Uso de la Bibliapara contestar preguntas",0,1,0);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (19,19,"Animar a emplear la Biblia","Animar a emplear la Biblia",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (20,20,"Introducción eficaz alos textos bíblicos","Introducción eficaz alos textos bíblicos",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (21,21,"Lectura de textos bíblicos con elénfasis debido","Lectura de textosbíblicos con elénfasis debido",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (22,22,"Empleo correcto de los textos bíblicos","Empleo correcto delos textos bíblicos",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (23,23,"Resaltar el valor práctico","Resaltar el valorpráctico",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (24,24,"Buen uso del vocabulario","Buen uso delvocabulario",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (25,25,"Uso de un bosquejo","Uso de un bosquejo",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (26,26,"Desarrollo lógico dela información","Desarrollo lógico dela información",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (27,27,"Improvisar las palabrasa partir del bosquejo","Improvisar las palabrasa partir del bosquejo",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (28,28,"Tono conversacional","Tono conversacional",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (29,29,"Calidad de la voz","Calidad de la voz",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (30,30,"Interés en los oyentes","Interés en los oyentes",0,1,0);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (31,31,"Respeto a los demás","Respeto a los demás",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (32,32,"Expresarse con convicción","Expresarse con convicción",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (33,33,"Hablar con tacto,pero con firmeza","Hablar con tacto,pero con firmeza",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (34,34,"Ser edificante y positivo","Ser edificante y positivo",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (35,35,"Repetición para darénfasis","Repetición para darénfasis",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (36,36,"Desarrollo del tema","Desarrollo del tema",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (37,37,"Destacar los puntos principales","Destacar los puntosprincipales",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (38,38,"Introducciones que despiertan interés","Introducciones quedespiertan interés",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (39,39,"Conclusiones eficaces","Conclusiones eficaces",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (40,40,"Exactitud en las afirmaciones","Exactitud en lasafirmaciones",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (41,41,"Claridad en la exposición","Claridad en la exposición",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (42,42,"Exposición instructiva para el auditorio","Exposición instructivapara el auditorio",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (43,43,"Utilizar la información asignada","Utilizar la informaciónasignada",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (44,44,"Uso eficaz de las preguntas","Uso eficaz de las preguntas",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (45,45,"Ilustraciones instructivas","Ilustraciones instructivas",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (46,46,"Ilustraciones basadas en situaciones conocidas","Ilustraciones basadasen situaciones conocidas",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (47,47,"Uso eficaz de mediosvisuales","Uso eficaz de mediosvisuales",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (48,48,"Argumentación que induce a razonar","Argumentación queinduce a razonar",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (49,49,"Solidez en la argumentación","Solidez en laargumentación",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (50,50,"Llegar al corazón","Llegar al corazón",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (51,51,"Atenerse al tiempo y distribuirlo bien","Atenerse al tiempoy distribuirlo bien",0,1,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (52,52,"Exhortación eficaz","Exhortación eficaz",0,0,1);
Insert into wt.VMCAspecto (Id, Numero, Nombre, Descripcion, esLectura, esDemostracion, esDiscurso) Values (53,53,"Animar y fortalecer al auditorio","Animar y fortaleceral auditorio",0,0,1);

select * from wt.VMCSala; 

insert into wt.VMCSala (Id, Nombre, Descripcion, esPrincipal, estaActiva) Values (1,"Sala A","Sala principal", 1,1);
insert into wt.VMCSala (Id, Nombre, Descripcion, esPrincipal, estaActiva) Values (2,"Sala B","Sala auxiliar", 0,1);

select * from wt.VMCFuente;

insert into wt.VMCFuente (Id, Nombre, Codigo) Values (1,"Biblia", "bi12");
insert into wt.VMCFuente (Id, Nombre, Codigo) Values (2,"La Atalaya", "wt");
insert into wt.VMCFuente (Id, Nombre, Codigo) Values (3,"Despertad", "g");
insert into wt.VMCFuente (Id, Nombre, Codigo) Values (4,"Que Enseña", "bh");
insert into wt.VMCFuente (Id, Nombre, Codigo) Values (5,"Ejemplos de Fe", "ia");
insert into wt.VMCFuente (Id, Nombre, Codigo) Values (6,"Guía de Actividades", "mwb");


select * from wt.VMCTema;

insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (1,1,1,1,2016,"2016-01-04","2016-01-10","2 Crónicas 29-32", "Servir a Dios implica esfuerzo");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (2,1,2,1,2016,"2016-01-04","2016-01-10","2 Crónicas 29-32", "Busquemos perlas escondidas");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (3,1,3,1,2016,"2016-01-04","2016-01-10","2 Crónicas 31:1-10", "Lectura de la Biblia");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (4,2,4,1,2016,"2016-01-04","2016-01-10","Presentaciones", "Preparemos las presentaciones de este mes");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (5,6,8,1,2016,"2016-01-04","2016-01-10","2", "Es un honor construir y cuidar nuestros lugares de reunión");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (6,5,10,1,2016,"2016-01-04","2016-01-10","cap. 6 párrs. 1-14", "Estudio bíblico de congregación");

insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (7,1,1,1,2016,"2016-01-11","2016-01-17","2 Crónicas 33-36", "Jehová valora el arrepentimiento sincero");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (8,1,2,1,2016,"2016-01-11","2016-01-17","2 Crónicas 33-36", "Busquemos perlas escondidas");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (9,1,3,1,2016,"2016-01-11","2016-01-17","2 Crónicas 34:22-33", "Lectura de la Biblia");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (10,2,5,1,2016,"2016-01-11","2016-01-17","Enero 2016 - Tema portada", "Primera conversación");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (11,2,6,1,2016,"2016-01-11","2016-01-17","Enero 2016 - Tema portada", "Revisita");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (12,4,7,1,2016,"2016-01-11","2016-01-17","pág. 10 párrs. 6, 7", "Curso bíblico");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (13,2,8,1,2016,"2016-01-11","2016-01-17","06 15/11 pág. 27 párrs. 7-9", "El arrepentimiento es esencial");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (14,6,9,1,2016,"2016-01-11","2016-01-17","4", "Hay que perdonar");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (15,5,10,1,2016,"2016-01-11","2016-01-17","cap. 6 párrs. 15-23 rec.57,58", "Estudio bíblico de congregación");

insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (16,1,1,1,2016,"2016-01-18","2016-01-24","Esdras 1-5", "Jehová cumple sus promesas");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (17,1,2,1,2016,"2016-01-18","2016-01-24","Esdras 1-5", "Busquemos perlas escondidas");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (18,1,3,1,2016,"2016-01-18","2016-01-24","Esdras 3:10-4:7", "Lectura de la Biblia");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (19,2,5,1,2016,"2016-01-18","2016-01-24","Enero 2016 - Ultimo artículo", "Primera conversación");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (20,2,6,1,2016,"2016-01-18","2016-01-24","Enero 2016 - Ultimo artículo", "Revisita");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (21,4,7,1,2016,"2016-01-18","2016-01-24","pág. 20 párrs. 6-8", "Curso bíblico");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (22,6,8,1,2016,"2016-01-18","2016-01-24","5", "Todas estas otras cosas les seran añadidas");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (23,2,9,1,2016,"2016-01-18","2016-01-24","14 15/3 págs. 30-32", "Su palabra: ¿es Sí y, no obstante, No?");
insert into wt.VMCTema (Id, IdFuente, IdAsignacion, Mes, Anio, FechaInicio, FechaFin, Paginas, Tema) Values (24,5,10,1,2016,"2016-01-18","2016-01-24","cap. 7 párrs. 1-14", "Estudio bíblico de congregación");



select * from wt.Persona;

select * from wt.VMCPrograma;

select * from wt.Persona;



insert into wt.Persona (Nombres, Apellidos, Direccion, IdColonia, Zona, IdMunicipio, Telefono01, Telefono02, Movil01, Movil02, Email01, Email02, FechaNacimiento, FechaBautismo, estaBautizado, esHombre, esPublicador, esSoltero, estaInscritoVMC, idConyuge, IdCongregacion)
Values ("Verdy","Guas Gramajo","22 Calle A 38-34",1,5,1,23355310,null,52034500,null,"vguasg@gmail.com","vggramajo@hotmail.com", "1984-06-26","1997-05-17",1,1,1,1,1,null,1);
insert into wt.Persona (Nombres, Apellidos, Direccion, IdColonia, Zona, IdMunicipio, Telefono01, Telefono02, Movil01, Movil02, Email01, Email02, FechaNacimiento, FechaBautismo, estaBautizado, esHombre, esPublicador, esSoltero, estaInscritoVMC, idConyuge, IdCongregacion)
Values ("Hendel","Guas Gramajo","22 Calle A 38-34",1,5,1,23355310,null,59360334,null,"hg.gramajo@gmail.com","hg.gramajo@hotmail.com", "null","null",1,1,1,1,1,null,1);
insert into wt.Persona (Nombres, Apellidos, Direccion, IdColonia, Zona, IdMunicipio, Telefono01, Telefono02, Movil01, Movil02, Email01, Email02, FechaNacimiento, FechaBautismo, estaBautizado, esHombre, esPublicador, esSoltero, estaInscritoVMC, idConyuge, IdCongregacion)
Values ("Hayden","Guas Gramajo","22 Calle A 38-34",1,5,1,23355310,null,33033996,null,"haggramajo@gmail.com","haggramajo@hotmail.com", "null","null",1,1,1,1,1,null,1);
