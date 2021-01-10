use cadastro;

insert into cursos values
('1','HTML4','Curso de HTML5','40','37','2014'),
('2','Algoritmos','Lógica de Programação','20','15','2014'),
('3','Photoshop','Dicas de Photoshop CC','10','8','2014'),
('4','PGP','Curso de PHP para Iniciantes','40','20','2010'),
('5','jARVA','Introdução a linguagem Java','10','29','2000'),
('6','MySQL','Banco de Dados SQL','30','15','2016'),
('7','Word','Curso completo de Word','40','30','2016'),
('8','E','FFFF','40','37','2022'),
('9','J','SWDR','40','37','2022'),
('10','K','RREL5','40','37','2022');

update cursos
set nome = 'HTML5'
WHERE idcurso = '1';

update cursos
set nome = 'PHP', ano = '2015'
where idcurso = 4;

update cursos
set nome = 'Java', carga = '40', ano = '2015'
where idcurso = 5
limit 1;

update cursos
set ano = '2050', carga = '890'
where ano = '2022';

update cursos
set ano = '2020', carga = '0'
where ano = '2050'
limit 1;

update cursos
set ano = '2020', carga = '0'
where ano = '2050';

delete from cursos
where idcurso = 8;

delete from cursos
where ano = '2020'
limit 2;

truncate cursos;

select * from cursos;