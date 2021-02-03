describe gafanhotos;
describe cursos;

# Adicionando uma foreing key na tabela gafanhoto -> Foreign Key = Primary key tabela cursos (pode ter outro nome mas tem que ser de mesma
# tipagem
alter table gafanhotos
add column cursopreferido int;

alter table gafanhotos
add foreign key (cursopreferido)
references cursos(idcurso);

select * from gafanhotos;
select * from cursos;

update gafanhotos set cursopreferido = '6'
where id = '1';

delete from cursos
where idcurso = '28';