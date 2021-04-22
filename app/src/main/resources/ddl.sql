create table member
(
	id serial not null
		constraint member_pk
			primary key
		constraint member_permission__fk
			references permission,
	role integer
);

alter table member owner to postgres;

create table items
(
	id serial not null
		constraint items_pk
			primary key,
	name varchar not null,
	datecreate date,
	status varchar,
	fk_author integer
		constraint items_member__fk
			references member,
	parent_id integer,
	"date_Changes" date,
	column_8 integer
);

alter table items owner to postgres;

create table file
(
	id serial not null
		constraint file_pk
			primary key,
	fk_docversion integer
		constraint file_version__fk
			references version
);

alter table file owner to postgres;

create table type_document
(
	id serial not null
		constraint type_document_pk
			primary key
		constraint type_document_version__fk
			references version,
	name varchar
);

alter table type_document owner to postgres;

create table permission
(
	fk_id_member integer not null,
	id_items integer
		constraint permission_items__fk
			references items,
	access varchar,
	id serial not null
		constraint permission_pk
			primary key
);

alter table permission owner to postgres;

create table document
(
	fk_actual_version integer
		constraint document_version__fk
			references version,
	id serial not null
		constraint document_pk
			primary key
		constraint document_items__fk
			references items
);

alter table document owner to postgres;

create table version
(
	id serial not null
		constraint version_pk
			primary key,
	name varchar,
	description varchar,
	pk_type integer,
	important varchar,
	column_6 integer,
	"version " integer,
	fk_id_document integer
		constraint version_document__fk
			references document,
	author integer,
	datecreate date
);

alter table version owner to postgres;

create table file
(
	id serial not null
		constraint file_pk
			primary key,
	fk_docversion integer
		constraint file_version__fk
			references version
);

alter table file owner to postgres;


