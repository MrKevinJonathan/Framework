

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT (
   IDCLIENT             INT8                 not null,
   NOM                  VARCHAR(50)          not null,
   PRENOM               VARCHAR(50)          not null,
   DATENAISSANCE        DATE                 not null,
   SEXE                 VARCHAR(1)           not null,
   MATRICULE            VARCHAR(15)          not null,
   CIN                  VARCHAR(12)          not null,
   MOTDEPASSE           VARCHAR(20)          not null,
   EXISTE               BOOL                 not null,
   DATEINSCRIPTION      DATE                 not null,
   DATEINSERTION        DATE                 not null,
   constraint PK_CLIENT primary key (IDCLIENT)
);

/*==============================================================*/
/* Index : CLIENT_PK                                            */
/*==============================================================*/
create unique index CLIENT_PK on CLIENT (
IDCLIENT
);

/*==============================================================*/
/* Table : COMPTE                                               */
/*==============================================================*/
create table COMPTE (
   IDCOMPTE             INT8                 not null,
   IDCLIENT             INT8                 not null,
   IDTYPECOMPTE         INT4                 not null,
   NUMCOMPTE            VARCHAR(15)          not null,
   MOTDEPASSE           VARCHAR(20)          not null,
   SOLDE                NUMERIC              not null,
   EXISTE               BOOL                 not null,
   DATECREATION         DATE                 not null,
   DATEINSERTION        DATE                 not null,
   constraint PK_COMPTE primary key (IDCOMPTE)
);

/*==============================================================*/
/* Index : COMPTE_PK                                            */
/*==============================================================*/
create unique index COMPTE_PK on COMPTE (
IDCOMPTE
);

/*==============================================================*/
/* Index : COMPTE_CLIENT_FK                                     */
/*==============================================================*/
create  index COMPTE_CLIENT_FK on COMPTE (
IDCLIENT
);

/*==============================================================*/
/* Index : TYPE_COMPTE_FK                                       */
/*==============================================================*/
create  index TYPE_COMPTE_FK on COMPTE (
IDTYPECOMPTE
);

/*==============================================================*/
/* Table : MVTCOMPTE                                            */
/*==============================================================*/
create table MVTCOMPTE (
   IDMVTCOMPTE          INT8                 not null,
   IDCOMPTE             INT8                 not null,
   IDTYPEMVT            INT4                 not null,
   MONTANT              NUMERIC              not null,
   DATEMVT              DATE                 not null,
   DATEINSERTION        DATE                 not null,
   constraint PK_MVTCOMPTE primary key (IDMVTCOMPTE)
);

/*==============================================================*/
/* Index : MVTCOMPTE_PK                                         */
/*==============================================================*/
create unique index MVTCOMPTE_PK on MVTCOMPTE (
IDMVTCOMPTE
);

/*==============================================================*/
/* Index : MVT_COMPTE_FK                                        */
/*==============================================================*/
create  index MVT_COMPTE_FK on MVTCOMPTE (
IDCOMPTE
);

/*==============================================================*/
/* Index : TYPE_MVT_FK                                          */
/*==============================================================*/
create  index TYPE_MVT_FK on MVTCOMPTE (
IDTYPEMVT
);

/*==============================================================*/
/* Table : TYPECOMPTE                                           */
/*==============================================================*/
create table TYPECOMPTE (
   IDTYPECOMPTE         INT4                 not null,
   DESIGNATION          VARCHAR(50)          not null,
   DESCRIPTION          VARCHAR(250)         not null,
   DATECREATION         DATE                 not null,
   DATEINSERTION        DATE                 not null,
   constraint PK_TYPECOMPTE primary key (IDTYPECOMPTE)
);

/*==============================================================*/
/* Index : TYPECOMPTE_PK                                        */
/*==============================================================*/
create unique index TYPECOMPTE_PK on TYPECOMPTE (
IDTYPECOMPTE
);

/*==============================================================*/
/* Table : TYPEMVT                                              */
/*==============================================================*/
create table TYPEMVT (
   IDTYPEMVT            INT4                 not null,
   DESIGNATION          VARCHAR(50)          not null,
   DESCRIPTION          VARCHAR(250)         not null,
   DATECREATION         DATE                 not null,
   DATEINSERTION        DATE                 not null,
   constraint PK_TYPEMVT primary key (IDTYPEMVT)
);

/*==============================================================*/
/* Index : TYPEMVT_PK                                           */
/*==============================================================*/
create unique index TYPEMVT_PK on TYPEMVT (
IDTYPEMVT
);

alter table COMPTE
   add constraint FK_COMPTE_COMPTE_CL_CLIENT foreign key (IDCLIENT)
      references CLIENT (IDCLIENT)
      on delete restrict on update restrict;

alter table COMPTE
   add constraint FK_COMPTE_TYPE_COMP_TYPECOMP foreign key (IDTYPECOMPTE)
      references TYPECOMPTE (IDTYPECOMPTE)
      on delete restrict on update restrict;

alter table MVTCOMPTE
   add constraint FK_MVTCOMPT_MVT_COMPT_COMPTE foreign key (IDCOMPTE)
      references COMPTE (IDCOMPTE)
      on delete restrict on update restrict;

alter table MVTCOMPTE
   add constraint FK_MVTCOMPT_TYPE_MVT_TYPEMVT foreign key (IDTYPEMVT)
      references TYPEMVT (IDTYPEMVT)
      on delete restrict on update restrict;

