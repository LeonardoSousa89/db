
QUERY PARA H2

----------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO DIST_USERS VALUES(1,'Thomas@gmail.com','Thomas Wayne');
INSERT INTO DIST_USERS VALUES(2,'Clancys@hotmail.com','Thomas Leo Clancy Jr');

INSERT INTO DIST_WORKERS VALUES(1,'Gotham city','62', 'wayneenterprise@ask.com', 'Alfred Penworth','(415) 555-2671','butler',1);
INSERT INTO DIST_WORKERS VALUES(2,'Gotham city','23', 'dawes@yahoo.com', 'Rachel Dawes','(415) 555-3592','lawyer',1);
INSERT INTO DIST_WORKERS VALUES(3,' Baltimore, Maryland','36', 'echelon@outlook.com', 'Samuel Leo Fisher','(415) 555-2789','Secret Agent',2);

SELECT * FROM DIST_USERS;
SELECT * FROM DIST_WORKERS; 

SELECT WORKER_NAME, WORKER_EMAIL, WORKER_POST, WORKER_ADDRESS FROM  DIST_WORKERS;
SELECT WORKER_NAME, WORKER_EMAIL, WORKER_POST, WORKER_ADDRESS FROM  DIST_WORKERS WHERE WORKER_NAME = 'Alfred Penworth';
SELECT WORKER_NAME, WORKER_EMAIL, WORKER_POST, WORKER_ADDRESS FROM  DIST_WORKERS WHERE WORKER_EMAIL = 'dawes@yahoo.com';
SELECT WORKER_NAME, WORKER_EMAIL, WORKER_POST, WORKER_ADDRESS FROM  DIST_WORKERS WHERE WORKER_ADDRESS  = 'Gotham city';

DELETE FROM DIST_USERS;
DELETE FROM DIST_WORKERS; 

/* exemplo de query para listar os dados de um User especifico*/
SELECT  W.WORKER_ID,
 	W.WORKER_ADDRESS,
	W.WORKER_AGE,
	W.WORKER_EMAIL,
	W.WORKER_NAME,
	W.WORKER_PHONE_NUMBER ,
	W.WORKER_POST      	
FROM DIST_USERS U
INNER JOIN DIST_WORKERS W
ON U.USER_ID=W.USER_ID
WHERE U.USER_ID='1';

SELECT  W.WORKER_ID,
 	W.WORKER_ADDRESS,
	W.WORKER_AGE,
	W.WORKER_EMAIL,
	W.WORKER_NAME,
	W.WORKER_PHONE_NUMBER ,
	W.WORKER_POST      	
FROM DIST_USERS U
INNER JOIN DIST_WORKERS W
ON U.USER_ID=W.USER_ID
WHERE U.USER_ID='2';

/* exemplo de query para deletar os dados de um worker especifico*/
/* pode ser uma procedure */
DELETE FROM DIST_WORKERS WHERE WORKER_ID   = '1' AND ADMIN_USER_ID='1' ; 

/* exemplo de query para atualizar os dados de um worker especifico*/
/* pode ser uma procedure */
UPDATE DIST_WORKERS SET WORKER_AGE='24' WHERE WORKER_ID   = '2' AND ADMIN_USER_ID='1' ; 
----------------------------------------------------------------------------------------------------------------------------------------------








QUERY PARA POSTGRES

----------------------------------------------------------------------------------------------------------------------------------------------
CREATE DATABASE distproject;
\c distproject

CREATE TABLE IF NOT EXISTS dist_users(
	userId SERIAL PRIMARY KEY,
	name VARCHAR(100),
	email VARCHAR(100) UNIQUE
);

DROP TRABLE dist_users;

CREATE TABLE IF NOT EXISTS dist_workers(
	workerId SERIAL PRIMARY KEY,
 	workerName VARCHAR(100),
	workerEmail VARCHAR(100),
	workerPost VARCHAR(100),
	workerAddress VARCHAR(100),
	workerPhoneNumber VARCHAR(100),
	workerAge VARCHAR(100),
	user_Id INT,
	FOREIGN KEY(user_Id) REFERENCES dist_users(userId)
);

DROP TRABLE dist_workers;


SELECT * FROM dist_users;
SELECT * FROM dist_workers;

INSERT INTO dist_users VALUES(1, 'Thomas Wayne', 'Thomas@gmail.com');
INSERT INTO dist_users VALUES(2, 'Thomas Leo Clancy Jr','Clancys@hotmail.com');
INSERT INTO dist_users VALUES(3, 'Jim Lee','dccomics@hotmail.com');

INSERT INTO dist_workers VALUES(1, 'Alfred Penworth', 'wayneenterprise@ask.com', 'butler', 'Gotham city', '(415) 555-2671','62' ,1);
INSERT INTO dist_workers VALUES(2, 'Rachel Dawes',  'dawes@yahoo.com', 'lawyer','Gotham city', '(415) 555-3592', '23', 1);
INSERT INTO dist_workers VALUES(3, 'Samuel Leo Fisher', 'echelon@outlook.com', 'Secret Agent', 'Baltimore, Maryland', '(415) 555-2789', '36', 2);
INSERT INTO dist_workers VALUES(4, 'Frank Miller', 'millercomics@outlook.com', 'writter/drawer', 'Olney, Maryland', '(415) 555-8974', '65', 3);
INSERT INTO dist_workers VALUES(5, 'Alan More', 'watchmenseries@ask.com', 'writter', 'Northampton, United Kingdom', '(415) 555-8745', '68', 3);
INSERT INTO dist_workers VALUES(6, 'Todd McFarlane', 'spiderman90@marvel.com', 'drawer', 'Calgary, Canada', '(415) 555-7877', '61', 3);

SELECT * FROM dist_users;
SELECT * FROM dist_workers;

DELETE FROM dist_workers;
DELETE FROM dist_users;

SELECT workerName, workerEmail, workerPost, workerAddress FROM dist_workers;
SELECT workerName, workerEmail FROM dist_workers WHERE workerEmail='dawes@yahoo.com';

SELECT  w.workerId,
 	w.workerName ,
	w.workerEmail,
	w.workerPost, 
	w.workerAddress,
	w.workerPhoneNumber,
	w.workerAge 	
FROM dist_users u
INNER JOIN dist_workers w
ON u.userId =w.user_id
WHERE u.userId ='1';

SELECT  w.workerId,
 	w.workerName ,
	w.workerEmail,
	w.workerPost, 
	w.workerAddress,
	w.workerPhoneNumber,
	w.workerAge 	
FROM dist_users u
INNER JOIN dist_workers w
ON u.userId =w.user_id
WHERE u.userId ='2';


/*paginação*/
/* LIMIT por página, OFFSET saltos para a próxima consulta*/
select * from dist_workers LIMIT 3 OFFSET 1;
select * from dist_workers LIMIT 5 OFFSET 0;
select * from dist_workers LIMIT 2 OFFSET 0;
			   	
select * from dist_workers LIMIT 5;
select * from dist_workers LIMIT 5 OFFSET 5;

/*paginação para meu uso*/
select * from dist_workers LIMIT 5 OFFSET 5;

ALTER TABLE  dist_workers DROP COLUMN workername;
ALTER TABLE  dist_workers ADD COLUMN workername varchar(100) UNIQUE;

REF: https://www.tutorialspoint.com/postgresql/postgresql_alter_command.htm
     https://clebersonsilva.com/2018/01/limit-e-offset-no-postgresql/#:~:text=O%20PostgreSQL%20%C3%A9%20muito%20amigo,do%20que%20pagina%C3%A7%C3%A3o%20no%20cliente.
----------------------------------------------------------------------------------------------------------------------------------------------





RDS

As configuraçãoes de conexão estarão na area-de-trabalho na pasta db, já foi aberta conexão via server com pgAdmin.


obs* o database da AMAZON só possui 7 dias grátuitos de db, a cada 6 dias alterar o banco.

distproject - criado 04-11 as 19:38
	      destruição 10-11

