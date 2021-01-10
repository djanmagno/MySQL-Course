# Lista com todas as mulhres da tabela Gafanhoto
select nome, sexo from gafanhotos
where sexo = 'F';

# Lista com todos aqueles que nasceram entre 1/jan/2020 e 31/dez/2015
select nome, nascimento from gafanhotos
where nascimento between '2000-01-01' and '2015-12-31'
order by nascimento;

# Lista todos os homens programadores
select nome, profissao, sexo from gafanhotos
where sexo = 'M' and profissao = 'Programador'
order by nome;

# lista com os dados de todas as mulheres brasileiras com nome iniciado com j
select * from gafanhotos
where nome like 'J%' and nacionalidade = 'Brasil'
order by nome;

# lista com nome e nacionalidade dos homens que tem silva no nome nao nasceram no brasil e pesam menos de 100kg
select nome, nacionalidade from gafanhotos
where nome like '%Silva%' and nacionalidade != 'Brasil' and peso < 100
order by nome;

# Maior altura dos homens brasileiros
select max(altura) from gafanhotos
where nacionalidade = 'Brasil' and sexo = 'M';

# Média de pesos de todos os cadastrados
select avg(peso) from gafanhotos;

# Menor peso entre as mulheres nao brasileiras que nasceram entre 01/jan/1990 e 31/dez/2000
select min(peso) from gafanhotos
where (sexo = 'F' and nacionalidade != 'Brasil') and (nascimento between '1990-01-01' and '2000-12-31');

# Quantas mulheres tem mais de 1.9
select count(*) from gafanhotos
where sexo = 'F' and altura > '1.90';