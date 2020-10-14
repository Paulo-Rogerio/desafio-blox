CREATE ROLE agenda WITH
	LOGIN
	NOSUPERUSER
	NOCREATEDB
	NOCREATEROLE
	INHERIT
	NOREPLICATION
	CONNECTION LIMIT -1
	PASSWORD '123456';

CREATE DATABASE blox_test
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

\connect blox_test;

CREATE SCHEMA agenda
    AUTHORIZATION agenda;    	
