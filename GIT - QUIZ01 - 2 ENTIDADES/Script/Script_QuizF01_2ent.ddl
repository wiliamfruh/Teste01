-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2023-09-04 17:32:45 PDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



DROP TABLE t_sgv_departamento CASCADE CONSTRAINTS;

DROP TABLE t_sgv_dependente CASCADE CONSTRAINTS;

DROP TABLE t_sgv_funcionario CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_sgv_departamento (
    cd_departamento NUMBER(3) NOT NULL,
    sg_departamento CHAR(3) NOT NULL,
    ds_departamento VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE t_sgv_departamento IS
    'Tabela departamento - criada a partir da 1FN';

COMMENT ON COLUMN t_sgv_departamento.cd_departamento IS
    'C�digo do departamento';

COMMENT ON COLUMN t_sgv_departamento.sg_departamento IS
    'Sigla do departamento';

COMMENT ON COLUMN t_sgv_departamento.ds_departamento IS
    'Descri�ao do departametno';

ALTER TABLE t_sgv_departamento ADD CONSTRAINT pk_t_sgv_departamento PRIMARY KEY ( cd_departamento );

ALTER TABLE t_sgv_departamento ADD CONSTRAINT un_t_sgv_departamento UNIQUE ( sg_departamento );

CREATE TABLE t_sgv_dependente (
    cd_funcionario NUMBER(5) NOT NULL,
    cd_dependente  NUMBER(2) NOT NULL,
    nm_dependente  VARCHAR2(50 CHAR) NOT NULL,
    dt_nasc_dep    DATE NOT NULL,
    ds_sexo        VARCHAR2(30) NOT NULL
);

COMMENT ON TABLE t_sgv_dependente IS
    'Tabela dos dependentes dos funcion�rios';

COMMENT ON COLUMN t_sgv_dependente.cd_funcionario IS
    'C�digo do funcion�rio';

COMMENT ON COLUMN t_sgv_dependente.cd_dependente IS
    'C�digo do dependente';

COMMENT ON COLUMN t_sgv_dependente.nm_dependente IS
    'Nome do dependente';

COMMENT ON COLUMN t_sgv_dependente.dt_nasc_dep IS
    'Data de nascimento do dependente';

COMMENT ON COLUMN t_sgv_dependente.ds_sexo IS
    'Sexo do dependente';

ALTER TABLE t_sgv_dependente ADD CONSTRAINT pk_t_sip_dependente PRIMARY KEY ( cd_dependente,
                                                                              cd_funcionario );

CREATE TABLE t_sgv_funcionario (
    cd_funcionario  NUMBER(5) NOT NULL,
    cd_departamento NUMBER(3) NOT NULL,
    nr_cpf          NUMBER(11) NOT NULL,
    nm_funcionario  VARCHAR2(50) NOT NULL,
    dt_nascimento   DATE NOT NULL,
    nr_telefone     NUMBER(11) NOT NULL,
    ds_email        VARCHAR2(50) NOT NULL,
    ds_cargo        VARCHAR2(50)
);

COMMENT ON TABLE t_sgv_funcionario IS
    'Tabela funcion�rios';

COMMENT ON COLUMN t_sgv_funcionario.cd_funcionario IS
    'C�digo do funcion�rio';

COMMENT ON COLUMN t_sgv_funcionario.cd_departamento IS
    'C�digo do departamento';

COMMENT ON COLUMN t_sgv_funcionario.nr_cpf IS
    'N�mero do CPF do funcion�rio - Unique';

COMMENT ON COLUMN t_sgv_funcionario.nm_funcionario IS
    'Nome do funcion�rio';

COMMENT ON COLUMN t_sgv_funcionario.dt_nascimento IS
    'Data de nascimento do funcion�rio';

COMMENT ON COLUMN t_sgv_funcionario.nr_telefone IS
    'N�mero do telefone do funcion�rio - dddnnnnnnnnn';

COMMENT ON COLUMN t_sgv_funcionario.ds_email IS
    'Email do funcion�rio';

COMMENT ON COLUMN t_sgv_funcionario.ds_cargo IS
    'Cargo do funcion�rio';

ALTER TABLE t_sgv_funcionario ADD CONSTRAINT pk_t_sgv_funcionario PRIMARY KEY ( cd_funcionario );

ALTER TABLE t_sgv_funcionario ADD CONSTRAINT un_t_sgv_funcionario UNIQUE ( nr_cpf );

ALTER TABLE t_sgv_dependente
    ADD CONSTRAINT fk_sgv_depend_func FOREIGN KEY ( cd_funcionario )
        REFERENCES t_sgv_funcionario ( cd_funcionario );

ALTER TABLE t_sgv_funcionario
    ADD CONSTRAINT fk_sgv_func_depto FOREIGN KEY ( cd_departamento )
        REFERENCES t_sgv_departamento ( cd_departamento );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              7
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
