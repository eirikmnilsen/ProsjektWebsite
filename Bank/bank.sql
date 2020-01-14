
create role bank password '123';
alter role bank with login;
create database bank owner bank;

\c bank;



drop table if exists users cascade;
drop table if exists kunde cascade;
drop table if exists konto cascade;
drop table if exists bankansatt cascade;
drop table if exists laan cascade;

 
create table users (
    userid SERIAL PRIMARY KEY not null,
    username text unique not null,
    role text default 'user',
    password text not null
); 

CREATE TABLE bankansatt (
  bankansattid serial primary key,
  fornavn text not null,
  etternavn text not null,
  ansiennitet int default 1,
  kjonn text check (
    kjonn = 'm'
    or kjonn = 'f'
  )
);

CREATE TABLE kunde (
  kundeid serial primary key,
  fornavn text not null,
  etternavn text not null,
  adresse text,
  epost text,
  tlf text,
  fdato date,
  kjonn text,
  bankansattid int references bankansatt (bankansattid),
  userid int unique not null
);



CREATE TABLE konto (
  kontoid serial primary key,
  balance text,
  kundeid int references kunde (kundeid)
);

CREATE TABLE laan (
  laanid serial primary key,
  udato date,
  antall text,
  nedbetalt text default 'false' check (
    nedbetalt = 'true'
    or nedbetalt = 'false'
  ),
  kundeid int references kunde (kundeid)
);

alter table users owner to bank;
alter table konto owner to bank;
alter table kunde owner to bank;
alter table laan owner to bank;
alter table bankansatt owner to bank;
