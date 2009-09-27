update suppliers set delivery_period = 20;

-- Supplier 0
INSERT INTO suppliers VALUES (null,'SUPPLIER 0','','','',NULL,20,NULL);
UPDATE products set supplier_id = (select id from suppliers s where s.name='SUPPLIER 0') where  supplier_id=0;

-- Los productos 1
 
 -- Countries
insert into countries (id, version, code, name) values(1, 0, 'AR', 'Argentina');
insert into countries (id, version, code, name) values(2, 0, 'BR', 'Brasil');
insert into countries (id, version, code, name) values(3, 0, 'CO', 'Colombia');
insert into countries (id, version, code, name) values(4, 0, 'CH', 'Chile');
insert into countries (id, version, code, name) values(5, 0, 'CO', 'Ecuador');

-- Relation User Countries
insert into user_to_countries(user_countries_id, country_id) values(1, 1);
insert into user_to_countries(user_countries_id, country_id) values(2, 1);
insert into user_to_countries(user_countries_id, country_id) values(3, 1);
insert into user_to_countries(user_countries_id, country_id) values(4, 1);

-- Roles
insert into role(id, version, authority, description) values(1, 0, 'ROLE_ADMIN', 'Rol Administrador');
insert into role(id, version, authority, description) values(2, 0, 'ROLE_USER', 'Rol Usuario');

-- Relation User Role
insert into role_people(user_id, role_id) values(1, 2);
insert into role_people(user_id, role_id) values(2, 1);
insert into role_people(user_id, role_id) values(3, 2);
insert into role_people(user_id, role_id) values(4, 2);

-- Update user password
update users set version=0, enabled=1, passwd='a15f8b81a160b4eebe5c84e9e3b65c87b9b2f18e' where id=1;
update users set version=0, enabled=1, passwd='863f8f3edbcde342a53dd30d6d00b81a90e4249d' where id=2;
update users set version=0, enabled=1, passwd='7d595301fe29f25bf9c7c9fc4e406cee1e4c9971' where id=3;
update users set version=0, enabled=1, passwd='e79cab55eab4c0a1a63610829a51fd51d5cfb294' where id=4;

-- Delete column password
alter table users drop column password;

-- Update clients
update clients set version = 0;
-- in case all clients are from argentina
--update clients set country_id = 1;
--update patients set country_id = 1;




