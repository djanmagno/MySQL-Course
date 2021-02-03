select * from cursos order by nome desc;

select ano, nome, carga from cursos
order by ano, nome;

select * from cursos
where ano = '2016'
order by nome;

select nome, descricao, ano from cursos
where ano <= '2015'
order by ano, nome;

select nome, ano from cursos
where ano between 2014 and 2016
order by ano desc, nome;

select nome, ano from cursos
where ano in (2016, 2018, 2020)
order by ano desc, nome desc;

select * from cursos
where carga > 35 and totaulas < 30;

select * from cursos
where carga > 35 or totaulas < 30;