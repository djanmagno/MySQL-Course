desc pessoas;

alter table pessoas
add column profissao varchar(10) after nome;

alter table pessoas
modify column profissao varchar(20) not null default '';

alter table pessoas
change column profissao prof varchar(20);

alter table pessoas
add column codigo int first;

alter table pessoas 
drop column profissao;

alter table pessoas
rename to people;

select * from pessoas;
