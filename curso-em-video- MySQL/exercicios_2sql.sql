# Lista das profissões e quantitativos
select  profissao, count(*) from gafanhotos
group by profissao
order by count(*) desc; 

# Quantos m e quantas f nasceram apos 01-jan-2005
select sexo, count(*) from gafanhotos
where nascimento > '2005-01-01'
group by sexo
order by count(*) desc;

# Lista de pessoas que nasceram fora do brasil mostrando pais de origem e o
# total de pessoas nascidas la e somente os paises com mais de 3 nascimentos
select nacionalidade, count(*) from gafanhotos
where nacionalidade != 'Brasil'
group by nacionalidade
having count(*) > 3
order by count(*) desc;

# Lista agrupada por altura mostrando somente as pessoas que pesam
# mais de 100 kg e que estao acima da media de altura de todos os cadastrados

select avg(altura) from gafanhotos;

select altura, count(*) from gafanhotos
where peso > 100 and altura > (select avg(altura) from gafanhotos)
group by altura
order by altura desc;




