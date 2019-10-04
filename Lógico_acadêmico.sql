/* L�gico_acad�mico: */
create schema academico;
use academico;

CREATE TABLE aluno (
    matricula INTEGER PRIMARY KEY,
    nome VARCHAR(40),
    telefone VARCHAR(11),
    dataEntreda DATE
);

CREATE TABLE disciplina (
    codDisc INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40),
    cargaHor INTEGER
);

CREATE TABLE turma (
    codTurma INTEGER AUTO_INCREMENT PRIMARY KEY,
    semestre INTEGER,
    ano INTEGER,
    fk_professor_registro INTEGER,
    fk_disciplina_codDisc INTEGER
);

CREATE TABLE professor (
    registro INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40),
    telefone VARCHAR(11),
    salario FLOAT
);


ALTER TABLE turma ADD CONSTRAINT FK_turma_2
    FOREIGN KEY (fk_professor_registro)
    REFERENCES professor (registro)
    ON DELETE RESTRICT;

CREATE TABLE aluno_turma (
    medias FLOAT,
    faltas INTEGER,
    fk_turma_codTurma INTEGER,
    fk_aluno_matricula INTEGER,
    PRIMARY KEY (fk_turma_codTurma, fk_aluno_matricula)
);

ALTER TABLE turma ADD CONSTRAINT FK_turma_3
    FOREIGN KEY (fk_disciplina_codDisc)
    REFERENCES disciplina (codDisc)
    ON DELETE RESTRICT;

ALTER TABLE aluno_turma ADD CONSTRAINT FK_aluno_turma
    FOREIGN KEY (fk_turma_codTurma)
    REFERENCES turma (codTurma);

ALTER TABLE aluno_turma ADD CONSTRAINT FK_aluno_turma
    FOREIGN KEY (fk_aluno_matricula)
    REFERENCES aluno (matricula);

insert into aluno values ('123456','Glauber','71985284838','2016-01-05'),
                         ('123457','Laile','71985284839','2017-01-06'),
                         ('123458','Raimunda','71985284840','2018-04-02'),
                         ('123459','Victoria','71985284841','2019-02-01'),
                         ('626510','Maria','71665894268','2015-03-08');

insert into disciplina values (DEFAULT,'BD1','40'),
                              (DEFAULT,'SO','30'),
                              (DEFAULT,'MDS','20'),
                              (DEFAULT,'LP1','40'),
                              (DEFAULT,'ED1','40');

insert into turma values (DEFAULT,'3','2015','2356','235'),
                         (DEFAULT,'4','2013','5684','200'),
                         (DEFAULT,'5','2018','3658','235'),
                         (DEFAULT,'3','2014','4564','235'),
                         (DEFAULT,'1','2019','3256','235');

insert into professor values (DEFAULT,'Ana Patricia','716586976','5.500'),
                             (DEFAULT,'Jorge Campos','716586996','4.400'),
                             (DEFAULT,'Antonio Ata','716586956','5.100'),
                             (DEFAULT,'Jorge Farias','716586466','1.500'),
                             (DEFAULT,'Roque Santos','716586566','3.500');

insert into aluno_turma values ('5.0','3','23256','323255'),
                               ('6.0','14','4568','145649'),
                               ('5.0','3','36564','354678'),
                               ('6.0','15','3259','155468'),
                               ('8.0','10','4668','104569');


update aluno set telefone = 71912345678
where matricula = 123456;

/*update professor set salario = 10000;*/

update disciplina set nome = 'Sexologia', cargaHor =120
where codDisc=1;

/*update turma set ano = 2019;*/

update aluno set nome ='Maria Santos'
where matricula =123456;

delete from aluno
where matricula =123456;

delete from professor
where registro = 1;

delete from disciplina
where codDisc = 1;

delete from turma
where codTurma = 5;

delete from aluno_turma
where fk_aluno_matricula=323255;

select * from aluno;

select nome,telefone from aluno;

select nome,salario from professor;

select cargaHor from disciplina
where codDisc =3;



update professor set salario = salario * 1.2;
select round(avg(medias),2) as 'media' from aluno_turma;
select nome, telefone from professor;
select upper(nome) from aluno
where nome like ('A%A');

select registro as 'numero de registro',
nome as 'nome do projeto'
from professor
where salario between 1000 and 3000;

select * from disciplina
where cargahor in (30,40,60);

select * from turma
where ano = 2010 and semestre = 2;

select * from aluno_turma
where medias is not null;

select * from aluno_turma
where faltas is null or
faltas = 0;

select distinct fk_disciplina_codDisc
from turma;

select*from aluno_turma
order by medias desc;

select*from disciplina
order by nome;

select professor.nome as NomeDoProfessor, disciplina.nome as NomeDaDisciplina
from professor
inner join turma
on professor.registro= /*turma.fk_professor_registro*/turma.codTurma
inner join disciplina
on disciplina.codDisc=/*turma.fk_disciplina_codDisc*/turma.codTurma
where semestre = 1 and ano = 2019
order by professor.nome, disciplina.nome asc;