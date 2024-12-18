CREATE SCHEMA IF NOT EXISTS blog;

create table blog.post (
	id serial primary key,
	title text not null,
	content text not null,
	date timestamp default now()
);
