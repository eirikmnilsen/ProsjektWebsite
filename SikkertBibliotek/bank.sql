-- drop table bok,laaner,forfatter,eksemplar,utlaan cascade;

CREATE TABLE kunde (
  kundeid serial primary key,
  fornavn text not null,
  etternavn text not null,
  adresse text,
  epost text,
  tlf text,
  fdato date,
  kjonn text
  bankansattid int references bankansatt (bankansattid)
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

)

CREATE TABLE laan (
  laanid serial primary key,
  udato date,
  nedbetalt text default 'false' check (
    innlevert = 'true'
    or innlevert = 'false'
  ),
  kundeid int references kunde (kundeid),
);