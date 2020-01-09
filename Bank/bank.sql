-- drop table bok,laaner,forfatter,eksemplar,utlaan cascade;


create table users (
    userid SERIAL PRIMARY KEY not null,
    username text unique not null,
    role text default 'user',
    password text not null
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

CREATE TABLE bankansatt (
  bankansattid serial primary key,
  fornavn text not null,
  etternavn text not null,
  kjonn text check (
    kjonn = 'm'
    or kjonn = 'f'
  )
);

CREATE TABLE konto (
  kontoid serial primary key,
  balance text,
  kundeid int references kunde (kundeid)
);

CREATE TABLE laan (
  laanid serial primary key,
  udato date,
  nedbetalt text default 'false' check (
    nedbetalt = 'true'
    or nedbetalt = 'false'
  ),
  kundeid int references kunde (kundeid)
);