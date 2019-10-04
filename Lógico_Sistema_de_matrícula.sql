/* L�gico_Sistema_de_matr�cula: */
CREATE SCHEMA sistemadematricula;
USE sistemadematricula;

CREATE TABLE escola (
    id_escola INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(40),
    telefone VARCHAR(40),
    cep VARCHAR(40),
    cidade VARCHAR(40),
    bairro VARCHAR(40),
    numero INTEGER,
    fk_funcionario_matricula_funcionario VARCHAR(40)
);

CREATE TABLE funcionario (
    matricula_funcionario VARCHAR(40) PRIMARY KEY,
    cargo VARCHAR(40),
    nome VARCHAR(40),
    email VARCHAR(40),
    telefone VARCHAR(40),
    login VARCHAR(40),
    senha VARCHAR(40)
);

CREATE TABLE aluno (
    matricula_aluno VARCHAR(40) PRIMARY KEY,
    nome VARCHAR(40),
    data_nasccimento DATE,
    cep VARCHAR(40),
    numero INTEGER,
    bairro VARCHAR(40),
    cidade VARCHAR(40),
    fk_responsavel_cpf VARCHAR(40)
);

CREATE TABLE responsavel (
    cpf VARCHAR(40) PRIMARY KEY,
    nome VARCHAR(40),
    telefone VARCHAR(40),
    email VARCHAR(40)
);

CREATE TABLE serie (
    id_serie INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(40)
);

CREATE TABLE E__Assoc__serie_escola_serie_escola (
    capacidade INTEGER,
    id_serie_escola INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    fk_funcionario_matricula_funcionario VARCHAR(40),
    fk_escola_id_escola INTEGER,
    fk_serie_id_serie INTEGER
);

CREATE TABLE pre_matricula (
    data_inicio_matricula DATE,
    data_fim_matricula DATE,
    id_pre_matricula INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    fk_aluno_matricula_aluno VARCHAR(40),
    fk_E__Assoc__serie_escola_serie_escola_id_Serie_escola INTEGER
);

CREATE TABLE E__Assoc__aluno_serie_curso (
    ano INTEGER,

    id_curso INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    fk_aluno_matricula_aluno VARCHAR(40),
    fk_E__Assoc__serie_escola_serie_escola_id_Serie_escola INTEGER
);

CREATE TABLE rematricula (
    id_rematricula INTEGER,
    fk_pre_matricula_id_pre_matricula INTEGER,
    PRIMARY KEY (id_rematricula, fk_pre_matricula_id_pre_matricula)
);

CREATE TABLE transferencia (
    id_transferencia INTEGER AUTO_INCREMENT NOT NULL ,
    fk_pre_matricula_id_pre_matricula INTEGER,
    PRIMARY KEY (id_transferencia, fk_pre_matricula_id_pre_matricula)
);

ALTER TABLE escola ADD CONSTRAINT FK_escola_2
    FOREIGN KEY (fk_funcionario_matricula_funcionario)
    REFERENCES funcionario (matricula_funcionario)
    ON DELETE RESTRICT;

ALTER TABLE aluno ADD CONSTRAINT FK_aluno_2
    FOREIGN KEY (fk_responsavel_cpf)
    REFERENCES responsavel (cpf)
    ON DELETE CASCADE;

ALTER TABLE E__Assoc__serie_escola_serie_escola ADD CONSTRAINT FK_E__Assoc__serie_escola_serie_escola_2
    FOREIGN KEY (fk_funcionario_matricula_funcionario)
    REFERENCES funcionario (matricula_funcionario)
    ON DELETE RESTRICT;

ALTER TABLE E__Assoc__serie_escola_serie_escola ADD CONSTRAINT FK_E__Assoc__serie_escola_serie_escola_3
    FOREIGN KEY (fk_escola_id_escola)
    REFERENCES escola (id_escola);

ALTER TABLE E__Assoc__serie_escola_serie_escola ADD CONSTRAINT FK_E__Assoc__serie_escola_serie_escola_4
    FOREIGN KEY (fk_serie_id_serie)
    REFERENCES serie (id_serie);

ALTER TABLE pre_matricula ADD CONSTRAINT FK_pre_matricula_2
    FOREIGN KEY (fk_aluno_matricula_aluno)
    REFERENCES aluno (matricula_aluno)
    ON DELETE CASCADE;

ALTER TABLE pre_matricula ADD CONSTRAINT FK_pre_matricula_3
    FOREIGN KEY (fk_E__Assoc__serie_escola_serie_escola_id_Serie_escola)
    REFERENCES E__Assoc__serie_escola_serie_escola (id_serie_escola)
    ON DELETE CASCADE;

ALTER TABLE E__Assoc__aluno_serie_curso ADD CONSTRAINT FK_E__Assoc__aluno_serie_curso_2
    FOREIGN KEY (fk_aluno_matricula_aluno)
    REFERENCES aluno (matricula_aluno);

ALTER TABLE E__Assoc__aluno_serie_curso ADD CONSTRAINT FK_E__Assoc__aluno_serie_curso_3
    FOREIGN KEY (fk_E__Assoc__serie_escola_serie_escola_id_Serie_escola)
    REFERENCES E__Assoc__serie_escola_serie_escola (id_serie_escola);

ALTER TABLE rematricula ADD CONSTRAINT FK_rematricula_2
    FOREIGN KEY (fk_pre_matricula_id_pre_matricula)
    REFERENCES pre_matricula (id_pre_matricula)
    ON DELETE CASCADE;

ALTER TABLE transferencia ADD CONSTRAINT FK_transferencia_2
    FOREIGN KEY (fk_pre_matricula_id_pre_matricula)
    REFERENCES pre_matricula (id_pre_matricula)
    ON DELETE CASCADE;

INSERT INTO aluno (matricula_aluno, nome, data_nasccimento, cep, numero, bairro, cidade, fk_responsavel_cpf) VALUES ('071610140','Glauber Santos da Silva','1989-10-12','41253-190','254','São Marcos','Salvador-Ba','040.309.345-79'),
                                                                                                                    ('071610141','Laile Catureba de Araujo','1993-09-11','41253-191','284','Uruguai','Salvador-Ba','040.309.345-80'),
                                                                                                                    ('071610142','Raimunda Santos da Silva','1988-08-23','41253-192','840','Ribeira','Salvador-Ba','040.309.345-81'),
                                                                                                                    ('071610143','Victoria Santos da Silva','1997-10-04','41253-193','240','Stella Mares','Salvador-Ba','040.309.345-82'),
                                                                                                                    ('071610144','Nainhane Santos da Silva','1984-08-30','41253-194','840','São Marcos','Alagonhias-Ba','040.309.345-83'),
                                                                                                                    ('071610145','Mateus Pena','1993-03-11','41256-45','4585','Pau Da Lima','Salvador-Ba','040.309.345-84'),
                                                                                                                    ('071610146','Creuza Santos','1994-04-12','41587-56','4587','São rafael','Salvador-Ba','040.309.345-85'),
                                                                                                                    ('071610147','Raimundo Silva','1994-06-11','41545-58','4788','Valeria','Salvador-Ba','040.309.345-86'),
                                                                                                                    ('071610148','Cândido Junior','2000-05-07','41547-85','45','Sussuarana','Salvador-Ba','040.309.345-87'),
                                                                                                                    ('071610159','Camila Araujo','2004-06-01','41545-58','89','Brotas','Salvador-Ba','040.309.345-88');

INSERT INTO E__Assoc__aluno_serie_curso (ano,id_curso, fk_aluno_matricula_aluno,fk_E__Assoc__serie_escola_serie_escola_id_Serie_escola) VALUES ('2019',DEFAULT,'071610140','1'),
                                                                                                                                               ('2018',DEFAULT,'071610141','2'),
                                                                                                                                               ('2019',DEFAULT,'071610142','3'),
                                                                                                                                               ('2018',DEFAULT,'071610143','4'),
                                                                                                                                               ('2017',DEFAULT,'071610144','5'),
                                                                                                                                               ('2020',DEFAULT,'071610140','7'),
                                                                                                                                               ('2019',DEFAULT,'071610141','8'),
                                                                                                                                               ('2020',DEFAULT,'071610142','9'),
                                                                                                                                               ('2019',DEFAULT,'071610143','10'),
                                                                                                                                               ('2018',DEFAULT,'071610144','6');

INSERT INTO E__Assoc__serie_escola_serie_escola (capacidade,id_serie_escola, fk_funcionario_matricula_funcionario, fk_escola_id_escola, fk_serie_id_serie) VALUES ('20',DEFAULT,'071325687','1','1'),
                                                                                                                                                                  ('25',DEFAULT,'071456987','2','2'),
                                                                                                                                                                  ('27',DEFAULT,'071365478','3','3'),
                                                                                                                                                                  ('26',DEFAULT,'071256415','4','4'),
                                                                                                                                                                  ('25',DEFAULT,'071565815','5','5'),
                                                                                                                                                                  ('23',DEFAULT,'071256415','1','1'),
                                                                                                                                                                  ('25',DEFAULT,'071256415','2','8'),
                                                                                                                                                                  ('22',DEFAULT,'071256415','4','4'),
                                                                                                                                                                  ('10',DEFAULT,'071256415','6','5'),
                                                                                                                                                                  ('16',DEFAULT,'071256415','8','3');

INSERT INTO escola (nome, id_escola, telefone, cep, cidade, bairro, numero, fk_funcionario_matricula_funcionario) VALUES ('Escola Est Vale Dos Lagos',default,'713241-2104','41253-200','Salvador','Vale dos Lagos','3226','071325658'),
                                                                                                                         ('Escola Est Odoríco Tavares',default,'719346-5635','44657-76','Salvador','Centro','3456','071456987'),
                                                                                                                         ('Escola Est Manuel Novais',default,'713452-4657','34635-34','Salvador','Centro','3453','071365478'),
                                                                                                                         ('Escola Est Central',default,'713456-8789','54678-98','Salvador','Centro','456','071256415'),
                                                                                                                         ('Escola Est Anísio Texeira',default,'713212-1704','41253-200','Salvador','Vale dos Lagos','3226','071456987'),
                                                                                                                         ('Escola Não Sei Estudar',default,'7132544-4586','41565-455','Salvador','Centro','456','071565100'),
                                                                                                                         ('Escola Bora bahia',default,'714632-4587','415658-458','Salvador','São Marcos','4455','071565100'),
                                                                                                                         ('Escola É Minha Casa',default,'716585-4584','415458-458','Salvador','Pituba','458','071565878'),
                                                                                                                         ('Escola Um Dia Eu Durmo',default,'716586-4584','414587-856','Salvador','Ondina','458','071565878'),
                                                                                                                         ('Escola Um Dia Eu Me Formo',default,'718666-4589','41236-586','Salvador','Barra','666','071541235');

INSERT INTO funcionario (matricula_funcionario, cargo, nome, email, telefone, login, senha) VALUES ('071325658','Diretor','Osvaldo de Oliveira Pinto','Osvaldo@Uneb.com.br','71985-6586','abc@2010','pipoca10'),
                                                                                                   ('071456987','Professor','Maria Rosaria','Maria@unifac.com.br','719857-6548','lkj56588','cabeca20'),
                                                                                                   ('071365478','Professor','Pedro Santos','Pedro@hotmet.com.br','723656-8989','4569klj','bahia12'),
                                                                                                   ('071256415','Professor','Judite Costa','Judit@outlook.com','715456-8946','asd45gh','565898'),
                                                                                                   ('071565898','Diretor','Robson Santos','Robbb@terra.com.br','714563-2656','caba456','4565878'),
                                                                                                   ('071565100','Professor','Rosa Santos','Rosa@yahoo.com.br','716564-4587','ssa556','458sasd'),
                                                                                                   ('071545810','Professor','João Canabrava','Pingunçu@yahoo.com.br','715458-4589','5458asa','4586wadd'),
                                                                                                   ('071565878','Professor','Pedro Pedreira','Pedreira@estou.com.br','715458-4754','45ad69','48qe65'),
                                                                                                   ('071548798','Professor','Rui Costa','Rui@costa.com.br','715658-4586','54a7e8','4d5f6s'),
                                                                                                   ('071541235','Professor','Pipoca Balada','pipoca@balada.com.br','715687-4587','4a5d6w','458698');

INSERT INTO pre_matricula (data_inicio_matricula, data_fim_matricula, id_pre_matricula, fk_aluno_matricula_aluno,fk_E__Assoc__serie_escola_serie_escola_id_Serie_escola) VALUES ('2015-02-02','2015-03-15',default,'071610140','1'),
                                                                                                                                                                                ('2016-02-02','2016-03-15',default,'071610141','2'),
                                                                                                                                                                                ('2017-02-02','2017-03-15',default,'071610142','3'),
                                                                                                                                                                                ('2018-02-02','2018-03-15',default,'071610143','4'),
                                                                                                                                                                                ('2019-05-03','2019-06-15',default,'071610144','5'),
                                                                                                                                                                                ('2017-05-01','2017-06-15',default,'071610145','5'),
                                                                                                                                                                                ('2015-03-05','2015-04-15',default,'071610146','6'),
                                                                                                                                                                                ('2016-07-10','2016-08-15',default,'071610147','1'),
                                                                                                                                                                                ('2018-06-20','2018-07-15',default,'071610148','3'),
                                                                                                                                                                                ('2012-04-30','2012-05-15',default,'071610149','5');


INSERT INTO rematricula (id_rematricula, fk_pre_matricula_id_pre_matricula) VALUES ('071610140','1'),
                                                                                   ('071610141','2'),
                                                                                   ('071610142','3'),
                                                                                   ('071610143','4'),
                                                                                   ('071610144','5'),
                                                                                   ('071610145','6'),
                                                                                   ('071610146','7'),
                                                                                   ('071610147','8'),
                                                                                   ('071610148','9'),
                                                                                   ('071610149','10');

INSERT INTO responsavel (cpf, telefone, nome, email) VALUES ('040.309.345-79','719858-5838','Ivene Catureba De araujo','ive.silva@outlook.com'),
                                                            ('040.309.345-80','719858-4828','Rodrigo Santos da Silva','rai.pdfa@outlook.com'),
                                                            ('040.309.345-81','719858-4838','Raimundo Peixoto da Silva','bora.slv@outlook.com'),
                                                            ('040.309.345-82','719828-4438','Luiza Santos da Araujo','ri.va@outlook.com'),
                                                            ('040.309.345-83','719528-4858','Raimunda Catureba da Silva','rai@outlook.com'),
                                                            ('040.309.345-84','718585-4855','Jose Barreto','barrreto@bahia.com.br'),
                                                            ('040.309.345-85','715684-5685','Barbara Alonso','Barbara@bpmp.com'),
                                                            ('040.309.345-86','715648-4564','Roberto Santos','Rob@optr.com.br'),
                                                            ('040.309.345-87','716587-8545','Priscila Costa','pri@batima.com.br'),
                                                            ('040.309.345-88','715825-4569','Cabeça Junior','Cabeça@caba.com.br');

INSERT INTO serie (id_serie, nome) VALUES (default,'Primeira Serie'),
                                          (default,'Segunda Serie'),
                                          (default,'Terceira Serie'),
                                          (default,'Quarta Serie'),
                                          (default,'Quinta Serie'),
                                          (default,'Sexta Serie'),
                                          (default,'Oitava Serie'),
                                          (default,'Primeiro Ano'),
                                          (default,'Segundo Ano'),
                                          (default,'Terceiro Ano');

INSERT INTO transferencia (id_transferencia, fk_pre_matricula_id_pre_matricula) VALUES (default,'1'),
                                                                                       (default,'2'),
                                                                                       (default,'3'),
                                                                                       (default,'4'),
                                                                                       (default,'5'),
                                                                                       (default,'6'),
                                                                                       (default,'7'),
                                                                                       (default,'8'),
                                                                                       (default,'9'),
                                                                                       (default,'10');

/*Query's solicitadas:*/

/*Dados de uma escola*/
select * from escola
where id_escola=1;

/*Escolas disponíveis para uma determinada série em um
determinado bairro*/
select serie.nome as Serie,escola.nome as Escola, escola.bairro as Bairro
from E__Assoc__serie_escola_serie_escola
inner join serie
on serie.id_serie=e__Assoc__serie_escola_serie_escola.fk_serie_id_serie
inner join escola
on escola.id_escola=E__assoc__serie_escola_serie_escola.fk_escola_id_escola
where serie.nome= 'Segunda Serie' and bairro = 'Centro';

/*Quantidade de escolas por cidade*/
select escola.nome as NomeEscola,escola.cidade as Cidade, count(cidade) as QuatidadeDeEscolas
from escola
where cidade='Salvador'
group by escola.nome,escola.cidade;

/*Vagas disponíveis por série em uma escola*/
select escola.nome,serie.nome,e__assoc__serie_escola_serie_escola.capacidade
from E__Assoc__serie_escola_serie_escola
inner join escola
on escola.id_escola=e__assoc__serie_escola_serie_escola.fk_escola_id_escola
inner join serie
on serie.id_serie=E__Assoc__serie_escola_serie_escola.fk_serie_id_serie
where id_escola =1 and serie.nome ='Primeira Serie';

/*Alunos em cada escola por série*/
select aluno.nome as NomeAlunos,escola.nome as NomeEscola,serie.nome as Serie
from E__Assoc__aluno_serie_curso
inner join aluno
on aluno.matricula_aluno =e__assoc__aluno_serie_curso.fk_aluno_matricula_aluno
inner join serie
on serie.id_serie = e__assoc__aluno_serie_curso.fk_E__Assoc__serie_escola_serie_escola_id_Serie_escola
inner join e__assoc__serie_escola_serie_escola
on E__Assoc__serie_escola_serie_escola.id_serie_escola = E__Assoc__aluno_serie_curso.fk_E__Assoc__serie_escola_serie_escola_id_Serie_escola
inner join escola
on escola.id_escola = E__Assoc__serie_escola_serie_escola.fk_escola_id_escola
group by serie.id_serie order by serie.id_serie;

/*Pré-matrículas solicitadas*/
select fk_aluno_matricula_aluno as PreMatriculasSolicittadas
from pre_matricula;

/*Solicitações de transferência para uma determinada escola por
série*/
select escola.nome as NomeEscola, serie.nome as NomeSerie, pre_matricula.fk_aluno_matricula_aluno as MatriculaAluno
from transferencia
inner join pre_matricula
on pre_matricula.id_pre_matricula = transferencia.fk_pre_matricula_id_pre_matricula
inner join e__assoc__serie_escola_serie_escola
on E__Assoc__serie_escola_serie_escola.id_serie_escola = pre_matricula.fk_E__Assoc__serie_escola_serie_escola_id_Serie_escola
inner join serie
on serie.id_serie = E__Assoc__serie_escola_serie_escola.fk_serie_id_serie
inner join escola
on escola.id_escola = E__Assoc__serie_escola_serie_escola.fk_escola_id_escola
where escola.id_escola=1 and serie.id_serie= 1;

/*Escolas que precisam de mais vagas por série*/
select escola.nome as NomeEscola
from pre_matricula
inner join E__Assoc__serie_escola_serie_escola
on E__Assoc__serie_escola_serie_escola.id_serie_escola=pre_matricula.fk_E__Assoc__serie_escola_serie_escola_id_Serie_escola
inner join serie
on serie.id_serie = E__Assoc__serie_escola_serie_escola.fk_serie_id_serie
inner join escola
on escola.id_escola = E__Assoc__serie_escola_serie_escola.fk_escola_id_escola
where capacidade < select count(*) from meio where ;

/*Cidades que precisam de mais escolas, de acordo com a lista
de espera das escolas*/
