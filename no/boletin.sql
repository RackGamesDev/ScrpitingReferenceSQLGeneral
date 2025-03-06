--https://txicky.notion.site/Bolet-n-de-ejercicios-8-d9e7cc65b4b545e59d4832712b3b8dca?p=5b7f6a1138b349119fc95b9d4a03a731&pm=s
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
/*CREATE USER examen IDENTIFIED BY 1234;
GRANT ALL PRIVILEGES TO eg1;*/

/*borrado de las tablas */
drop table inventario;
drop table preciosum;
drop table linped;
drop table pedido;
drop table pieza;
drop table vendedor;

/* creacion de tablas */

create table vendedor 
  (
    numvend number(4),
    nomvend varchar2(30),
    nombrecomer varchar2(30),
    telefono char(12),
    calle varchar2(30),
    ciudad varchar2(20),
    provincia varchar2(20),
    constraint pk_vendedor primary key (numvend) 
  );

create table pieza
  (
    numpieza varchar2(16),
    nompieza varchar2(30),
    preciovent number(9,2),
    constraint pk_pieza primary key (numpieza)
  );

create table pedido 
  (
    numpedido number(5),
    numvend number(4),
    fecha date,
    constraint pk_pedido primary key (numpedido),
    constraint fk_ped_ven foreign key (numvend)
	references vendedor (numvend)
  );

create table preciosum 
  (
    numpieza varchar2(16),
    numvend number(4),
    preciounit number(9,2),
    diassum number(3),
    descuento number(2),
    constraint pk_preciosum primary key (numpieza,numvend),
    constraint fk_pre_pie foreign key (numpieza)
      references pieza (numpieza),
    constraint fk_pre_ven foreign key (numvend)
      references vendedor (numvend)
  );

create table linped 
  (
    numpedido number(5),
    numlinea number(2),
    numpieza varchar2(16),
    preciocompra number(9,2),
    cantpedida number(4),
    fecharecep date,
    cantrecibida number(4),
    constraint pk_linped primary key (numpedido,numlinea),
    constraint fk_lin_pie foreign key (numpieza)
      references pieza (numpieza),
    constraint fk_lin_ped foreign key (numpedido)
      references pedido (numpedido)
  );

create table inventario 
  (
    numpieza varchar2(16) constraint nn_inventario not null,
    numbin number(10),
    cantdisponible number(5),
    fecharecuento date,
    periodorecuen number(2),
    cantminima number(5),
    constraint pk_inventario primary key (numbin),
    constraint fk_inv_pie foreign key (numpieza)
      references pieza (numpieza)
  );



/* Inserción de datos en las tablas */

INSERT INTO VENDEDOR VALUES(200,'SEVERINO MARTIN MARTINEZ','SEVESOFT','5779988','GENERAL LACY, 17','ALICANTE','ALICANTE');
INSERT INTO VENDEDOR VALUES(1,'AGAPITO LAFUENTE DEL CORRAL','MECEMSA','96-5782401','Avda. Valencia 3205','ALICANTE','ALICANTE');
INSERT INTO VENDEDOR VALUES(2,'LUCIANO BLAZQUEZ VAZQUEZ','HARW S.A.','96-3232321','GENERAL LACY, 15 2 B','ALICANTE','ALICANTE');
INSERT INTO VENDEDOR VALUES(3,'GODOFREDO MARTIN MARTINEZ','MECEMSA','96-4141722','AVDA. VALENCIA 3372','ALICANTE','ALICANTE');
INSERT INTO VENDEDOR VALUES(4,'JUANITO REINA PRINCESA','HARW S.A.','903-696969','DONDEQUIERAS, 1000, 13F','LO ANGELE','LOS EUS');
INSERT INTO VENDEDOR VALUES(5,'JUANITO REINA PRINCESA','LA DEAQUI','98-5363636','S. FRANCISCO DE ASIS, 10 1','GIJON','ASTURIAS');
INSERT INTO VENDEDOR VALUES(6,'MANOLO PIEDRA POMEZ','HUMP S.A.','96-5660727','AVIACION 92, 3 I','SAN VICENTE','ALICANTE');
INSERT INTO VENDEDOR VALUES(7,'MANUEL PEREZ RODRIGUEZ','SOFTHARD DISTRIBUIDORA S.A.','985696969','ARZOBISPO LOACES','QUINTANAR DE LA ORDE','TOLEDO');
INSERT INTO VENDEDOR VALUES(8,'LUISA PINTO HEREDIA','LA MEJOR S.A.','999-2014455','OXFORD BLUES','NEW ORLEANS','LOUISSIANA');
INSERT INTO VENDEDOR VALUES(9,'CHEMA PAMUNDI','OLE ESPAÑA, S.A.',NULL,'RIVAS VACIA','MADRID','MADRID');
INSERT INTO VENDEDOR VALUES(10,'GUSTAVO DE BASICA','OLE ESPAÑA, S.A.',NULL,'RIVAS VACIA','MADRID','MADRID');
INSERT INTO VENDEDOR VALUES(11,'MARIO DUQUE LIZONDO','BANESTOESSOFT S.L.','98-0101010','MOROS, 19','GIJON','ASTURIAS');
INSERT INTO VENDEDOR VALUES(12,'JOSE ANTONIO MARTINEZ JUAN','OLE ESPAÑA, S.A.','3667788','COLON, 21','VALENCIA','VALENCIA');
INSERT INTO VENDEDOR VALUES(13,'MANUEL GOMEZ SANTISTEBAN','OLE ESPAÑA, S.A.','3667789','COLON, 21','VALENCIA','VALENCIA');
INSERT INTO VENDEDOR VALUES(8001,'JUAN RODRIGUEZ JUAN','HALA S.A.',NULL,NULL,'ALMORADI','ALICANTE');
INSERT INTO VENDEDOR VALUES(8002,'JUAN MARTINEZ GARCIA','HARW S.A.','3334455','CISCAR, 5','VALENCIA','VALENCIA');
INSERT INTO VENDEDOR VALUES(8003,'LUIS RODRIGUEZ SALA','HARW S.A.','3335588','SALAMANCA, 102','VALENCIA','VALENCIA');
INSERT INTO VENDEDOR VALUES(100,'PEDRO GRACIA MORALES','SOFT S.A.',NULL,'SALAMANCA, 100','VALENCIA','VALENCIA');
INSERT INTO VENDEDOR VALUES(101,'SALVADOR PLA GARCIA','TABAC Y SOFT','5661100','MAYOR, 44','SAN VICENTE','ALICANTE');
INSERT INTO VENDEDOR VALUES(102,'SOLEDAD MARTINEZ ORTEGA','ASX. S.A.','87879998','PEREZ GALDOS, 54','ALICANTE','ALICANTE');
INSERT INTO VENDEDOR VALUES(55,'LUIS GARCIA SATORRE','HARW S.A.','5889944','POETA ALONSO, 12','ALICANTE','ALICANTE');
INSERT INTO VENDEDOR VALUES(201,'MANUEL ORTUÑO LAFUENTE','HALA S.A.','5660788','MAYOR, 64','SAN VICENTE','ALICANTE');

INSERT INTO PIEZA VALUES('DD-0001-30','DISCO DURO 30M SEAGATE',200);
INSERT INTO PIEZA VALUES('M-0001-C','MONITOR SYNCMASTER 3 COLOR',170);
INSERT INTO PIEZA VALUES('M-0002-C','MONITOR COLOR SONY BT',350);
INSERT INTO PIEZA VALUES('M-0003-C','MONITOR IBM 3570 COLOR',400);
INSERT INTO PIEZA VALUES('DD-0001-210','DISCO DURO WESTERN DIG 210M 28',250);
INSERT INTO PIEZA VALUES('P-0001-33','PLACA INTEL 33Mz',350);
INSERT INTO PIEZA VALUES('FD-0001-144','FLOPPY 1.44 IBM',180);
INSERT INTO PIEZA VALUES('FD-0002-720','FLOPPY 720K IBM',150);
INSERT INTO PIEZA VALUES('T-0001-IBM','TECLADO XT IBM',110);
INSERT INTO PIEZA VALUES('T-0002-AT','TECLADO AT SUSUSU',55);
INSERT INTO PIEZA VALUES('T-0003-AT','TECLADO AT HP',120);
INSERT INTO PIEZA VALUES('DK144-0001','DISKETTE 1.44 PANASONIC',1.1);
INSERT INTO PIEZA VALUES('DK144-0002-P','PACK DISKETTE 144 PANASONIC',10);
INSERT INTO PIEZA VALUES('O-0001-PP','PEGATINAS CONCIERTO JEVI',20);
INSERT INTO PIEZA VALUES('O-0002-PP','PACK PEGATINAS CONCIERTO JEVI',100);
INSERT INTO PIEZA VALUES('A-1001-L','MOUSE ADL 3B',7);
INSERT INTO PIEZA VALUES('C-400-Z','FILTRO PANTALLA X200',18);
INSERT INTO PIEZA VALUES('C-1002-H',NULL,4);
INSERT INTO PIEZA VALUES('C-1002-J',NULL,7);
INSERT INTO PIEZA VALUES('X-0001-PC','TECLADO ESTANDAR PC',70);

INSERT INTO PEDIDO VALUES (1,1,TO_DATE('05/05/1992','DD/MM/YYYY'));
INSERT INTO PEDIDO VALUES (2,1,TO_DATE('11/10/1992','DD/MM/YYYY'));
INSERT INTO PEDIDO VALUES (3,2,TO_DATE('15/10/1992','DD/MM/YYYY'));
INSERT INTO PEDIDO VALUES (4,2,TO_DATE('16/10/1992','DD/MM/YYYY'));
INSERT INTO PEDIDO VALUES (5,1,TO_DATE('22/10/1992','DD/MM/YYYY'));
INSERT INTO PEDIDO VALUES (6,5,TO_DATE('22/08/1993','DD/MM/YYYY'));
INSERT INTO PEDIDO VALUES (7,8002,TO_DATE('02/10/1992','DD/MM/YYYY'));

INSERT INTO PRECIOSUM VALUES('DD-0001-210',1,150,3,15);
INSERT INTO PRECIOSUM VALUES('DD-0001-210',2,170,5,12);
INSERT INTO PRECIOSUM VALUES('M-0001-C',1,155,3,10);
INSERT INTO PRECIOSUM VALUES('M-0001-C',3,180,7,15);
INSERT INTO PRECIOSUM VALUES('M-0002-C',9,300,1,5);
INSERT INTO PRECIOSUM VALUES('M-0003-C',3,350,2,15);
INSERT INTO PRECIOSUM VALUES('M-0003-C',4,280,7,NULL);
INSERT INTO PRECIOSUM VALUES('P-0001-33',2,210,5,NULL);
INSERT INTO PRECIOSUM VALUES('P-0001-33',1,250,3,NULL);
INSERT INTO PRECIOSUM VALUES('P-0001-33',4,280,7,NULL);
INSERT INTO PRECIOSUM VALUES('P-0001-33',3,250,2,NULL);
INSERT INTO PRECIOSUM VALUES('P-0001-33',5,280,3,10);
INSERT INTO PRECIOSUM VALUES('FD-0001-144',1,130,3,NULL);
INSERT INTO PRECIOSUM VALUES('FD-0002-720',1,60,3,NULL);
INSERT INTO PRECIOSUM VALUES('T-0001-IBM',2,90,5,NULL);
INSERT INTO PRECIOSUM VALUES('T-0002-AT',1,30,3,NULL);
INSERT INTO PRECIOSUM VALUES('T-0002-AT',2,35,5,7);
INSERT INTO PRECIOSUM VALUES('T-0002-AT',4,25,7,NULL);
INSERT INTO PRECIOSUM VALUES('T-0002-AT',5,33,3,NULL);
INSERT INTO PRECIOSUM VALUES('T-0003-AT',1,77.5,3,NULL);
INSERT INTO PRECIOSUM VALUES('T-0003-AT',3,81.45,0,NULL);
INSERT INTO PRECIOSUM VALUES('DK144-0001',1,0.56,3,NULL);
INSERT INTO PRECIOSUM VALUES('DK144-0002-P',1,5.6,3,NULL);
INSERT INTO PRECIOSUM VALUES('DK144-0002-P',2,5.5,5,NULL);
INSERT INTO PRECIOSUM VALUES('O-0001-PP',5,19.5,1,NULL);
INSERT INTO PRECIOSUM VALUES('O-0002-PP',2,99,1,0);
INSERT INTO PRECIOSUM VALUES('O-0002-PP',5,98.75,1,12);
INSERT INTO PRECIOSUM VALUES('A-1001-L',3,5,1,NULL);
INSERT INTO PRECIOSUM VALUES('A-1001-L',4,4.9,1,NULL);
INSERT INTO PRECIOSUM VALUES('C-400-Z',1,8.5,4,5);
INSERT INTO PRECIOSUM VALUES('C-400-Z',8002,7,3,NULL);
INSERT INTO PRECIOSUM VALUES('T-0002-AT',100,34,2,5);
INSERT INTO PRECIOSUM VALUES('A-1001-L',100,4,3,NULL);
INSERT INTO PRECIOSUM VALUES('T-0001-IBM',100,95,5,10);
INSERT INTO PRECIOSUM VALUES('O-0002-PP',101,80,10,NULL);
INSERT INTO PRECIOSUM VALUES('DD-0001-210',101,140,15,14);
INSERT INTO PRECIOSUM VALUES('FD-0001-144',102,136,3,7);
INSERT INTO PRECIOSUM VALUES('FD-0001-144',55,120,10,13);
INSERT INTO PRECIOSUM VALUES('O-0001-PP',55,15,7,NULL);
INSERT INTO PRECIOSUM VALUES('DD-0001-30',1,120,4,NULL);
INSERT INTO PRECIOSUM VALUES('M-0002-C',1,150,10,15);
INSERT INTO PRECIOSUM VALUES('M-0003-C',1,200,7,NULL);
INSERT INTO PRECIOSUM VALUES('T-0001-IBM',1,90,15,NULL);
INSERT INTO PRECIOSUM VALUES('O-0001-PP',1,15,1,NULL);
INSERT INTO PRECIOSUM VALUES('O-0002-PP',1,75,1,NULL);
INSERT INTO PRECIOSUM VALUES('A-1001-L',1,2,3,NULL);
INSERT INTO PRECIOSUM VALUES('C-1002-H',1,0.5,2,NULL);
INSERT INTO PRECIOSUM VALUES('C-1002-J',1,1.5,2,NULL);
INSERT INTO PRECIOSUM VALUES('T-0002-AT',201,30,1,5);

INSERT INTO LINPED VALUES(6,1,'O-0001-PP',15,1000,TO_DATE('25/08/1995','DD/MM/YYYY'),1000);
INSERT INTO LINPED VALUES(6,2,'O-0002-PP',99,2000,TO_DATE('25/08/1995','DD/MM/YYYY'),1998);
INSERT INTO LINPED VALUES(1,1,'M-0001-C',300,10,TO_DATE('10/05/1992','DD/MM/YYYY'),10);
INSERT INTO LINPED VALUES(1,2,'P-0001-33',210,20,TO_DATE('10/05/1992','DD/MM/YYYY'),18);
INSERT INTO LINPED VALUES(1,3,'FD-0001-144',135,20,TO_DATE('10/05/1992','DD/MM/YYYY'),20);
INSERT INTO LINPED VALUES(1,4,'DD-0001-210',150,20,TO_DATE('10/05/1992','DD/MM/YYYY'),20);
INSERT INTO LINPED VALUES(2,1,'DK144-0002-P',5.45,100,TO_DATE('15/10/1992','DD/MM/YYYY'),101);
INSERT INTO LINPED VALUES(2,2,'T-0002-AT',30,1,TO_DATE('15/10/1992','DD/MM/YYYY'),1);
INSERT INTO LINPED VALUES(1,5,'T-0002-AT',31,22,TO_DATE('17/10/1992','DD/MM/YYYY'),22);
INSERT INTO LINPED VALUES(3,1,'DD-0001-210',146,15,TO_DATE('17/10/1992','DD/MM/YYYY'),15);
INSERT INTO LINPED VALUES(3,2,'P-0001-33',210,3,TO_DATE('17/10/1992','DD/MM/YYYY'),3);
INSERT INTO LINPED VALUES(4,1,'O-0002-PP',99,10,TO_DATE('17/10/1992','DD/MM/YYYY'),10);
INSERT INTO LINPED VALUES(5,1,'T-0002-AT',15,15,TO_DATE('11/06/1993','DD/MM/YYYY'),13);
INSERT INTO LINPED VALUES(7,1,'C-400-Z',7,45,TO_DATE('09/10/1992','DD/MM/YYYY'),8);

INSERT INTO INVENTARIO VALUES('DD-0001-30',1,120,TO_DATE('15/10/1990','DD/MM/YYYY'),1,15);
INSERT INTO INVENTARIO VALUES('P-0001-33',2,10,TO_DATE('15/10/1992','DD/MM/YYYY'),null,5);
INSERT INTO INVENTARIO VALUES('O-0002-PP',3,110,TO_DATE('15/10/1992','DD/MM/YYYY'),1,3);
INSERT INTO INVENTARIO VALUES('M-0001-C',4,15,TO_DATE('15/10/1992','DD/MM/YYYY'),2,2);
INSERT INTO INVENTARIO VALUES('M-0003-C',5,2,TO_DATE('20/10/1992','DD/MM/YYYY'),1,0);
INSERT INTO INVENTARIO VALUES('DD-0001-210',6,10,TO_DATE('12/11/1992','DD/MM/YYYY'),2,1);
INSERT INTO INVENTARIO VALUES('FD-0001-144',7,10,TO_DATE('12/11/1992','DD/MM/YYYY'),2,0);

COMMIT;
--SELECT ....
--FROM ....
--WHERE ....
--GROUP BY ....
--HAVING ....
--ORDER BY ....

SELECT * FROM VENDEDOR;

SELECT NUMVEND, NOMVEND FROM VENDEDOR;

SELECT NUMVEND "NUMERO DE VENDEDOR", NOMVEND FROM VENDEDOR;

SELECT NUMVEND AS NUMVENDEDOR, NOMVEND FROM VENDEDOR;

SELECT * FROM PRECIOSUM;

SELECT NUMPIEZA, NUMVEND, PRECIOUNIT*(DESCUENTO/100) AS IMPORTEDESCUENTO FROM PRECIOSUM;

SELECT * FROM VENDEDOR ORDER BY PROVINCIA, CIUDAD ASC;

SELECT NUMPIEZA, NUMVEND, PRECIOUNIT*(DESCUENTO/100) AS IMPORTEDESCUENTO FROM PRECIOSUM ORDER BY IMPORTEDESCUENTO;

SELECT NUMPIEZA, NUMVEND, PRECIOUNIT*(DESCUENTO/100) AS IMPORTEDESCUENTO FROM PRECIOSUM ORDER BY 3 DESC;

SELECT * FROM LINPED;

SELECT * FROM LINPED WHERE CANTPEDIDA>=1000;

SELECT * FROM LINPED WHERE CANTPEDIDA>=1000 AND CANTRECIBIDA>1500;

SELECT * FROM LINPED WHERE CANTPEDIDA>=1000 OR CANTRECIBIDA>50;

SELECT * FROM LINPED WHERE (CANTPEDIDA>=1000 OR CANTRECIBIDA>50) AND PRECIOCOMPRA BETWEEN 10 AND 100;

SELECT * FROM LINPED WHERE CANTPEDIDA<>1000;

SELECT * FROM VENDEDOR WHERE PROVINCIA IN ('ALICANTE','VALENCIA','CASTELLON');

SELECT * FROM VENDEDOR WHERE NOMBRECOMER LIKE '%SOFT%';

SELECT VENDEDOR.NUMVEND FROM VENDEDOR, PRECIOSUM WHERE VENDEDOR.NUMVEND=PRECIOSUM.NUMVEND; 

SELECT V.NUMVEND FROM VENDEDOR V, PRECIOSUM PR WHERE V.NUMVEND=PR.NUMVEND; 

SELECT * FROM VENDEDOR V, PRECIOSUM PR WHERE V.NUMVEND=PR.NUMVEND; 

SELECT DISTINCT NUMPIEZA FROM VENDEDOR V, PRECIOSUM PR WHERE V.NUMVEND=PR.NUMVEND AND V.PROVINCIA='ALICANTE' ORDER BY 1; 

SELECT DISTINCT NUMPIEZA FROM VENDEDOR V JOIN PRECIOSUM PR ON V.NUMVEND=PR.NUMVEND WHERE V.PROVINCIA='ALICANTE' ORDER BY 1;

SELECT DISTINCT P. NOMPIEZA FROM VENDEDOR V JOIN PRECIOSUM PR ON V.NUMVEND=PR.NUMVEND JOIN PIEZA P ON P.NUMPIEZA=PR.NUMPIEZA 
WHERE V.PROVINCIA='ALICANTE' ORDER BY 1;

SELECT COUNT(*) "NUMERO DE VENDEDEDORES", PROVINCIA FROM VENDEDOR GROUP BY PROVINCIA;

SELECT COUNT(*) "NUMERO DE VENDEDEDORES", PROVINCIA FROM VENDEDOR GROUP BY PROVINCIA HAVING COUNT(*)>3;

SELECT SUM(PRECIOCOMPRA), NUMPEDIDO FROM LINPED WHERE FECHARECEP<TO_DATE('01/01/94','DD/MM/YY') GROUP BY NUMPEDIDO;

SELECT MAX(PRECIOCOMPRA), NUMPEDIDO FROM LINPED WHERE FECHARECEP<TO_DATE('01/01/94','DD/MM/YY') GROUP BY NUMPEDIDO;

SELECT MIN(PRECIOCOMPRA), NUMPEDIDO FROM LINPED WHERE FECHARECEP<TO_DATE('01/01/94','DD/MM/YY') GROUP BY NUMPEDIDO;

SELECT AVG(PRECIOCOMPRA), NUMPEDIDO FROM LINPED WHERE FECHARECEP<TO_DATE('01/01/94','DD/MM/YY') GROUP BY NUMPEDIDO;

SELECT * FROM LINPED;

SELECT NUMPEDIDO, SUM(PRECIOCOMPRA*CANTPEDIDA) "TOTAL_PEDIDO" FROM LINPED GROUP BY NUMPEDIDO;

SELECT NUMPEDIDO, SUM(PRECIOCOMPRA*CANTPEDIDA) TOTAL_PEDIDO FROM LINPED GROUP BY NUMPEDIDO 
HAVING SUM(PRECIOCOMPRA*CANTPEDIDA)>1000 ORDER BY TOTAL_PEDIDO;

SELECT NUMPEDIDO, SUM(PRECIOCOMPRA*CANTPEDIDA) TOTAL_PEDIDO FROM LINPED GROUP BY NUMPEDIDO 
HAVING AVG(PRECIOCOMPRA*CANTPEDIDA)>100 AND SUM(PRECIOCOMPRA*CANTPEDIDA)>500 ORDER BY TOTAL_PEDIDO;

COMMIT;


/*
VENDEDOR: datos de cada vendedor (empresas)
	numven(id), 
	nomvend(nombre de la persona), 
	nombrecomer(nombre de la empresa), 
	telefono, 
	calle, 
	ciudad
	provincia

	PEDIDO: datos sobre cada pedido que hace la empresa a un vendedor
		numpedido(id), 
		numvend*(el id del VENDEDOR al que se le pidio), 
		fecha

PIEZA: datos de cada pieza
	numpieza(codigo), 
	nompieza(nombre de la pieza), 
	preciovent(precio de unidad)

	INVENTARIO: como se almacena una pieza y la cantidad que se tiene etc
		numpieza*(la PIEZA a la que se refiere), 
		numbin(id), 
		cantdisponible, 
		fecharecuento, 
		periodorecuen(), 
		cantminima

LINPED: dentro de un pedido, la cantidad y precio de una pieza
	numpedido*(id del PEDIDO al que pertenece), 
	numlinea(id), 
	numpieza*(codigo de la PIEZA que se compro), 
	preciocompra, 
	cantpedida(cantidad), 
	fecharecep, 
	cantrecibida

PRECIOSUM: oferta de un vendedor sobre la venta de su pieza
	numpieza*(la PIEZA que se oferta), 
	numvend*(el VENDEDOR que la vende), 
	preciounit, 
	diassum(cantidad de dias que puede tardar), 
	descuendo

 */





















--ÑÑÑÑÑÑÑÑÑÑÑ EJ 7.1
--1. Obtener todos los números de piezas de las piezas de la base de datos.
SELECT NUMPIEZA FROM PIEZA ORDER BY NUMPIEZA;

--2. Nombre de todas las piezas con un precio de venta menor que 1000.
SELECT NOMPIEZA FROM PIEZA WHERE PRECIOVENT<1000;

--3. Número, nombre y precio de venta de las piezas de precio de venta mayor que 10 o menor que 1 euros, ordenadas de menor a mayor precio.
SELECT * FROM PIEZA WHERE PRECIOVENT>10 OR PRECIOVENT<1 ORDER BY PRECIOVENT;

--4. Para cada pieza de la que se conozca algún suministrador, 
--obtener el número de pieza y el descuento, en orden descendente del valor de descuento.
SELECT NUMPIEZA,NUMVEND,DESCUENTO FROM PRECIOSUM ORDER BY DESCUENTO DESC;

--Si queremos eliminar los valores nulos.
SELECT NUMPIEZA,NUMVEND,DESCUENTO FROM PRECIOSUM WHERE DESCUENTO IS NOT NULL ORDER BY DESCUENTO DESC;


--5. Nombre de los vendedores con número de vendedor menor que 6.
SELECT NOMVEND FROM VENDEDOR WHERE NUMVEND<6;

--6. Modificar el requerimiento anterior para eliminar duplicados.
SELECT DISTINCT NOMVEND FROM VENDEDOR WHERE NUMVEND<6;

--7. Número y nombre de los vendedores con número de vendedor menor que 6.
SELECT DISTINCT NUMVEND,NOMVEND FROM VENDEDOR WHERE NUMVEND<6;

--8. Obtener todos los números de los vendedores de los que se sepa que pueden suministrar alguna pieza.
SELECT DISTINCT NUMVEND FROM PRECIOSUM ORDER BY NUMVEND;

--9. Vendedores de la provincia de Alicante.
SELECT NOMVEND FROM VENDEDOR WHERE provincia IN ('Alicante', 'ALICANTE', 'alicante');

SELECT NOMVEND FROM VENDEDOR WHERE UPPER(provincia)='ALICANTE';

--10. Nombre y empresa de los vendedores de la Comunidad Valenciana.
SELECT NOMVEND, NOMBRECOMER FROM VENDEDOR WHERE UPPER(PROVINCIA) IN ('ALICANTE','VALENCIA','CASTELLON','CASTELLÓN');

--11. Números de vendedores y días que tardarían en suministrar la pieza 'P-0001-33'
SELECT NUMVEND,DIASSUM FROM PRECIOSUM WHERE NUMPIEZA='P-0001-33';

--12. Códigos de pieza solicitados en el pedido 1, ordenados de mayor a menor precio de compra.
SELECT NUMPIEZA FROM LINPED WHERE numpedido=1 ORDER BY preciocompra DESC;

--13. Números de pedido y números de vendedor, para los pedidos solicitados el 15 de octubre de 1992.
SELECT NUMPEDIDO, NUMVEND FROM PEDIDO WHERE fecha=TO_DATE('15/10/1992','DD/MM/YYYY');

--14. Códigos de pieza de los que se sabe que algún vendedor nos podría hacer descuento.
SELECT DISTINCT NUMPIEZA FROM PRECIOSUM WHERE DESCUENTO IS NOT NULL;

--15. Códigos de pieza, de posible suministrador y precio de suministro, ordenados por código de vendedor y código de pieza.
SELECT NUMPIEZA, NUMVEND, PRECIOUNIT FROM PRECIOSUM ORDER BY NUMVEND, NUMPIEZA;























--ÑÑÑÑÑÑÑÑÑÑ EJ 7.2
--1. Obtener el número de pieza junto con el nombre de todas las provincias desde las que puede sernos suministrada, en orden descendente del número de pieza.
SELECT NUMPIEZA,PROVINCIA FROM PRECIOSUM PS,VENDEDOR V WHERE PS.NUMVEND=V.NUMVEND ORDER BY PS.NUMPIEZA DESC;

--2. Modificar el requerimiento anterior para eliminar duplicados.
SELECT DISTINCT NUMPIEZA,PROVINCIA FROM PRECIOSUM PS,VENDEDOR V WHERE PS.NUMVEND=V.NUMVEND ORDER BY PS.NUMPIEZA DESC

--3. Lista el nombre y número de las piezas.
SELECT NUMPIEZA, NOMPIEZA FROM PIEZA;

--4. Obtener el nombre y número de proveedores de la provincia de Valencia.
SELECT V.NUMVEND, V.NOMVEND FROM VENDEDOR V WHERE UPPER(V.PROVINCIA)='VALENCIA';

--5. Obtener el nombre y número de proveedores de la provincia de Valencia a los que se les ha solicitado un pedido.
SELECT V.NUMVEND, V.NOMVEND FROM VENDEDOR V, PEDIDO P WHERE P.NUMVEND=V.NUMVEND AND UPPER(V.PROVINCIA)='VALENCIA';

--6. Obtener los números de línea y su precio de compra del pedido número 1.
SELECT L.NUMLINEA, L.PRECIOCOMPRA FROM LINPED L WHERE NUMPEDIDO=1;

--7. Obtener todas las piezas que se recuenten el 15/10/1992.
SELECT P.NUMPIEZA, P.NOMPIEZA, P.PRECIOVENT FROM PIEZA P, INVENTARIO I WHERE P.NUMPIEZA=I.NUMPIEZA AND I.FECHARECUENTO = TO_DATE('15/10/1992','DD/MM/YYYY');

--8. Obtener número y nombre de todas las piezas recibidas el 1 de Mayo de 1992.
SELECT P.NUMPIEZA, P.NOMPIEZA FROM PIEZA P, LINPED L WHERE P.NUMPIEZA=L.NUMPIEZA AND L.FECHARECEP= TO_DATE('01/05/1992','DD/MM/YYYY');

--9. Precio unitario de suministro del número de pieza A-1001-L y el vendedor 100.
SELECT PRECIOUNIT FROM PRECIOSUM WHERE NUMVEND = 100 AND NUMPIEZA='A-1001-L'

--10. Nombres de proveedores que puedan suministrarnos la pieza numero A-1001-L
SELECT NOMVEND FROM VENDEDOR V, PRECIOSUM PS WHERE PS.NUMVEND=V.NUMVEND AND PS.NUMPIEZA='A-1001-L'

--11. Obtener nombre, teléfono, y ciudad del vendedor que puede suministrarnos piezas con valor mayor de 100.
SELECT DISTINCT V.NOMVEND, V.TELEFONO, V.CIUDAD FROM VENDEDOR V, PRECIOSUM PS WHERE V.NUMVEND=PS.NUMVEND AND PS.PRECIOUNIT>100;

--12. Obtener los vendedores que pueden suministrarnos piezas con un descuento de más de 10%.
SELECT DISTINCT V.* FROM VENDEDOR V, PRECIOSUM PS WHERE V.NUMVEND=PS.NUMVEND AND PS.DESCUENTO>10; 

--13. Obtener los números de pedido del vendedor número1.
SELECT NUMPEDIDO FROM PEDIDO WHERE NUMVEND = 1;

--14. Obtener los vendedores ordenados alfabéticamente en or dendescendente.
SELECT V.* FROM VENDEDOR V ORDER BY V.NOMVEND DESC;

--15. Ídem en orden ascendente.
SELECT V.* FROM VENDEDOR V ORDER BY V.NOMVEND ASC;

--16. Obtener los números de pieza de las que conozcamos algún vendedor que nos la pueda suministrar.
SELECT DISTINCT PS.NUMPIEZA FROM PRECIOSUM PS WHERE NUMVEND IS NOT NULL;

--17. Número y nombre de las piezas que puedan suministrarnos el vendedor número 2 y el 4 (no necesariamente que las puedan suministrar los dos).
SELECT P.NUMPIEZA, NOMPIEZA FROM PRECIOSUM PS, PIEZA P WHERE PS.NUMPIEZA=P.NUMPIEZA AND (NUMVEND = 2 OR NUMVEND = 4)

--18. Piezas que nos puedan suministar los vendedores de la empresa HarwS.A.
SELECT P.* FROM VENDEDOR V, PRECIOSUM PS, PIEZA P WHERE PS.NUMVEND=V.NUMVEND AND P.NUMPIEZA=PS.NUMPIEZA AND UPPER(V.NOMBRECOMER)=UPPER('HARW S.A.');

--19. Número, nombre y precio de venta de las piezas que han sido compradas en un pedido servido por el vendedor 1.
SELECT NOMPIEZA, L.NUMPIEZA, PRECIOVENT FROM PIEZA PZ, PEDIDO P,LINPED L WHERE NUMVEND = 1 AND P.NUMPEDIDO=L.NUMPEDIDO AND L.NUMPIEZA=PZ.NUMPIEZA;

--20. Número y nombre de vendedor, y pieza que ha sido comprada a un precio mayor que el estipulado en la lista de precios de suministro.
SELECT V.NUMVEND, V.NOMVEND, PS.NUMPIEZA FROM LINPED L, VENDEDOR V, PRECIOSUM PS WHERE L.NUMPIEZA=PS.NUMPIEZA AND V.NUMVEND=PS.NUMVEND AND L.PRECIOCOMPRA>PS.PRECIOUNIT;

--21. Número de pieza y número y nombre de vendedor de aquellas piezas cuyo precio de venta es mayor que 50 o su descuento de suministro es mayor que 10.
SELECT P.NUMPIEZA, V.NUMVEND, V.NOMVEND FROM VENDEDOR V, PIEZA P, PRECIOSUM PR WHERE V.NUMVEND=PR.NUMVEND AND P.NUMPIEZA=PR.NUMPIEZA AND (P.PRECIOVENT>50 OR PR.DESCUENTO>10);

--22. Pedidos y datos del vendedor cuya fecha de pedido no sea el 22 de octubre de 1992.
SELECT PE.NUMPEDIDO,PE.NUMVEND, V.NOMVEND, V.NOMBRECOMER, V.TELEFONO, V.CALLE, V.CIUDAD, V.PROVINCIA, PE.FECHA FROM VENDEDOR V, PEDIDO PE WHERE PE.NUMVEND=V.NUMVEND AND PE.FECHA<>TO_DATE('22/10/1992','DD/MM/YYYY');

--23. Precios a los que nos pueden ser suministradas las piezas DD-0001-210 y FD-0001-144, y número y nombre de los vendedores que las podrían suministrar a esos precios.
SELECT PR.PRECIOUNIT, PR.NUMVEND, V. NOMVEND, PR.NUMPIEZA FROM VENDEDOR V, PRECIOSUM PR WHERE PR.NUMVEND=V.NUMVEND AND (PR.NUMPIEZA='DD-0001-210' OR PR.NUMPIEZA='FD-0001-144') ORDER BY PR.NUMPIEZA;





















--ÑÑÑÑÑÑÑÑÑÑÑ EJ 7.3
-- 1. Obtener el nombre de las piezas que puedan ser suministradas por aquellos proveedores cuyo nombre empiece por S.
SELECT P.NOMPIEZA FROM PIEZA P JOIN PRECIOSUM PS ON P.NUMPIEZA=PS.NUMPIEZA JOIN VENDEDOR V ON V.NUMVEND=PS.NUMVEND WHERE UPPER(V.NOMVEND) LIKE 'S%';

-- 2. Obtener el nombre de las piezas que puedan ser suministradas por proveedores cuyo nombre empiece por S, y se llamen de apellido Martínez o Martín.
SELECT P.NOMPIEZA FROM PIEZA P JOIN PRECIOSUM PS ON P.NUMPIEZA=PS.NUMPIEZA JOIN VENDEDOR V ON V.NUMVEND=PS.NUMVEND 
WHERE UPPER(V.NOMVEND) LIKE 'S%' AND(
UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 2))='MARTINEZ' OR UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 2))='MARTÍNEZ' OR 
UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 3))='MARTINEZ' OR UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 3))='MARTÍNEZ' OR
UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 2))='MARTIN' OR UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 2))='MARTÍN' OR
UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 3))='MARTIN' OR UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 3))='MARTÍN');

--SOLUCIONADA CON IN
SELECT P.NOMPIEZA FROM PIEZA P JOIN PRECIOSUM PS ON P.NUMPIEZA=PS.NUMPIEZA JOIN VENDEDOR V ON V.NUMVEND=PS.NUMVEND 
WHERE UPPER(V.NOMVEND) LIKE 'S%' AND(
UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 2)) IN ('MARTINEZ','MARTÍNEZ','MARTIN','MARTÍN')
UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 3)) IN ('MARTINEZ','MARTÍNEZ','MARTIN','MARTÍN');

--regexp_substr( 'This is a regexp_substr demo', '[[:alpha:]]+', 1, 4) conseguiriamos partir la cadena por los espacios y conseguir la cuarta letra
--esta función devolvería regexp_substr

-- 3. Obtener los nombres de los vendedores de las provincias de Valencia, Castellón o Alicante.
SELECT V.NOMVEND FROM VENDEDOR V WHERE UPPER(V.PROVINCIA)='CASTELLÓN' OR UPPER(V.PROVINCIA)='CASTELLON' OR UPPER(V.PROVINCIA)='VALENCIA' OR UPPER(V.PROVINCIA)='ALICANTE';

--SOLUCIONADO CON IN
SELECT V.NOMVEND FROM VENDEDOR V WHERE UPPER(V.PROVINCIA) IN ('CASTELLÓN' ,'CASTELLON' ,'VALENCIA' ,'ALICANTE');


-- 4. Nombres de vendedores que empieza su nombre por J.
SELECT * FROM VENDEDOR V WHERE UPPER(V.NOMVEND) LIKE 'J%';

-- 5. Nombres de vendedores que termina su nombre por Z.
SELECT * FROM VENDEDOR V WHERE UPPER(V.NOMVEND) LIKE '%Z';


-- 6. Nombres de vendedores que se apellidan López.
SELECT V.NOMVEND FROM VENDEDOR V WHERE 
UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 2))='LOPEZ' OR UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 2))='LÓPEZ' OR 
UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 3))='LOPEZ' OR UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 3))='LÓPEZ';

-- 7. Nombre de vendedores que el nombre empieza por M seguido de cualquier carácter simple, una R y cualquier cadena de n caracteres.
SELECT V.NOMVEND FROM VENDEDOR V WHERE UPPER(V.NOMVEND='M_R%');

-- 8. Obtener los vendedores de la provincia de Valencia o Alicante que su nombre empieza por J o por M y tienen un número de vendedor entre 1 y 100.
SELECT V.* FROM VENDEDOR V WHERE (UPPER(V.PROVINCIA)='VALENCIA' OR UPPER(V.PROVINCIA)='ALICANTE') AND (UPPER(V.NOMVEND) LIKE 'J%' OR UPPER(V.NOMVEND) LIKE 'M%') AND V.NUMVEND BETWEEN 1 AND 100;

-- 9. Listar los nombres y números de vendedores así como el número y nombre de las piezas que pueden suministrar, para los vendedores de la provincia de Valencia o Alicante.
SELECT V.NUMVEND,V.NOMVEND,PS.NUMPIEZA,P.NOMPIEZA FROM VENDEDOR V JOIN PRECIOSUM PS ON V.NUMVEND=PS.NUMVEND JOIN PIEZA P ON PS.NUMPIEZA=P.NUMPIEZA WHERE UPPER(V.PROVINCIA)='VALENCIA' OR UPPER(V.PROVINCIA)='ALICANTE'; 

-- 10. Obtener los nombres de pieza que pueden suministrar los vendedores de apellido 'García'.
SELECT P.NOMPIEZA FROM PIEZA P JOIN PRECIOSUM PS ON P.NUMPIEZA=PS.NUMPIEZA JOIN VENDEDOR V ON V.NUMVEND=PS.NUMVEND WHERE
UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 2))='GARCIA' OR UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 2))='GARCÍA' OR
UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 3))='GARCIA' OR UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 3))='GARCÍA'

--SOLUCIONADA CON EL OPERADOR IN

SELECT P.NOMPIEZA FROM PIEZA P JOIN PRECIOSUM PS ON P.NUMPIEZA=PS.NUMPIEZA JOIN VENDEDOR V ON V.NUMVEND=PS.NUMVEND WHERE
UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 2)) IN ('GARCIA', 'GARCÍA') OR
UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 3)) IN ('GARCIA', 'GARCÍA');

-- 11. Piezas que sabemos que nos puede suministrar algún vendedor.
SELECT DISTINCT P.* FROM PRECIOSUM PS JOIN PIEZA P ON PS.NUMPIEZA=P.NUMPIEZA;

-- 12. Obtener todos los vendedores que tengan teléfono.
SELECT V.* FROM VENDEDOR V WHERE V.TELEFONO IS NOT NULL;

-- 13. Listar las piezas con un descuento entre 1 y 10 cuyo nombre contenga una O y que se las hayamos solicitado a proveedores cuyo número oscile entre el 1 y el 1000.
SELECT P.* FROM PIEZA P JOIN PRECIOSUM PS ON P.NUMPIEZA=PS.NUMPIEZA WHERE
PS.DESCUENTO BETWEEN 1 AND 10 AND P.NOMPIEZA LIKE '%O%' AND PS.NUMVEND BETWEEN 1 AND 1000;

-- 14. Obtener los nombres de vendedores en orden alfabético.
SELECT V.NOMVEND FROM VENDEDOR V ORDER BY V.NOMVEND;

-- 15. Obtener nombre de vendedores y nombre de piezas que pueden suministrar ordenado en orden alfabético.
SELECT V.NOMVEND, P.NOMPIEZA FROM PIEZA P JOIN PRECIOSUM PS ON P.NUMPIEZA=PS.NUMPIEZA JOIN VENDEDOR V ON PS.NUMVEND=V.NUMVEND ORDER BY V.NOMVEND,P.NOMPIEZA;

-- 16. Obtener todos los nombres de piezas que pueda suministrar el vendedor 100, el 300 y/o el 400 con un precio de venta entre 10 y 1000, y un precio unitario entre 1 y 500.
SELECT P.NOMPIEZA FROM PIEZA P JOIN PRECIOSUM PS ON PS.NUMPIEZA=P.NUMPIEZA WHERE
PS.NUMVEND IN (100,300, 400) AND P.PRECIOVENT BETWEEN 10 AND 1000 AND PS.PRECIOUNIT BETWEEN 1 AND 500;

-- 17. Obtener el número de pieza y el precio de los monitores.
SELECT P.NUMPIEZA,P.PRECIOVENT FROM PIEZA P WHERE UPPER(P.NOMPIEZA) LIKE 'MONITOR%';

-- 18. Nombre de las piezas que pueden sernos suministradas desde la Comunidad Valenciana.
SELECT P.NOMPIEZA FROM PIEZA P JOIN PRECIOSUM PS ON PS.NUMPIEZA=P.NUMPIEZA JOIN VENDEDOR V ON V.NUMVEND=PS.NUMVEND WHERE UPPER(V.PROVINCIA) IN ('ALICANTE','VALENCIA','CASTELLON','CASTELLÓN');

-- 19. Obtener los vendedores que viven en la calle Ciscar o Salamanca y de la Empresa Harw S.A.
SELECT V.* FROM VENDEDOR V WHERE UPPER(V.NOMBRECOMER)=UPPER('Harw S.A.') AND (UPPER(V.CALLE) LIKE '%CISCAR%' OR UPPER(V.CALLE) LIKE '%SALAMANCA%');

-- 20. Obtener nombres de vendedores y números de pieza que nos pueden suministrar, de aquellos vendedores cuyo apellido comienza por Martín, y ordenados alfabéticamente.
SELECT V.NOMVEND, PS.NUMPIEZA FROM VENDEDOR V JOIN PRECIOSUM PS ON V.NUMVEND=PS.NUMVEND WHERE 
UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 2)) LIKE 'MARTIN%' OR UPPER(REGEXP_SUBSTR( V.NOMVEND, '[[:alpha:]]+', 1, 2)) LIKE 'MARTÍN%' ORDER BY V.NOMVEND, PS.NUMPIEZA;

-- 21. Número y nombre de los vendedores que no ofertan ninguna pieza.
SELECT V.NUMVEND, V.NOMVEND FROM VENDEDOR V WHERE V.NUMVEND NOT IN (SELECT DISTINCT PS.NUMVEND FROM PRECIOSUM PS) ORDER BY 1;

-- 22. Número y nombre de los vendedores a los que se les ha solicitado algún pedido.
SELECT V.NUMVEND, V.NOMVEND FROM VENDEDOR V WHERE V.NUMVEND IN (SELECT DISTINCT P.NUMVEND FROM PEDIDO P) ORDER BY 1;

-- 23. Número y nombre de los vendedores a los que no se les ha solicitado pedidos.
SELECT V.NUMVEND, V.NOMVEND FROM VENDEDOR V WHERE V.NUMVEND IN (SELECT DISTINCT P.NUMVEND FROM PEDIDO P) ORDER BY 1;


















--ÑÑÑÑÑÑÑÑÑÑÑ EJ 7.4
--1. Obtener la diferencia entre cantidad pedida y cantidad recibida de las líneas del pedido 1.
SELECT NUMLINEA,CANTPEDIDA-CANTRECIBIDA "UNIDADES NO RECIBIDAS" FROM LINPED WHERE NUMPEDIDO=1;

--2. Media de días de intervalo entre la fecha de envío del pedido 1 y de entrega de las distintas piezas solicitadas en ese pedido
SELECT AVG(ABS(PD.FECHA-L.FECHARECEP)) "MEDIA DE DÍAS"  FROM LINPED L, PEDIDO PD WHERE PD.NUMPEDIDO = 1 AND L.NUMPEDIDO = PD.NUMPEDIDO;
SELECT AVG(ABS(PD.FECHA-L.FECHARECEP)) "MEDIA DE DIAS" FROM LINPED L JOIN PEDIDO PD ON PD.NUMPEDIDO=L.NUMPEDIDO WHERE PD.NUMPEDIDO=1;

--3. Obtener la cantidad de provincias distintas de las que tenemos conocimiento de algún proveedor.
SELECT COUNT(DISTINCT V.PROVINCIA) "CANTIDAD DE PROVINCIAS" FROM VENDEDOR V;

--4. Mínima diferencia entre precio de compra y precio de suministro del vendedor al que se le compró.
SELECT MIN(ABS(L.PRECIOCOMPRA-PS.PRECIOUNIT)) "MÍNIMA DIFERENCIA DE PRECIO" FROM PRECIOSUM PS, PEDIDO PD, LINPED L WHERE PS.NUMVEND = PD.NUMVEND AND PD.NUMPEDIDO = L.NUMPEDIDO AND L.NUMPIEZA = PS.NUMPIEZA;

--5. Media de precios distintos de venta de piezas.
SELECT ROUND(AVG(DISTINCT P.PRECIOVENT),2) "MEDIA DE PRECIOS DE VENTA" FROM PIEZA P;

--6. Máximo descuento (en euros) de las piezas suministradas.
SELECT MAX(PS.PRECIOUNIT*PS.DESCUENTO/100) "MÁXIMO DESCUENTO" FROM PRECIOSUM PS;

--7. Número, nombre y diferencia entre precio de venta y precio de compra de la(s) pieza(s) que suministran los vendedores de Alicante.
SELECT P.NUMPIEZA, P.NOMPIEZA, (P.PRECIOVENT-L.PRECIOCOMPRA) "DIFERENCIA DE PRECIOS DE VENTA Y COMPRA" FROM PIEZA P, VENDEDOR V, PEDIDO PD, LINPED L 
WHERE P.NUMPIEZA=L.NUMPIEZA AND V.NUMVEND=PD.NUMVEND AND L.NUMPEDIDO=PD.NUMPEDIDO AND UPPER(V.PROVINCIA)='ALICANTE';

--8. Máximo, mínimo y media de precio de venta de las piezas.
SELECT MAX(P.PRECIOVENT) "MÁXIMO DE PRECIO VENTA",MIN(P.PRECIOVENT) "MÍNIMO DE PRECIO VENTA", AVG(P.PRECIOVENT) "MEDIA DE PRECIO VENTA" FROM PIEZA P;

--9. Cantidad total de piezas que sabemos nos pueden suministrar los proveedores.
SELECT COUNT(DISTINCT PS.NUMPIEZA) "NÚMERO DE PROVEEDORES" FROM PRECIOSUM PS;

--10. Cantidad de vendedores de nuestra BD.
SELECT COUNT(DISTINCT V.NUMVEND) "NÚMERO DE VENDEDORES" FROM VENDEDOR V;

--11. Total de la diferencia en euros entre lo pagado por compra de artículos y sus respectivos precios de suministro ofrecidos en su día por los proveedores si el segundo precio es menor que el primero.
SELECT SUM(L.PRECIOCOMPRA-PS.PRECIOUNIT) "SUMA DE LA DIFERENCIA DE PRECIOS" FROM PRECIOSUM PS, LINPED L WHERE PS.NUMPIEZA=L.NUMPIEZA AND L.PRECIOCOMPRA<PS.PRECIOUNIT;


















--ÑÑÑÑÑÑÑÑÑÑÑ EJ 7.5
/*1--Obtener para cada pieza, nombre de la pieza, precio de venta, y la media de la diferencia entre el precio de venta y el de suministro.*/

SELECT PI.NOMPIEZA,PI.PRECIOVENT,ROUND(AVG(PI.PRECIOVENT-PR.PRECIOUNIT),2) "Media Precios" FROM PIEZA PI 
JOIN PRECIOSUM PR ON PI.NUMPIEZA=PR.NUMPIEZA GROUP BY PI.NOMPIEZA,PI.PRECIOVENT ORDER BY 1; 

/*2--Obtener para cada número de pedido, el precio pagado en total por ese pedido, la cantidad pedida total 
así como la diferencia entre cantidad pedida total y cantidad recibida total.*/

SELECT LI.NUMPEDIDO "Número de Pedido", SUM(LI.CANTPEDIDA*LI.PRECIOCOMPRA) "Precio Total", SUM(LI.CANTPEDIDA) "Cantidad Total", 
(SUM(LI.CANTPEDIDA)-SUM(LI.CANTRECIBIDA)) "Diferencia entre Pedida y Recibida" FROM LINPED LI GROUP BY LI.NUMPEDIDO ORDER BY 1; 

/*3--Obtener la cantidad de vendedores de cada empresa, indicando cantidad y nombre de la misma, ordenado descendentemente por cantidad de empleados.*/

SELECT VE.NOMBRECOMER "Nombre Empresa", COUNT(VE.NUMVEND) "Cantidad Vendedores" FROM VENDEDOR VE GROUP BY VE.NOMBRECOMER ORDER BY 2 DESC; 

/*4--Obtener, por pieza solicitada, la máxima diferencia entre cantidad pedida y cantidad recibida de entre todas las veces en que fue servida.*/

SELECT LI
.NUMPIEZA,MAX(LI.CANTPEDIDA-LI.CANTRECIBIDA) "Máxima Diferencia" FROM LINPED LI GROUP BY LI.NUMPIEZA ORDER BY 1;

/*5--Obtener para cada pieza, el número de la pieza y el número total de vendedores que nos pueden suministrar esa pieza.*/

SELECT PR.NUMPIEZA "Número Pieza",COUNT(PR.NUMVEND) "Número Total Vendedores" FROM PRECIOSUM PR GROUP BY PR.NUMPIEZA;

/*6--Obtener número de pieza y número total de vendedores que la pueden suministrar para piezas de más de 250 de precio de venta.*/

SELECT PR.NUMPIEZA "Número Pieza",COUNT(PR.NUMVEND) "Número Total Vendedores" FROM PRECIOSUM PR 
JOIN PIEZA PI ON PI.NUMPIEZA=PR.NUMPIEZA WHERE PI.PRECIOVENT>250 GROUP BY PR.NUMPIEZA ORDER BY 1;

/*7--De cada pieza obtener el precio unitario medio de suministro.*/

SELECT PR.NUMPIEZA "Número Pieza",ROUND(AVG(PR.PRECIOUNIT),2) "Precio Unitario Medio" FROM PRECIOSUM PR GROUP BY PR.NUMPIEZA ORDER BY 1; 

/*8--De cada pieza de precio de venta mayor que 250 obtener el precio medio de suministro.*/

SELECT PI.NUMPIEZA "Número Pieza",ROUND(AVG(PR.PRECIOUNIT),2) "Precio Medio Suministro" FROM PRECIOSUM PR 
JOIN PIEZA PI ON PI.NUMPIEZA=PR.NUMPIEZA AND PI.PRECIOVENT>250 GROUP BY PI.NUMPIEZA ORDER BY 1; 

/*9--Obtener la media de las ventas (en euros) realizadas por cada vendedor de cada pieza.*/

SELECT PE.NUMVEND "Número Vendedor",LI.NUMPIEZA "Número Pieza",ROUND(AVG(LI.PRECIOCOMPRA*LI.CANTPEDIDA),2) "Media de Ventas" FROM LINPED LI 
JOIN PEDIDO PE ON PE.NUMPEDIDO=LI.NUMPEDIDO GROUP BY LI.NUMPIEZA,PE.NUMVEND ORDER BY 1; 

/*10--Obtener la cantidad de pedidos efectuados por fecha y el total pagado por las mercancías.*/

SELECT PE.FECHA, COUNT(LI.NUMPEDIDO) "Cantidad pedidos", SUM(LI.PRECIOCOMPRA*LI.CANTPEDIDA) "Total pagado mercancías" FROM LINPED LI 
JOIN PEDIDO PE ON PE.NUMPEDIDO=LI.NUMPEDIDO GROUP BY PE.FECHA ORDER BY 1; 

/*11--Calcular las ganancias (precio de compra menos precio de suministro por la cantidad recibida) de cada vendedor que ha efectuado alguna venta.*/

SELECT PE.NUMVEND "Número de Vendedor", SUM((LI.PRECIOCOMPRA-PR.PRECIOUNIT)*LI.CANTRECIBIDA) "Ganancias" FROM LINPED LI,PRECIOSUM PR,PEDIDO PE 
WHERE LI.NUMPEDIDO=PE.NUMPEDIDO AND LI.NUMPIEZA=PR.NUMPIEZA GROUP BY PE.NUMVEND;

/*12--Calcular por número de pedido, la media de la diferencia entre el precio de compra y el de
suministro (que nos ofertaba el vendedor al que se le solicitó el pedido) de las líneas de cada pedido.*/

SELECT LI.NUMPEDIDO "Número Pedido", ROUND(AVG(LI.PRECIOCOMPRA-PR.PRECIOUNIT),3) "Media de la diferencia de precios" FROM LINPED LI 
JOIN PRECIOSUM PR ON LI.NUMPIEZA=PR.NUMPIEZA GROUP BY LI.NUMPEDIDO ORDER BY 1; 

/*13--Calcular para cada pieza, el tanto por ciento de beneficios del precio de venta al público
respecto al precio medio de compra de todas las compras que se han realizado de la pieza*/

SELECT LI.NUMPIEZA "Número Pieza",((SUM(PI.PRECIOVENT)/AVG(LI.PRECIOCOMPRA))*100)-100 "Beneficios (%)" 
FROM LINPED LI JOIN PIEZA PI ON PI.NUMPIEZA=LI.NUMPIEZA GROUP BY LI.NUMPIEZA ORDER BY 1; 

/*14--Obtener, por cada pieza solicitada, cuántos vendedores la podrían suministrar, ordenado
alfabéticamente por la descripción de la pieza y eliminando aquellas compradas a proveedores de Alicante.*/

SELECT PR.NUMPIEZA "Número Pieza", PI.NOMPIEZA "Descripción", COUNT(PR.NUMVEND) "Número de vendedores" FROM PRECIOSUM PR,PIEZA PI,VENDEDOR VE 
WHERE PR.NUMPIEZA=PI.NUMPIEZA AND PR.NUMVEND=VE.NUMVEND AND VE.PROVINCIA <> 'ALICANTE' GROUP BY PR.NUMPIEZA,PI.NOMPIEZA ORDER BY 2;


















--ÑÑÑÑÑÑÑÑÑÑÑ EJ 7.6
--1. Nombre de las empresas que tienen más de dos vendedores.
SELECT V.NOMBRECOMER, COUNT(NUMVEND) "NUMERO DE VENDEDORES" FROM VENDEDOR V GROUP BY V.NOMBRECOMER HAVING COUNT(NUMVEND)>2;

--2. Números de pedido que tengan más de tres líneas de pedido.
SELECT L.NUMPEDIDO FROM LINPED L GROUP BY L.NUMPEDIDO HAVING COUNT(L.NUMLINEA)>3;

--3. Números de pedido donde el total de piezas pedidas es mayor que 40.
SELECT L.NUMPEDIDO FROM LINPED L GROUP BY L.NUMPEDIDO HAVING SUM(L.CANTPEDIDA)>40; 

--4. Obtener los números de pedido donde el precio total sea superior a 1000.
SELECT L.NUMPEDIDO FROM LINPED L GROUP BY L.NUMPEDIDO HAVING SUM(L.CANTPEDIDA*L.PRECIOCOMPRA)>1000;  

--5. Para las piezas que se hayan ofertadoa un precio unitario medio mayor que 260 obtener el número de pieza, el máximo precio unitario, y la cantidad de suministradores.
SELECT PS.NUMPIEZA, MAX(PS.PRECIOUNIT) "PRECIO MÁXIMO DE SUMINISTRO", COUNT(PS.NUMVEND) "NÚMERO DE VENDEDORES" FROM PRECIOSUM PS GROUP BY PS.NUMPIEZA HAVING AVG(PS.PRECIOUNIT)>260;

--6. Para las piezas que se ofrecen a un precio unitario medio mayor que 260 (sin tener en cuenta los suministros menores de 250) obtener el número de pieza, el máximo precio unitario, y la cantidad de suministradores.
SELECT PS.NUMPIEZA, MAX(PS.PRECIOUNIT) "PRECIO MÁXIMO DE SUMINISTRO", COUNT(PS.NUMVEND) "NÚMERO DE VENDEDORES" FROM PRECIOSUM PS WHERE PS.PRECIOUNIT>=250 GROUP BY PS.NUMPIEZA HAVING AVG(PS.PRECIOUNIT)>260;

--7. Obtener aquellos números de pedido y fecha en que se confeccionaron cuya cantidad de artículos pedidos sea superior a 30 y la recibida inferior a 10.
SELECT P.NUMPEDIDO, P.FECHA FROM PEDIDO P JOIN LINPED L ON P.NUMPEDIDO=L.NUMPEDIDO GROUP BY P.NUMPEDIDO,P.FECHA HAVING SUM(L.CANTPEDIDA)>30 AND SUM(L.CANTRECIBIDA)<10;

--8. Obtener el número de pieza y el precio unitario medio de aquellas piezas que tarden de media 14 días como máximo en ser suministradas (diassum=tiempo de suministro).
SELECT PS.NUMPIEZA, ROUND(AVG(PS.PRECIOUNIT),2) "PRECIO MEDIO DE SUMINISTRO" FROM PRECIOSUM PS GROUP BY PS.NUMPIEZA HAVING AVG(PS.DIASSUM)<=14;

--9. Obtener los números de pedido, precio de compra y cantidad pedida de los números de línea 1 y recibidas en fecha 10-05-92.
SELECT L.NUMPEDIDO, L.PRECIOCOMPRA, L.CANTPEDIDA FROM LINPED L WHERE L.NUMLINEA=1 AND L.FECHARECEP=TO_DATE('10-05-92','DD-MM-YY');

--10. Obtener el número, el nombre y el precio máximo unitario de las piezas cuyo precio de venta sea mayor que 250 o menor que 170, su descuento medio oscile entre 10 y 17 y que tengan un precio unitario medio total superior a 150, ordenado por precio máximo.
SELECT PS.NUMPIEZA, P.NOMPIEZA, MAX(PS.PRECIOUNIT) "PRECIO MÁXIMO DE SUMINISTRO" FROM PRECIOSUM PS JOIN PIEZA P ON PS.NUMPIEZA=P.NUMPIEZA WHERE P.PRECIOVENT>250 OR P.PRECIOVENT<170 GROUP BY PS.NUMPIEZA,P.NOMPIEZA HAVING (AVG(PS.DESCUENTO) BETWEEN 10 AND 17) AND AVG(PS.PRECIOUNIT)>150 ORDER BY 3;

--11. Determinar el número total de proveedores que pueden suministrar la pieza 'P-0001-33'.
SELECT COUNT(PS.NUMVEND) "NÚMERO DE PROVEEDORES" FROM PRECIOSUM PS WHERE PS.NUMPIEZA='P-0001-33' GROUP BY PS.NUMPIEZA;

--12. Para cada pieza, de la que se tiene información sobre sus posibles vendedores, obtener el número de pieza, y sus precios unitarios máximo y mínimo, exceptuando la información referida al vendedor número 1.
SELECT PS.NUMPIEZA, MAX(PS.PRECIOUNIT) "MÁXIMO PRECIO DE SUMINISTRO", MIN(PS.PRECIOUNIT) "MÍNIMO PRECIO DE SUMINISTRO" FROM PRECIOSUM PS WHERE PS.NUMVEND<>1 GROUP BY PS.NUMPIEZA;

--13. Dar una relación del nombre de las piezas que nos pueden suministrar más de dos proveedores.
SELECT P.NOMPIEZA FROM PIEZA P JOIN PRECIOSUM PS ON P.NUMPIEZA=PS.NUMPIEZA GROUP BY P.NUMPIEZA,P.NOMPIEZA HAVING COUNT(PS.NUMVEND)>2;

--14. Obtener el número y el nombre del vendedor así como el número y nombre de las piezas de precio unitario mayor que 200 que nos puedan suministrar. El resultado se dará ordenado por número y nombre de vendedor y por nombre de la pieza.
SELECT V.NUMVEND, V.NOMVEND, P.NUMPIEZA, P.NOMPIEZA FROM VENDEDOR V JOIN PRECIOSUM PS ON V.NUMVEND=PS.NUMVEND JOIN PIEZA P ON PS.NUMPIEZA=P.NUMPIEZA WHERE PS.PRECIOUNIT>200 ORDER BY V.NUMVEND, V.NOMVEND, P.NUMPIEZA;


















--ÑÑÑÑÑÑÑÑÑÑÑ EJ 8.7
--1.	Obtener todos los datos de los vendedores a los que se les han solicitado más pedidos que a todos los demás.

SELECT * FROM VENDEDOR V
WHERE V.NUMVEND IN (SELECT P.NUMVEND FROM PEDIDO P GROUP BY P.NUMVEND HAVING COUNT(*) >= ALL(SELECT COUNT(*) FROM PEDIDO P1 GROUP BY P1.NUMVEND));

--2.	Número y nombre de los vendedores que no ofertan ninguna pieza.

SELECT V.NUMVEND,V.NOMVEND FROM VENDEDOR V
WHERE V.NUMVEND NOT IN (SELECT PS.NUMVEND FROM PRECIOSUM PS) ORDER BY V.NOMVEND;

--3.	Número y nombre de los vendedores a los que se les ha solicitado algún pedido.

SELECT V.NUMVEND, V.NOMVEND FROM VENDEDOR V
WHERE V.NUMVEND IN (SELECT P.NUMVEND FROM PEDIDO P) ORDER BY V.NOMVEND;

--4.	Número y nombre de los vendedores a los que no se les ha solicitado pedidos.

SELECT V.NUMVEND, V.NOMVEND FROM VENDEDOR V
WHERE V.NUMVEND NOT IN (SELECT P.NUMVEND FROM PEDIDO P) ORDER BY V.NOMVEND;

--5.	Nombre de la empresa que ofrece la pieza más barata de precio de suministro.

SELECT V.NOMBRECOMER FROM VENDEDOR V, PRECIOSUM PS 
WHERE V.NUMVEND=PS.NUMVEND AND PS.PRECIOUNIT = (SELECT MIN(PS1.PRECIOUNIT) FROM PRECIOSUM PS1);

--6.	Número y descripción de la pieza más cara (precio de venta).

SELECT P.NUMPIEZA,P.NOMPIEZA FROM PIEZA P WHERE P.PRECIOVENT = (SELECT MAX(P.PRECIOVENT) FROM PIEZA P);

/*7.	Para cada pieza que se ofrece en la lista de suministros, obtener el número de pieza, 
y sus precios unitarios máximo y mínimo, exceptuando aquellos suministrados por el vendedor número 1.*/

SELECT DISTINCT PS.NUMPIEZA,MAX(PRECIOUNIT) "Maximo Precio Suministro", MIN(PRECIOUNIT) "Mínimo Precio Suministro" FROM PRECIOSUM PS WHERE PS.NUMPIEZA NOT IN (SELECT PS1.NUMPIEZA FROM PRECIOSUM PS1 WHERE PS1.NUMVEND=1) GROUP BY PS.NUMPIEZA;

--8.	Número de pedido y precio total pagado del pedido más caro.

SELECT L.NUMPEDIDO,SUM(L.PRECIOCOMPRA*L.CANTRECIBIDA) "PRECIO_TOTAL" FROM LINPED L
GROUP BY L.NUMPEDIDO HAVING SUM(L.PRECIOCOMPRA*L.CANTRECIBIDA)= (SELECT MAX(SUM(L1.PRECIOCOMPRA*L1.CANTRECIBIDA)) FROM LINPED L1 GROUP BY L1.NUMPEDIDO);

--9.	Número y nombre del vendedor al que se le ha solicitado el pedido más caro.

SELECT V.NUMVEND,V.NOMVEND FROM PEDIDO P JOIN VENDEDOR V ON V.NUMVEND=P.NUMVEND AND P.NUMPEDIDO = (
SELECT L1.NUMPEDIDO FROM LINPED L1 GROUP BY L1.NUMPEDIDO HAVING SUM(L1.PRECIOCOMPRA*L1.CANTRECIBIDA)=(SELECT MAX(SUM(L1.PRECIOCOMPRA*L1.CANTRECIBIDA)) FROM LINPED L1 GROUP BY L1.NUMPEDIDO));

--10.	Número, descripción y precio de venta de los monitores que no han sido nunca solicitados.

SELECT P.NUMPIEZA,P.NOMPIEZA,P.PRECIOVENT FROM PIEZA P
WHERE P.NOMPIEZA LIKE 'MONITOR %' AND P.NUMPIEZA NOT IN (SELECT L.NUMPIEZA FROM LINPED L);

--11.	Calcular, por cada número de vendedor, la cantidad de piezas distintas que ha vendido, 
--para aquellos vendedores pertenecientes a la empresa con más proveedores.

SELECT V.NUMVEND,COUNT(DISTINCT L.NUMPIEZA) PIEZAS_VENDIDAS FROM VENDEDOR V, PEDIDO PD, LINPED L 
WHERE V.NUMVEND=PD.NUMVEND AND PD.NUMPEDIDO=L.NUMPEDIDO 
AND V.NOMBRECOMER IN (SELECT V1.NOMBRECOMER FROM VENDEDOR V1 GROUP BY V1.NOMBRECOMER HAVING COUNT(*) >= ALL (SELECT MAX(COUNT(*)) FROM VENDEDOR V2 GROUP BY V2.NOMBRECOMER))
GROUP BY V.NUMVEND;

--12.	Nombre de los suministradores que pueden suministrar al menos alguna de las piezas 
--que puede suministrar el vendedor número 5.

SELECT V.NOMVEND FROM VENDEDOR V, PRECIOSUM PS
WHERE V.NUMVEND=PS.NUMVEND AND PS.NUMPIEZA = SOME(SELECT PS1.NUMPIEZA FROM PRECIOSUM PS1 WHERE PS1.NUMVEND = 5);

--13.	Listar los vendedores que sean de la misma provincia que el vendedor número 100.

SELECT * FROM VENDEDOR V WHERE UPPER(V.PROVINCIA) IN (SELECT V1.PROVINCIA FROM VENDEDOR V1 WHERE V1.NUMVEND = 100);

SELECT * FROM VENDEDOR V WHERE UPPER(V.PROVINCIA) = (SELECT V1.PROVINCIA FROM VENDEDOR V1 WHERE V1.NUMVEND = 100);

--14.	Obtener los nombres de los vendedores de la misma empresa que Luis García.

SELECT V.NOMVEND FROM VENDEDOR V WHERE UPPER(V.NOMBRECOMER) IN(SELECT V1.NOMBRECOMER FROM VENDEDOR V1 WHERE V1.NOMVEND LIKE '%LUIS GARCIA%') AND UPPER(V.NOMVEND) NOT LIKE '%LUIS GARCIA%';

/*15.	Número y descripción de las piezas cuyo precio medio de suministro esté por encima 
del mayor precio de compra pagado por ella.*/

SELECT P.NUMPIEZA,P.NOMPIEZA FROM PIEZA P, PRECIOSUM PS
WHERE P.NUMPIEZA=PS.NUMPIEZA
GROUP BY P.NUMPIEZA,P.NOMPIEZA
HAVING AVG(PS.PRECIOUNIT) > (SELECT MAX(L.PRECIOCOMPRA) FROM LINPED L WHERE L.NUMPIEZA=P.NUMPIEZA);

--16.	Número, nombre, empresa en la que trabaja y número de piezas que puede suministrar 
--el vendedor que tiene la media más alta de piezas servidas.

SELECT V.NUMVEND,V.NOMVEND,V.NOMBRECOMER,COUNT(PS.NUMPIEZA) "PIEZAS QUE PUEDE SUMINISTRAR" FROM VENDEDOR V, LINPED L, PEDIDO PD, PRECIOSUM PS
WHERE V.NUMVEND=PD.NUMVEND AND PD.NUMPEDIDO=L.NUMPEDIDO AND PS.NUMPIEZA=L.NUMPIEZA AND V.NUMVEND=PS.NUMVEND
GROUP BY V.NUMVEND,V.NOMVEND,V.NOMBRECOMER
HAVING AVG(L.CANTRECIBIDA) >= ALL(SELECT AVG(L1.CANTRECIBIDA) FROM LINPED L1 GROUP BY L1.NUMPEDIDO);

--17.	Nombre de la empresa con mayor importe de ventas.

SELECT V.NOMBRECOMER FROM VENDEDOR V, PEDIDO PD, LINPED L
WHERE V.NUMVEND=PD.NUMVEND AND PD.NUMPEDIDO=L.NUMPEDIDO
GROUP BY V.NOMBRECOMER
HAVING SUM(ABS(L.CANTPEDIDA*L.PRECIOCOMPRA))>=ALL(SELECT SUM(ABS(L1.CANTPEDIDA*L1.PRECIOCOMPRA)) FROM LINPED L1, PEDIDO P1, VENDEDOR V1 WHERE L1.NUMPEDIDO=P1.NUMPEDIDO AND V1.NUMVEND=P1.NUMVEND GROUP BY V1.NOMBRECOMER);

--18.	Número y descripción de la pieza que ha sido pedida más veces.

--La que ha sido pedida más veces
SELECT P.NUMPIEZA,P.NOMPIEZA FROM PIEZA P, LINPED L, PEDIDO PD 
WHERE PD.NUMPEDIDO=L.NUMPEDIDO AND P.NUMPIEZA=L.NUMPIEZA
GROUP BY P.NUMPIEZA,P.NOMPIEZA
HAVING COUNT(*)>=ALL(SELECT COUNT(*) FROM LINPED L1 GROUP BY L1.NUMPIEZA);

--La que se han pedido más unidades
SELECT P.NUMPIEZA,P.NOMPIEZA FROM PIEZA P, LINPED L, PEDIDO PD 
WHERE PD.NUMPEDIDO=L.NUMPEDIDO AND P.NUMPIEZA=L.NUMPIEZA
GROUP BY P.NUMPIEZA,P.NOMPIEZA
HAVING SUM(L.CANTPEDIDA)>=ALL(SELECT SUM(CANTPEDIDA) FROM LINPED L1 GROUP BY L1.NUMPIEZA);

/*19.	Número y descripción de las piezas que pueden ser suministradas por proveedores 
de la Comunidad Valenciana o que pueden ser suministradas por el vendedor que ha 
realizado la menor venta (pedido de importe más bajo)*/


SELECT DISTINCT P.NUMPIEZA, P.NOMPIEZA FROM VENDEDOR V JOIN PRECIOSUM PS ON PS.NUMVEND=V.NUMVEND JOIN PIEZA P ON P.NUMPIEZA=PS.NUMPIEZA
WHERE UPPER(V.PROVINCIA) IN ('ALICANTE', 'CASTELLON','CASTELLÓN','VALENCIA') OR V.NUMVEND = (
SELECT P1.NUMVEND FROM PEDIDO P1 JOIN LINPED L ON L.NUMPEDIDO=P1.NUMPEDIDO GROUP BY P1.NUMVEND,L.NUMPEDIDO HAVING SUM(L.CANTPEDIDA*L.PRECIOCOMPRA) = 
(SELECT MIN(SUM(L1.CANTPEDIDA*L1.PRECIOCOMPRA)) FROM LINPED L1 GROUP BY L1.NUMPEDIDO));



/*20.	Número de vendedor, número de pieza y descuento para aquellas piezas cuyo precio de 
venta supere en más del 15% la media del precio de compra de los pedidos en los que aparece. */


SELECT V.NUMVEND,PS.NUMPIEZA, PS.DESCUENTO FROM VENDEDOR V JOIN PRECIOSUM PS ON PS.NUMVEND=V.NUMVEND JOIN PIEZA P ON P.NUMPIEZA=PS.NUMPIEZA
WHERE P.PRECIOVENT > (SELECT 1.15*AVG(L1.PRECIOCOMPRA) FROM LINPED L1 WHERE P.NUMPIEZA=L1.NUMPIEZA GROUP BY L1.NUMPIEZA);


--21.	Cantidad de piezas a la venta de las que no tenemos información sobre sus posibles suministradores.

SELECT COUNT(*) "PIEZAS SIN SUMINISTRADOR" FROM PIEZA P WHERE P.NUMPIEZA NOT IN (SELECT PS.NUMPIEZA FROM PRECIOSUM PS);


















--ÑÑÑÑÑÑÑÑÑÑÑ EJ 8.8
--1.	Nombre de los vendedores que pueden suministrar todas las piezas
SELECT V.NOMVEND FROM VENDEDOR V WHERE NOT EXISTS (SELECT * FROM PIEZA P WHERE NOT EXISTS
(SELECT * FROM PRECIOSUM PS WHERE PS.NUMVEND=V.NUMVEND AND PS.NUMPIEZA=P.NUMPIEZA));

--2.	Nombre de los vendedores que no pueden suministrar ninguna pieza, ordenados alfabéticamente.
SELECT V.NOMVEND FROM VENDEDOR V WHERE NOT EXISTS
(SELECT * FROM PRECIOSUM PS WHERE PS.NUMVEND=V.NUMVEND);

--3.	Numero y descripcin de las piezas que se han solicitado en todos los pedidos del vendedor 1.
SELECT P.NUMPIEZA,P.NOMPIEZA FROM PIEZA P WHERE NOT EXISTS 
(SELECT * FROM PEDIDO PE WHERE PE.NUMVEND=1 AND NOT EXISTS (SELECT * FROM LINPED L WHERE P.NUMPIEZA=L.NUMPIEZA AND PE.NUMPEDIDO=L.NUMPEDIDO));

--4.	Nombre de las empresas que cumplen que todos sus vendedores son de la Comunidad Valenciana, ordenadas alfabéticamente.
SELECT DISTINCT V.NOMBRECOMER FROM VENDEDOR V WHERE NOT EXISTS
(SELECT * FROM VENDEDOR V2 WHERE V.NOMBRECOMER=V2.NOMBRECOMER AND PROVINCIA NOT IN('ALICANTE','VALENCIA','CASTELLON','CASTELLÓN')) ORDER BY 1;

--5.	Número y nombre de todos los vendedores de la ciudad de Alicante.
SELECT V.NUMVEND,V.NOMVEND FROM VENDEDOR V WHERE EXISTS
(SELECT * FROM VENDEDOR V1 WHERE CIUDAD='ALICANTE' AND V.NUMVEND=V1.NUMVEND) ORDER BY 1;

--6.	Empresas que no han servido ninguna pieza.
SELECT DISTINCT V.NOMBRECOMER FROM VENDEDOR V WHERE EXISTS
(SELECT V1.NUMVEND FROM VENDEDOR V1 WHERE V.NUMVEND=V1.NUMVEND AND NOT EXISTS
(SELECT * FROM PRECIOSUM PS WHERE PS.NUMVEND=V1.NUMVEND)) ORDER BY 1;

--7.	Empresas que han servido la(s) pieza(s) de mayor precio de venta.
INSERT INTO LINPED VALUES(7,2,'M-0003-C',450,4,TO_DATE('09/10/92','DD/MM/YYYY'),3);


SELECT V.NOMBRECOMER FROM VENDEDOR V WHERE EXISTS
(SELECT * FROM PEDIDO PE WHERE V.NUMVEND=PE.NUMVEND AND EXISTS(
SELECT * FROM LINPED L WHERE L.NUMPEDIDO=PE.NUMPEDIDO AND EXISTS
(SELECT * FROM PIEZA P WHERE L.NUMPIEZA=P.NUMPIEZA AND P.PRECIOVENT= (SELECT MAX(PRECIOVENT) FROM PIEZA P1))));
   

--8.	Numero de los pedidos cuyas piezas tienen todas un precio de venta mayor 
--que la mitad del precio mínimo de venta.
SELECT PE.NUMPEDIDO FROM PEDIDO PE WHERE EXISTS (
SELECT L.NUMPEDIDO FROM LINPED L JOIN PIEZA P ON P.NUMPIEZA=L.NUMPIEZA WHERE PE.NUMPEDIDO=L.NUMPEDIDO AND P.PRECIOVENT > (SELECT MIN(P1.PRECIOVENT)/2 FROM PIEZA P1) GROUP BY L.NUMPEDIDO);

--9.	Obtener todos los datos de los vendedores que sirvieron los pedidos del requerimiento anterior.
SELECT V.* FROM VENDEDOR V WHERE EXISTS(
SELECT PE.NUMPEDIDO FROM PEDIDO PE WHERE V.NUMVEND=PE.NUMVEND AND EXISTS (
SELECT L.NUMPEDIDO FROM LINPED L JOIN PIEZA P ON P.NUMPIEZA=L.NUMPIEZA WHERE PE.NUMPEDIDO=L.NUMPEDIDO AND P.PRECIOVENT > (SELECT MIN(P1.PRECIOVENT)/2 FROM PIEZA P1) GROUP BY L.NUMPEDIDO));


--10.	Número y nombre de los vendedores que han servido algn pedido (utilizando obligatoriamente EXISTS).
SELECT V.NUMVEND, V.NOMVEND FROM VENDEDOR V WHERE EXISTS(
SELECT * FROM PEDIDO PE WHERE V.NUMVEND=PE.NUMVEND AND EXISTS(
SELECT * FROM LINPED L WHERE PE.NUMPEDIDO=L.NUMPEDIDO));

--11.	Nmero y nombre de la pieza de menor precio de suministro (utilizando EXISTS).
SELECT * FROM PIEZA P WHERE EXISTS(
SELECT * FROM PRECIOSUM PS WHERE PS.NUMPIEZA=P.NUMPIEZA AND PS.PRECIOUNIT=(SELECT MIN(PS1.PRECIOUNIT) FROM PRECIOSUM PS1));

--12.	Nombre de los vendedores a los que se les haya solicitado más de dos pedidos (utilizando subconsultas).
SELECT V.NOMVEND FROM VENDEDOR V WHERE EXISTS (
SELECT * FROM PEDIDO P WHERE P.NUMVEND=V.NUMVEND GROUP BY V.NOMVEND HAVING COUNT(*)>2);

--13.	Número de pedido, fecha y número de vendedor del pedido más caro (utilizando subconsultas).
SELECT * FROM PEDIDO P WHERE EXISTS(
SELECT L.NUMPEDIDO FROM LINPED L WHERE P.NUMPEDIDO=L.NUMPEDIDO GROUP BY L.NUMPEDIDO HAVING SUM(L.CANTPEDIDA*L.PRECIOCOMPRA)=
(SELECT MAX(SUM(L1.CANTPEDIDA*L1.PRECIOCOMPRA)) FROM LINPED L1 GROUP BY L1.NUMPEDIDO));



--
SELECT V.NUMVEND, V.NOMVEND FROM VENDEDOR V WHERE EXISTS(
SELECT * FROM PEDIDO PE WHERE V.NUMVEND=PE.NUMVEND);













--ÑÑÑÑÑÑÑÑÑÑÑ EJ 8.9
--INSERTS para que se cumplan algunas condiciones de algunas sentencia

INSERT INTO PIEZA(NUMPIEZA,NOMPIEZA,PRECIOVENT) VALUES('NV-RTXT-PC','NVIDIA TITAN RTX 24GB GDDR6',2860);
INSERT INTO PIEZA(NUMPIEZA,NOMPIEZA,PRECIOVENT) VALUES('NV-RTXQ-PC','PNY NVIDIA QUADRO RTX 5000',2860);

INSERT INTO PRECIOSUM(NUMVEND,NUMPIEZA,PRECIOUNIT,DIASSUM,DESCUENTO) VALUES (1,'NV-RTXT-PC',2400,5,5);

INSERT INTO PEDIDO VALUES (10,8002,DATE '1992-10-02');

INSERT INTO LINPED(NUMPEDIDO,NUMLINEA,NUMPIEZA,PRECIOCOMPRA,CANTPEDIDA,FECHARECEP,CANTRECIBIDA) VALUES (10,1,'NV-RTXQ-PC',2350,10,TO_DATE('17/11/2010','DD/MM/YYYY'),8);

--1. Nombre de las empresas que tengan más de dos vendedores o que pueda suministrar la pieza ‘A-1001-L’.
SELECT V.NOMBRECOMER FROM VENDEDOR V GROUP BY V.NOMBRECOMER HAVING COUNT(*)>2 UNION
SELECT V.NOMBRECOMER FROM VENDEDOR V, PRECIOSUM PS WHERE V.NUMVEND=PS.NUMVEND AND NUMPIEZA='A-1001-L';

--2. Nombre de las empresas que tengan más de dos vendedores y que pueda suministrar la pieza ‘A-1001-L’, al menos por medio de uno de ellos.
SELECT V.NOMBRECOMER FROM VENDEDOR V GROUP BY V.NOMBRECOMER HAVING COUNT(*)>2 INTERSECT
SELECT V.NOMBRECOMER FROM VENDEDOR V, PRECIOSUM PS WHERE V.NUMVEND=PS.NUMVEND AND NUMPIEZA='A-1001-L';

--3. Nombre de las empresas que tengan más de dos vendedores y que ninguno de sus vendedores pueda suministrar la pieza ‘A-1001-L’.
SELECT V.NOMBRECOMER FROM VENDEDOR V GROUP BY V.NOMBRECOMER HAVING COUNT(*)>2 MINUS
SELECT V.NOMBRECOMER FROM VENDEDOR V, PRECIOSUM PS WHERE V.NUMVEND=PS.NUMVEND AND NUMPIEZA='A-1001-L';

--4. Número de los pedidos en los que se soliciten teclados pero no monitores.
SELECT L.NUMPEDIDO FROM PIEZA P JOIN LINPED L ON L.NUMPIEZA=P.NUMPIEZA WHERE P.NOMPIEZA LIKE 'TECLADO%' MINUS
SELECT L.NUMPEDIDO FROM PIEZA P JOIN LINPED L ON L.NUMPIEZA=P.NUMPIEZA WHERE P.NOMPIEZA LIKE 'MONITOR%';

--5. Número y fecha del pedido que contiene piezas que no están listadas en la lista de suministros.
SELECT P.NUMPEDIDO, P.FECHA FROM PEDIDO P MINUS
SELECT P.NUMPEDIDO, P.FECHA FROM PEDIDO P JOIN LINPED L ON P.NUMPEDIDO=L.NUMPEDIDO JOIN PRECIOSUM PS ON L.NUMPIEZA=PS.NUMPIEZA;


--6. Número y nombre de los vendedores que oferten alguna de las piezas que pueden ser suministradas por el vendedor número 1, pero que no oferten ninguna de las que puedan ser suministradas por el vendedor número 2.
SELECT V.NUMVEND, V.NOMVEND FROM VENDEDOR V, PRECIOSUM PS1, PRECIOSUM PS2 WHERE V.NUMVEND=PS1.NUMVEND AND PS1.NUMPIEZA=PS2.NUMPIEZA AND PS1.NUMVEND=1 MINUS
SELECT V.NUMVEND, V.NOMVEND FROM VENDEDOR V, PRECIOSUM PS1, PRECIOSUM PS2 WHERE V.NUMVEND=PS1.NUMVEND AND PS1.NUMPIEZA=PS2.NUMPIEZA AND PS1.NUMVEND=2;

--De la misma forma
SELECT V.NUMVEND, V.NOMVEND FROM VENDEDOR V JOIN PRECIOSUM PS1 ON V.NUMVEND=PS1.NUMVEND JOIN PRECIOSUM PS2 ON PS1.NUMPIEZA=PS2.NUMPIEZA WHERE PS1.NUMVEND=1 MINUS
SELECT V.NUMVEND, V.NOMVEND FROM VENDEDOR V JOIN PRECIOSUM PS1 ON V.NUMVEND=PS1.NUMVEND JOIN PRECIOSUM PS2 ON PS1.NUMPIEZA=PS2.NUMPIEZA WHERE PS1.NUMVEND=2;

--De forma más sencilla
SELECT V.NUMVEND, V.NOMVEND FROM VENDEDOR V WHERE V.NUMVEND IN (
	SELECT PS.NUMVEND FROM PRECIOSUM PS WHERE PS.NUMVEND=1 MINUS
	SELECT PS.NUMVEND FROM PRECIOSUM PS WHERE PS.NUMVEND=2
)

--7. Número y nombre de las piezas con un precio de venta mayor que 1000, y que puedan ser suministradas por el vendedor número 1.
SELECT P.NUMPIEZA, P.NOMPIEZA FROM PIEZA P, PRECIOSUM PS WHERE P.NUMPIEZA=PS.NUMPIEZA AND PRECIOVENT>1000 AND NUMVEND=1;

--De la misma forma
SELECT P.NUMPIEZA, P.NOMPIEZA FROM PIEZA P JOIN PRECIOSUM PS ON P.NUMPIEZA=PS.NUMPIEZA WHERE PRECIOVENT>1000 AND NUMVEND=1;

--Utilizando operaciones sobre conjuntos
SELECT P.NUMPIEZA, P.NOMPIEZA FROM PIEZA P JOIN PRECIOSUM PS ON P.NUMPIEZA=PS.NUMPIEZA WHERE P.PRECIOVENT>1000 INTERSECT
SELECT P.NUMPIEZA, P.NOMPIEZA FROM PIEZA P JOIN PRECIOSUM PS ON P.NUMPIEZA=PS.NUMPIEZA WHERE PS.NUMVEND=1;


















--ÑÑÑÑÑÑÑÑÑÑÑ EJ 8.10
--1. Crea una vista con el número y nombre de los vendedores y piezas que
--pueden suministrarnos los comerciales de la provincia de Castellón.
CREATE OR REPLACE VIEW vendedoresCastellon (numero_vendedor, nombre_vendedor, numero_pieza)
AS SELECT v.numvend,v.nomvend, pr.numpieza FROM vendedor v, preciosum pr
WHERE v.numvend=pr.numvend AND UPPER(v.provincia) IN ('CASTELLON','CASTELLÓN');

select * from vendedoresCastellon;

select * from vendedor;

insert into vendedoresCastellon (numero_vendedor, nombre_vendedor, numero_pieza)  
VALUES (201,'FAUSTINO GÓMEZ MIRALLES', 'A-2008-D');--ERROR

--1. Crea una vista con el número y nombre de los vendedores de los comerciales de la provincia de Castellón.

CREATE OR REPLACE VIEW vendedoresCastellon (numero_vendedor, nombre_vendedor, provincia)
AS SELECT v.numvend,v.nomvend,v.provincia FROM vendedor v
WHERE UPPER(v.provincia) IN ('CASTELLON','CASTELLÓN');

insert into vendedoresCastellon (numero_vendedor, nombre_vendedor,provincia)  
VALUES (204,'ESTEFANÍA GÓMEZ MIRALLES', 'CASTELLÓN') ;


--1.1. Modifica los datos que forman esta vista para que pasen a ser
--vendedores de la provincia de Alicante.

UPDATE vendedoresCastellon SET provincia= 'ALICANTE' 
WHERE  UPPER(provincia) IN ('CASTELLÓN','CASTELLON');

--2. Modifica la definición de la vista anterior para que no se puedan realizar
--inserciones, modificaciones ni borrados a través de la misma.

CREATE OR REPLACE VIEW vendedoresCastellon (numero_vendedor, nombre_vendedor, provincia)
AS SELECT v.numvend,v.nomvend,v.provincia FROM vendedor v
WHERE UPPER(v.provincia) IN ('CASTELLON','CASTELLÓN') WITH READ ONLY;

--3. Crea una vista con todos los datos de las piezas y los vendedores que
--puedan suministrarnoslas de aquellas piezas que puedan ser suministradas
--con un descuento mayor del 10%.
CREATE OR REPLACE VIEW VENDEDORESPIEZAS10 AS
SELECT P.NUMPIEZA,P.NOMPIEZA, P.PRECIOVENT, V.NUMVEND, V.NOMVEND, V.NOMBRECOMER 
FROM PIEZA P, PRECIOSUM PR, VENDEDOR V
WHERE P.NUMPIEZA=PR.NUMPIEZA AND V.NUMVEND=PR.NUMVEND AND DESCUENTO > 10 ;

SELECT * FROM VENDEDORESPIEZAS10;


--3.1. Inserta un registro a través de esta vista.
INSERT INTO VENDEDORESPIEZAS10 (NUMPIEZA,NOMPIEZA, PRECIOVENT, NUMVEND, NOMVEND, NOMBRECOMER)
VALUES ('M-0002-C', 'MONITOR COLOR SONY BT', 350, 2, 'LUCIANO BLAZQUEZ VAZQUEZ', 'HARW S.A');

--NO SE PUEDE REALIZA LA INSERCIÓN.



--4. Modifica la creación de esta vista para que no permita añadir ni modificar
--datos que no cumplan con la consulta generadora.

CREATE OR REPLACE VIEW VENDEDORESPIEZAS10 AS
SELECT P.NUMPIEZA,P.NOMPIEZA, P.PRECIOVENT, V.NUMVEND, V.NOMVEND, V.NOMBRECOMER 
FROM PIEZA P, PRECIOSUM PR, VENDEDOR V
WHERE P.NUMPIEZA=PR.NUMPIEZA AND V.NUMVEND=PR.NUMVEND AND DESCUENTO > 10 WITH CHECK OPTION;

--5. Crea una vista que contenga los datos de las líneas de pedido añadiendo el
--cálculo total del importe pagado por pieza.

CREATE OR REPLACE VIEW LINPEDCALCULADA AS
SELECT NUMPEDIDO,NUMLINEA,NUMPIEZA,PRECIOCOMPRA,CANTPEDIDA,FECHARECEP,CANTRECIBIDA, PRECIOCOMPRA*CANTPEDIDA AS TOTAL
FROM LINPED;

SELECT * FROM LINPEDCALCULADA;

INSERT INTO LINPEDCALCULADA (NUMPEDIDO,NUMLINEA,NUMPIEZA,PRECIOCOMPRA,CANTPEDIDA,FECHARECEP,CANTRECIBIDA)
VALUES (6,10,'O-0001-PP',15,1000,TO_DATE('25/08/95','DD/MM/YYYY'),1000);

CREATE OR REPLACE VIEW LINPEDCALCULADA AS
SELECT NUMPEDIDO,NUMLINEA,NUMPIEZA,PRECIOCOMPRA,CANTPEDIDA,FECHARECEP,CANTRECIBIDA, PRECIOCOMPRA*CANTPEDIDA AS TOTAL
FROM LINPED WITH READ ONLY;

INSERT INTO LINPEDCALCULADA (NUMPEDIDO,NUMLINEA,NUMPIEZA,PRECIOCOMPRA,CANTPEDIDA,FECHARECEP,CANTRECIBIDA)
VALUES (6,20,'O-0001-PP',15,1000,TO_DATE('25/08/95','DD/MM/YYYY'),1000);

--6. Crea una vista que contenga los datos del pedido y el importe total del
--mismo.

CREATE OR REPLACE VIEW PEDIDOCONTOTAL (numpedido, numvend, fecha, precio_total) AS
SELECT p.numpedido,p.numvend,p.fecha, sum(l.cantpedida*l.preciocompra) as precio_total from pedido p, linped l
where l.numpedido=p.numpedido GROUP BY p.numpedido,p.numvend,p.fecha WITH READ ONLY;

select * from PEDIDOCONTOTAL ORDER BY 4 DESC;
 

--7. Crea una vista que contenga el nombre de la ciudad y el número de
--vendedores de cada una de estas.
CREATE OR REPLACE VIEW VENDEDORESCIUDAD(NOM_CIUDAD,NUM_VENDEDORES) AS
SELECT CIUDAD,COUNT(*) FROM VENDEDOR GROUP BY CIUDAD;

SELECT * FROM VENDEDORESCIUDAD;


--8. Crea una vista que contenga el número, nombre y precio de venta de las
--piezas que no estén reflejadas en el inventario.

CREATE OR REPLACE VIEW PIEZASNOINVENTARIADAS AS
SELECT NUMPIEZA, NOMPIEZA, PRECIOVENT FROM PIEZA 
WHERE NUMPIEZA NOT IN(SELECT NUMPIEZA FROM PIEZA MINUS SELECT NUMPIEZA FROM INVENTARIO);

SELECT * FROM PIEZASNOINVENTARIADAS;


--9. Crea una vista que contenga los datos de los pedidos que contengan piezas
--que contengan piezas que puedan sernos suministradas con el máximo
--descuento.

CREATE OR REPLACE VIEW PIEZASMAXDESCUENTO AS
SELECT P.* FROM PEDIDO P, LINPED L
WHERE P.NUMPEDIDO=L.NUMPEDIDO AND L.NUMPIEZA IN (
SELECT NUMPIEZA FROM PRECIOSUM WHERE DESCUENTO = (SELECT MAX(DESCUENTO) FROM PRECIOSUM));

SELECT * FROM PIEZASMAXDESCUENTO;


















--ÑÑÑÑÑÑÑÑÑÑÑ EJ 8.11
select * from vendedor v, preciosum pr
where v.numvend=pr.numvend;

select * from vendedor v inner join preciosum pr on v.numvend=pr.numvend 
where descuento >10;

select * from preciosum pr full join vendedor v  on v.numvend=pr.numvend;

--1. Crea una consulta que nos muestre los datos de los vendedores 
--y las piezas que puedan suministrarnos.
SELECT * FROM VENDEDOR V JOIN PRECIOSUM PR ON V.NUMVEND=PR.NUMVEND;

--2. Muestra las piezas y los datos de inventario de todas las piezas de las que se tenga registro.
SELECT * FROM PIEZA P LEFT JOIN INVENTARIO I ON P.NUMPIEZA=I.NUMPIEZA;

--3. Muestra los datos de todas las piezas de las que tenemos registro y las líneas de pedido donde aparecen.
SELECT * FROM PIEZA P LEFT JOIN LINPED L ON P.NUMPIEZA=L.NUMPIEZA;


--4. Muestra el nombre del vendedor, el nombre de la comercial y los datos de todos los pedidos de los que tenemos registro.
SELECT V.NOMVEND, V.NOMBRECOMER, P.NUMVEND, P.NUMPEDIDO,P.FECHA FROM VENDEDOR V RIGHT JOIN PEDIDO P ON V.NUMVEND=P.NUMVEND;

INSERT INTO PEDIDO VALUES(50,NULL,TO_DATE('20/04/2021','DD/MM/YYYY'));

INSERT INTO PEDIDO VALUES(51,225,TO_DATE('20/04/2021','DD/MM/YYYY'));

SELECT V.NOMVEND, V.NOMBRECOMER, P.NUMVEND, P.NUMPEDIDO,P.FECHA FROM VENDEDOR V LEFT JOIN PEDIDO P ON V.NUMVEND=P.NUMVEND;

--5. Muestra el nombre de los vendedores 
--y número de pedidos de todos los vendedores y pedidos que tenemos almacenados en la base de datos.
SELECT V.NOMVEND, P.NUMPEDIDO FROM VENDEDOR V FULL JOIN PEDIDO P ON V.NUMVEND=P.NUMVEND;


SELECT * FROM VENDEDOR V, PEDIDO P;

SELECT * FROM VENDEDOR V RIGHT JOIN PEDIDO P ON V.NUMVEND=P.NUMVEND;

SELECT * FROM VENDEDOR V FULL JOIN PEDIDO P ON V.NUMVEND=P.NUMVEND;


--6. Crea una consulta que nos muestre el nombre del vendedor y el nombre de las piezas que puede suministrarnos.
SELECT V.NOMVEND, P.NOMPIEZA
FROM VENDEDOR V JOIN PRECIOSUM PR ON V.NUMVEND=PR.NUMVEND JOIN PIEZA P ON PR.NUMPIEZA=P.NUMPIEZA;

--7. Deshabilita la restricción NN_INVENTARIO de la tabla inventario.
ALTER TABLE INVENTARIO DISABLE CONSTRAINT NN_INVENTARIO;

--8. Inserta un registro de ejemplo donde el valor de la pieza sea nulo.
INSERT INTO INVENTARIO VALUES (NULL, 15, 200,TO_DATE('20/04/2021','DD/MM/YYYY'),2,100);

--9. Muestra todos los registros de inventario de y el nombre y precio de venta de
--las piezas que hayan sido inventariadas.
SELECT P.NOMPIEZA, P.PRECIOVENT, I.* FROM PIEZA P LEFT JOIN INVENTARIO I ON P.NUMPIEZA=I.NUMPIEZA;

--10. Modifica la sentencia anterior para que también se añadan los datos de las
--piezas que no tienen ninguna correspondencia en el inventario.

SELECT P.NOMPIEZA, P.PRECIOVENT, I.* FROM PIEZA P FULL JOIN INVENTARIO I ON P.NUMPIEZA=I.NUMPIEZA;


















--ÑÑÑÑÑÑÑÑÑÑÑ EJ 9.1
--1. Toda la información de las piezas que puedan ser suministradas por vendedores de empresas cuyo nombre empieza por 'H'.
--2. Piezas que el vendedor numero 1 ofrece en la lista de suministros y que han sido servidas en algún pedido
--3. Vendedores que pueden suministrarnos piezas que se venden al público con un precio de venta entre 50 y 100 y que esa pieza ha sido solicitada en algún momento (no necesariamente a ellos)
--4. Nombre de las empresas de Alicante a las que se ha comprado algún monitor
--5. Nombre y numero de las piezas que se han solicitado en algún pedido ordenadas por el nombre
--6. Para cada pieza comprada, número de pieza y diferencia en euros entre el precio de compra y el de suministro del vendedor al que se le compró, ordenado descendentemente por dicha cantidad.
--7. Numero de vendedor y empresa para la que trabaja de aquellos que han vendido alguna pieza por un precio mayor que el estipulado por ellos en la lista de suministros











--ÑÑÑÑÑÑÑÑÑÑÑ EJ 9.2
--1. Obtener el nombre de los vendedores y la cantidad de piezas que pueden suministrar, ordenado alfabéticamente por vendedor.
--2. Obtener el número y el nombre de los vendedores y la cantidad de piezas que pueden suministrar ordenado alfabéticamente por vendedor.
--3. Obtener el nombre de las piezas, la media del precio unitario de cada pieza y el precio de venta de todas las piezas de las que conocemos posibles suministradores.
--4. Para cada pedido obtener el número de líneas que tiene, el número y nombre del vendedor y la fecha del pedido.
--5. Obtener el nombre de las piezas, la media del precio unitario de cada pieza y el precio de venta de todas las piezas que puedan sernos suministradas por más de tres proveedores.
--6. Obtener los números y nombres de los vendedores que han servido algún pedido con más de tres artículos diferentes.
--7. Obtener número y nombre de vendedores a los que les hayamos solicitado algún pedido.
--8. Obtener el nombre de las piezas, la media del precio unitario de cada pieza y el precio de venta de todas las piezas de precio unitario medio mayor que 100 y que puedan ser suministradas por más de dos proveedores.
--9. Obtener para cada pieza, el nombre de las pieza, la media del precio unitario de suministro y el precio de venta, para las piezas de precio de venta mayor que 300, teniendo en cuenta que la media de los precios unitarios debe estar entre 100 y 280. Ordenar el resultado por el nombre de la pieza.
--10. Obtener número y nombre de las piezas que tengan una diferencia entre precio de venta y media de precio de suministro (preciounit) menor del 20% del precio de venta.









--ÑÑÑÑÑÑÑÑÑÑÑ EJ 9.3
--1. Obtener para los vendedores de la provincia de Alicante, el número de vendedor, su nombre y la cantidad total de pedidos que se les ha solicitado.
--2. Obtener la cantidad total de piezas que se solicitaron en el año 1992.
--3. Obtener el número de pedido, el importe total, y el numero y nombre del vendedor al que se les solicitó, para los pedidos de importe total superior a 10000 euros. Ordena el resultado por el importe total.
--4. Para cada pieza que pueda ser suministrada a un precio medio unitario inferior a 10 euros, obtener el número de la pieza, su nombre, el precio máximo al que nos la han ofrecido, el precio mínimo y la cantidad de vendedores que nos la pueden suministrar.
--5. Para los pedidos que nos han sido servidos en más de un día, obtener el número de pedido, el número del vendedor al que se le solicitó, su nombre, y la cantidad de días distintos en los que nos han servido las piezas solicitadas.
--6. Para las empresas que tengan un único vendedor, obtener el nombre de la empresa y la cantidad total de pedidos que se le han solicitado, y el importe total entre todos los pedidos.
--7. Para las piezas recibidas en domingo, obtener el número de la pieza, su nombre y el número y nombre del vendedor al que se le solicitaron. Ordena el resultado por el nombre de la pieza.









--ÑÑÑÑÑÑÑÑÑÑÑ EJ 9.4
--1. Número y nombre de los vendedores a los que les hemos solicitado algún pedido en el año 1995 pero no les hemos solicitado ninguno en el año 1992.
--2. Obtener el número y el nombre las piezas que puedan sernos suministradas por más de dos vendedores de la provincia de Alicante, y que en total (entre todos los pedidos solicitados a todos los vendedores) hayamos pedido más de 500 unidades.
--3. Obtener el nombre de las empresas de las que tengamos más de 1 de un vendedor de Alicante y no se les haya hecho ningún pedido (a ninguno de sus vendedores) antes del año 1995.
--4. Obtener el número y nombre de las piezas que nunca hemos solicitado.
--5. Obtener el número de los vendedores (numvend) que nos hubiesen podido servir todo lo que se solicita en las líneas 1, 2 y 3 del pedido número 1.
--6. Obtener para los vendedores de Alicante o Madrid, el número y nombre de vendedor junto con el importe total que les hemos pagado a través de todos los pedidos que se les ha solicitado.









--ÑÑÑÑÑÑÑÑÑÑÑ EJ 9.5
--1. Obtener el nombre de la pieza (o piezas) y su precio unitario máximo de la pieza de precio unitario medio más bajo.
--2. Nombre del vendedor y media de todos sus precios de suministro para los vendedores que viven en la misma ciudad que algún vendedor de apellido García.
--3. Para la pieza (o piezas) de precio de venta mayor, obtener el nombre de la pieza y número total de vendedores que la pueden suministrar.
--4. Obtener el nombre de vendedor para los vendedores cuya media de precio unitario de suministro sea máxima.
--5. Obtener el nombre de la pieza y su precio unitario medio de la pieza más barata de precio de venta.
--6. Nombre y empresa de los vendedores de la ciudad a la que se le ha solicitado más piezas.
--7. Número de pedido, y número y nombre de vendedor del pedido que no es el de menor importe de venta (preciocompra*cantrecibida) siendo el año del pedido posterior al 1992 (>1992).
--8. Nombre de los vendedores a los que se les haya solicitado más de dos pedidos en los que se sirvan discos duros.
--9. Número de pieza, descripción y precio de venta de la pieza que más veces se ha pedido.
--10. Número de pieza, descripción, precio medio de suministro y descuento máximo de las piezas que proceden de la misma ciudad que la empresa Mecemsa y que se han solicitado 2 veces o más.








--ÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑ final
--1. Crea una vista que contenga los datos de las líneas de pedido añadiendo el cálculo total del importe pagado por pieza.

--2. Obtener los vendedores que pueden suministrarnos piezas con un descuento de más de 10%.

--3. Crea  una  vista  con  todos  los  datos  de  las  piezas  y  los  vendedores  que puedan suministrarnoslas de aquellas piezas que puedan ser suministradas con un descuento mayor del 10%.

--4. Número  y  fecha  del  pedido  que  contiene  piezas  que  no  están  listadas  en  la  lista  de suministros.

--5. "Obtener el número de pieza junto con el nombre de todas las provincias desde las que puede sernos suministrada, en orden descendente del número de pieza."

--6. Modifica la sentencia anterior para que también se añadan los datos de las piezas que no tienen ninguna correspondencia en el inventario.

--7. Mínima diferencia entre precio de compra y precio de suministro del vendedor al que se le compró.

--8. "Obtener el número, el nombre y el precio máximo unitario de las piezas cuyo precio de venta sea mayor que 250 o menor que 170, su descuento medio oscile entre 10 y 17 y que tengan un precio unitario medio total superior a 150, ordenado por precio máximo."

--9. "Para cada pieza que se ofrece en la lista de suministros, obtener el número de pieza, y sus  precios  unitarios  máximo  y  mínimo,  exceptuando  aquellos  suministrados  por  el vendedor número 1."

--10. Nombres de vendedores que empieza su nombre por J.

--11. Número   y   nombre   de   los   vendedores   que   han   servido   algún   pedido   (utilizando obligatoriamente EXISTS).

--12. "Número, nombre, empresa en la que trabaja y número de piezas que puede suministrar el vendedor que tiene la media más alta de piezas servidas."

--13. Obtener el nombre y número de proveedores de la provincia de Valencia.

--14. Obtener  la  cantidad  de  provincias  distintas  de  las  que  tenemos  conocimiento  de  algún proveedor.

--15. "Códigos  de  pieza  solicitados  en  el  pedido  1,  ordenados  de  mayor  a  menor  precio  de compra."

--16. Modificar el requerimiento anterior para eliminar duplicados.

--17. Media de precios distintos de venta de piezas.

--18. "Obtener los números de pedido, precio de compra y cantidad pedida de los números de línea 1 y recibidas en fecha 10-05-92."

--19. "Nombre de las empresas que cumplen que todos sus vendedores son de la Comunidad Valenciana, ordenadas alfabéticamente."

--20. "Número de vendedor, número de pieza y descuento para aquellas piezas cuyo precio de venta supere en más del 15% la media del precio de compra de los pedidos en los que aparece."

--21. Muestra las piezas y los datos de inventario de todas las piezas de las que se tenga registro.

--22. Nombres de vendedores que se apellidan López.

--23. Crea una vista que contenga los datos de los pedidos que contengan piezas que  contengan  piezas  que  puedan  sernos  suministradas  con  el  máximo descuento.

--24. Número de los pedidos en los que se soliciten teclados pero no monitores.

--25. De cada pieza obtener el precio unitario medio de suministro.

--26. "Listar los nombres y números de vendedores así como el número y nombre de las piezas que pueden suministrar, para los vendedores de la provincia de Valencia o Alicante."

--27. Obtener el nombre y número de proveedores de la provincia de Valencia a los que se les ha solicitado un pedido.

--28. Obtener número y nombre de todas las piezas recibidas el 1 de Mayo de 1992\.

--29. Obtener los números de pedido del vendedor número 1\.

--30. Obtener aquellos números de pedido y fecha en que se confeccionaron cuya cantidad de artículos pedidos sea superior a 30 y la recibida inferior a 10\.

--31. Obtener los vendedores ordenados alfabéticamente en orden descendente.

--32. Nombre de los suministradores que pueden suministrar al menos alguna de las piezas que puede suministrar el vendedor número 5\.

--33. Obtener  número  de  pieza  y  número  total  de  vendedores  que  la  pueden  suministrar  para piezas de más de 250 de precio de venta.

--34. Nombre de las empresas que tengan más de dos vendedores o que pueda suministrar la pieza ‘A-1001-L’.

--35. Número y nombre de todos los vendedores de la ciudad de Alicante.

--36. Empresas que han servido la(s) pieza(s) de mayor precio de venta.

--37. "Calcular, por cada número de vendedor, la cantidad de piezas distintas que ha vendido, para aquellos vendedores pertenecientes a la empresa con más proveedores."

--38. "Obtener todos los nombres de piezas que pueda suministrar el vendedor 100, el 300 y/o el 400 con un precio de venta entre 10 y 1000, y un precio unitario entre 1 y 500."

--39. Obtener los vendedores que viven en la calle Ciscar o Salamanca y de la Empresa Harw S.A.

--40. Códigos de pieza de los que se sabe que algún vendedor nos podría hacer descuento.

--41. Obtener el número y el nombre del vendedor así como el número y nombre de las piezas de  precio  unitario  mayor  que  200  que  nos  puedan  suministrar.  El  resultado  se  dará ordenado por número y nombre de vendedor y por nombre de la pieza.

--42. "Obtener  nombres  de  vendedores  y  números  de  pieza  que  nos  pueden  suministrar,  de aquellos vendedores cuyo apellido comienza por Martín, y ordenados alfabéticamente."

--43. Nombre de la empresa que ofrece la pieza más barata de precio de suministro.

--44. Crea una consulta que nos muestre el nombre del vendedor y el nombre de las piezas que puede suministrarnos.

--45. Listar los vendedores que sean de la misma provincia que el vendedor número 100\.

--46. Obtener todos los vendedores que tengan teléfono.

--47. Obtener el nombre de las piezas que puedan ser suministradas por aquellos proveedores cuyo nombre empiece por S.

--48. Dar  una  relación  del  nombre  de  las  piezas  que  nos  pueden  suministrar  más  de  dos proveedores.

--49. Máximo descuento (en euros) de las piezas suministradas.

--50. Calcular  las  ganancias  (precio  de  compra  menos  precio  de  suministro  por  la  cantidad recibida) de cada vendedor que ha efectuado alguna venta.

--51. Cantidad  de  piezas  a  la  venta  de  las  que  no  tenemos  información  sobre  sus  posibles suministradores.

--52. Obtener los números de pedido donde el precio total sea superior a 1000\.

--53. "Obtener,  por  cada  pieza  solicitada,  cuántos  vendedores  la  podrían  suministrar,  ordenado alfabéticamente   por   la   descripción   de   la   pieza   y   eliminando   aquellas   compradas   a proveedores de Alicante."

--54. Obtener el número de pieza y el precio unitario medio de aquellas piezas que tarden de media 14 días como máximo en ser suministradas (diassum=tiempo de suministro).

--55. "Nombre  de  los  vendedores  que  no  pueden  suministrar  ninguna  pieza,  ordenados alfabéticamente."

--56. "Obtener  nombre, teléfono, y ciudad del vendedor que  puede suministrarnos piezas con valor mayor de 100."

--57. "Número, nombre y precio de venta de las piezas que han sido compradas en un pedido servido por el vendedor 1."

--58. "Obtener para cada número de pedido, el precio pagado en total por ese pedido, la cantidad pedida total así como la diferencia entre cantidad pedida total y cantidad recibida total."

--59. "Nombre  de  vendedores  que  el  nombre  empieza  por  M  seguido  de  cualquier  carácter simple, una R y cualquier cadena de n caracteres."

--60. Nombre de las piezas que pueden sernos suministradas desde la Comunidad Valenciana.

--61. Obtener nombre de vendedores y nombre de piezas que pueden suministrar ordenado en orden alfabético.

--62. "Obtener, por pieza solicitada, la máxima diferencia entre cantidad pedida y cantidad recibida de entre todas las veces en que fue servida."

--63. "Números de pedido y números de vendedor, para los pedidos solicitados el 15 de octubre de 1992."

--64. Obtener los nombres de pieza que pueden suministrar los vendedores de apellido 'García'.

--65. Número y descripción de las piezas cuyo precio medio de suministro esté por encima del mayor precio de compra pagado por ella.

--66. "Nombre de las empresas que tengan más de dos vendedores y que pueda suministrar la pieza ‘A-1001-L’, al menos por medio de uno de ellos."

--67. "Modifica  la  definición  de  la  vista  anterior  para  que  no  se  puedan  realizar inserciones, modificaciones ni borrados a través de la misma."

--68. Nombre de las empresas que tienen más de dos vendedores.

--69. Empresas que no han servido ninguna pieza.

--70. Muestra  los  datos  de  todas  las  piezas  de  las  que  tenemos  registro  y  las líneas de pedido donde aparecen.

--71. Números de pedido que tengan más de tres líneas de pedido.

--72. Nombre de los vendedores con número de vendedor menor que 6\.

--73. Número  de  pieza  y  número  y  nombre  de  vendedor  de  aquellas  piezas  cuyo  precio  de venta es mayor que 50 o su descuento de suministro es mayor que 10\.

--74. Número y nombre de la pieza de menor precio de suministro (utilizando EXISTS).

--75. Modificar el requerimiento anterior para eliminar duplicados.

--76. Número y nombre del vendedor al que se le ha solicitado el pedido más caro.

--77. De cada pieza de precio de venta mayor que 250 obtener el precio medio de suministro.

--78. Obtener la media de las ventas (en euros) realizadas por cada vendedor de cada pieza.

--79. "Obtener para cada pieza, el número de la pieza y el número total de vendedores que nos pueden suministrar esa pieza."

--80. "Número,  descripción  y  precio  de  venta  de  los  monitores  que  no  han  sido  nunca solicitados."

--81. Nombre y empresa de los vendedores de la Comunidad Valenciana.

--82. Piezas que nos puedan suministar los vendedores de la empresa Harw S.A.

--83. "Para las piezas que se ofrecen a un precio unitario medio mayor que 260 (sin tener en cuenta los suministros menores de 250\) obtener el número de pieza, el máximo precio unitario, y la cantidad de suministradores."

--84. Crea  una  vista  que  contenga  el  nombre  de  la  ciudad  y  el  número  de vendedores de cada una de estas.

--85. Nombres de proveedores que puedan suministrarnos la pieza numero A-1001-L

--86. "Obtener para cada pieza, nombre de la pieza, precio de venta, y la media de la diferencia entre el precio de venta y el de suministro."

--87. "Número,  nombre  y  precio  de  venta  de  las  piezas  de  precio  de  venta  mayor  que  10  o menor que 1 euros, ordenadas de menor a mayor precio."

--88. "Para cada pieza de la que se conozca algún suministrador, obtener el número de pieza y el descuento, en orden descendente del valor de descuento."

--89. Número y nombre de los vendedores con número de vendedor menor que 6\.

--90. Obtener todos los números de los vendedores de los que se sepa que pueden suministrar alguna pieza.

--91. Crea  una  vista  con  el  número  y  nombre  de  los  vendedores  y  piezas  que pueden suministrarnos los comerciales de la provincia de Alicante.

--92. Piezas que sabemos que nos puede suministrar algún vendedor.

--93. "Precios a los que nos pueden ser suministradas las piezas DD-0001-210 y FD-0001-144, y número y nombre de los vendedores que las podrían suministrar a esos precios."

--94. "Número y nombre de los vendedores que oferten alguna de las piezas que pueden ser suministradas por el vendedor número 1,  pero que no oferten ninguna de las que puedan ser suministradas por el vendedor número 2."

--95. "Crea  una  vista  que  contenga  el  número,  nombre  y  precio  de venta de las piezas que no estén reflejadas en el inventario."

--96. Número y descripción de la pieza que ha sido pedida más veces.

--97. "Códigos de pieza, de posible suministrador y precio de suministro, ordenados por código de vendedor y código de pieza."

--98. "Número  de  pedido,  fecha  y  número  de  vendedor  del  pedido  más  caro  (utilizando subconsultas)."

--99. Numero de los pedidos cuyas piezas tienen todas un precio de venta mayor que la mitad del precio máximo de venta.

--100. Números de pedido donde el total de piezas pedidas es mayor que 40\.

--101. "Para cada pieza, de la que se tiene información sobre sus posibles vendedores, obtener el número de pieza, y sus precios unitarios máximo y mínimo, exceptuando la información referida al vendedor número 1."

--102. Numero  y  descripción  de  las  piezas  que  se  han  solicitado  en  todos  los  pedidos  del vendedor 1\.

--103. Obtener el número de pieza y el precio de los monitores.

--104. Nombre de los vendedores a los que se les haya solicitado más de dos pedidos (utilizando subconsultas).

--105. Obtener todos los datos de los vendedores que sirvieron los pedidos del requerimiento anterior.

--106. Obtener todos los números de piezas de las piezas de la base de datos.

--107. Crea  una  vista  que  contenga  los  datos  del  pedido  y  el  importe  total  del mismo.

--108. Muestra  el  nombre  de  los  vendedores  y  número  de  pedidos  de  todos  los vendedores y pedidos que tenemos almacenados en la base de datos.

--109. Obtener la diferencia entre cantidad pedida y cantidad recibida de las líneas del pedido 1\.

--110. Crea una consulta que nos muestre los datos de los vendedores y las piezas que puedan suministrarnos.

--111. Nombre de la empresa con mayor importe de ventas.

--112. Números de vendedores y días que tardarían en suministrar la pieza 'P-0001-33'

--113. Determinar el número total de proveedores que pueden suministrar la pieza 'P-0001-33’.

--114. "Número y nombre de vendedor, y pieza que ha sido comprada a un precio mayor que el estipulado en la lista de precios de suministro."

--115. "Calcular por número de pedido, la media de la diferencia entre el precio de compra y el de suministro (que nos ofertaba el vendedor al que se le solicitó el pedido) de las líneas de cada pedido."

--116. Muestra todos los registros de inventario de y el nombre y precio de venta de las piezas que hayan sido inventariadas.

--117. Obtener los nombres de vendedores en orden alfabético.

--118. Nombre de los vendedores que pueden suministrar todas las piezas.

--119. Nombre  de  las  empresas  que  tengan  más  de  dos  vendedores  y  que  ninguno  de  sus vendedores pueda suministrar la pieza ‘A-1001-L’.

--120. Número y descripción de las piezas que pueden ser suministradas por proveedores de la Comunidad Valenciana o que pueden ser suministradas por el vendedor que ha realizado la menor venta (pedido de importe más bajo)

--121. Obtener la cantidad de pedidos efectuados por fecha y el total pagado por las mercancías.

--122. Número y nombre de los vendedores a los que no se les ha solicitado pedidos.

--123. Número y nombre de los vendedores que no ofertan ninguna pieza.

--124. Número y nombre de los vendedores que no ofertan ninguna pieza.

--125. "Para las piezas que se hayan ofertadoa un precio unitario medio mayor que 260 obtener el número de pieza, el máximo precio unitario, y la cantidad de suministradores."

--126. Precio unitario de suministro del número de pieza A-1001-L y el vendedor 100\.

--127. Obtener los vendedores de la provincia de Valencia o Alicante que su nombre empieza por J o por M y tienen un número de vendedor entre 1 y 100\.

--128. Lista el nombre y número de las piezas.

--129. "Muestra  el  nombre del vendedor, el nombre de la comercial y los datos de todos los pedidos de los que tenemos registro."

--130. Número y nombre de los vendedores a los que se les ha solicitado algún pedido.

--131. Nombre de todas las piezas con un precio de venta menor que 1000\.

--132. Número y nombre de los vendedores a los que se les ha solicitado algún pedido.

--133. "Obtener  el  nombre  de  las  piezas  que  puedan  ser  suministradas  por  proveedores  cuyo nombre empiece por S, y se llamen de apellido4 Martínez o Martín."

--134. Listar las piezas con un descuento entre 1 y 10 cuyo nombre contenga una O y que se las hayamos solicitado a proveedores cuyo número oscile entre el 1 y el 1000\.

--135. Pedidos y datos del vendedor cuya fecha de pedido no sea el 22 de octubre de 1992\.

--136. Modifica  la  creación  de  esta  vista  para  que  no  permita  añadir  ni modificar datos que no cumplan con la consulta generadora.

--137. Vendedores de la provincia de Alicante.

--138. Obtener todas las piezas que se recuenten el 15 /10/1992.

--139. Obtener todos los datos de los vendedores a los que se les han solicitado más pedidos que a todos los demás.

--140. Obtener los números de pieza de las que conozcamos algún vendedor que nos la pueda suministrar.

--141. "Obtener  la  cantidad  de  vendedores  de  cada  empresa,  indicando  cantidad  y  nombre  de  la misma, ordenado descendentemente por cantidad de empleados."

--142. Número y descripción de la pieza más cara (precio de venta).

--143. Obtener los números de línea y su precio de compra del pedido número 1\.

--144. Nombres de vendedores que termina su nombre por Z.

--145. Obtener los nombres de los vendedores de la misma empresa que Luis García.

--146. "Obtener  los  nombres  de  los  vendedores  de  las  provincias  de  Valencia,  Castellón  o Alicante."

--147. Media  de  días  de  intervalo  entre  la  fecha  de  envío  del  pedido  1  y  de  entrega  de  las distintas piezas solicitadas en ese pedido

--148. Número de pedido y precio total pagado del pedido más caro.

--149. "Número y nombre de las piezas con un precio de venta mayor que 1000, y que puedan ser suministradas por el vendedor número 1."

--150. Número y nombre de las piezas que puedan suministrarnos el vendedor número 2 y el 4 (no necesariamente que las puedan suministrar los dos).

--151. "Calcular  para  cada  pieza,  el  tanto  por  ciento  de  beneficios  del  precio  de  venta  al  público respecto al precio medio de compra de todas las compras que se han realizado de la pieza"

--152. Número y nombre de los vendedores a los que no se les ha solicitado pedidos.


