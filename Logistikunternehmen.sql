





create table "buerogebaeude"(
	BuerogebaeudeID int 			PRIMARY KEY identity,
	"anzahlBuero" int			not null,
	"anzahlMitarbeiter" int			not null,
	"baujahr" int				not null check("baujahr" > 1800),
	"standort" varchar (42)			not null,
	"parkplatzAnzahl" int			check ("parkplatzAnzahl" >= 0),
	"abteilungen" varchar (42)		not null,
	"verantwortlicher" varchar (42) not null
	)


create table "gueter"(
	"GueterIID" int PRIMARY KEY identity,
	"verpackung" varchar(1)			not null check ( "verpackung" like 'f' or "verpackung" like 'v' or "verpackung" like 'l'),
	"gewicht" varchar (42)			not null
	)



create table "lagerhalle"(
	LagerhalleID int PRIMARY KEY identity,
	"groeße" int					not null check ("groeße" > 0),
	"anzahlMitarbeiter" int			check ("anzahlMitarbeiter" >= 0),
	"baujahr" int					not null check ("baujahr" > 0),
	"standort" varchar (42)			not null,
	"lkwparkplatzanzahl" int		check ("lkwparkplatzanzahl" >= 0),
	"pkwparkplatzanzahl" int		check ("pkwparkplatzanzahl" >= 0),
	GueterID int					not null check ("GueterID" > 0),
	FOREIGN KEY ("GueterID") REFERENCES "Gueter"("GueterIID")
	)




create table "anhaenger"(
	"AnhaengerID" int				Primary KEY identity,
	"gewicht" int					not null check ("gewicht" > 0),
	"transportart" varchar(42)		not null,
	"anhaengeralter" int			check ("anhaengeralter" >= 0),
	"tuev" int						not null check ("tuev" > 2000 AND "tuev" < 2100) ,
	"hu" int						not null check ("hu" > 2000 AND "hu" < 2100),
	"achsenanzahl" int				check ("achsenanzahl" >= 0),
	"drehschemel" varchar (1)		not null check ( "drehschemel" like 'y' or "drehschemel" like 'n'))
create table "fahrzeug"(
	FahrzeugID int					PRIMARY KEY identity,
	"gewicht" int					not null check ("gewicht" > 0),
	"baujahr" int					not null check ("baujahr" > 0),
	"standort" varchar(42)			not null,
	"transportart" varchar(42)		not null,
	"fahrer" varchar(42)			not null,
	"anhaengerid" int				not null check ("anhaengerid" > 0),
	"maxgewicht" int				not null check ("maxgewicht" > 0),
	FOREIGN KEY ("AnhaengerID") REFERENCES "Anhaenger"("AnhaengerID")
)





create table "mitarbeiter"(
	"mitarbeiterIID"				int Primary KEY identity,
	"geburtsTag" int				not null check ("geburtsTag" > 0 AND "geburtsTag" < 32),
	"geburtsMonat" int				not null check ("geburtsMonat" > 0 AND "geburtsMonat" < 13),
	"geburtsJahr" int				not null check ("geburtsJahr" > 0 AND "geburtsJahr" < 13),
	"wohnort" int					not null check ("wohnort" > 9999 and "wohnort" < 100000),
	"verdienst" int					not null check ("verdienst" > 0),
	"abteilung" varchar(42)			not null,
	"rang" varchar(42)				not null,
	"artdertaetigkeit" varchar(255) not null
)


create table "sondertransport"(
	"AuftragIID" int				Primary KEY identity,
	"groesse" int					not null check ("groesse" > 0),
	"gewicht" int					not null check ("gewicht" > 0),
	"genehmigungen" char(42)		not null,
	"zertifikate" char(42)			not null
)
create table "auftrag"(
	"AuftragID" int Primary KEY identity,
	"auftraggeber" char(42)			not null,
	"kosten" int					not null,
	"gewinn" int					not null,
	"haeufigkeit" char(42)			not null check ("haeufigkeit" > 0),
	"anzahllkw" char(42)			not null,
	"region" char(42)				not null,
	"vertragsersteller" char(42)	not null,
	FOREIGN KEY ("AuftragID") REFERENCES "Sondertransport"("AuftragIID")
	)



create table Logistikunternehmen (
	"UnternehmenID" int PRIMARY KEY identity,
	"fahrzeugID" int				not null check ("fahrzeugID" > 0),
	"lagerhalleID" int				not null check ("lagerhalleID" > 0),
	"buerogebaeudeID" int			not null check ("buerogebaeudeID" > 0),
	"auftragID" int					not null check ("auftragID" > 0),
	"mitarbeiterID" int				not null check ("mitarbeiterID" > 0),
	FOREIGN KEY ("LagerhalleID") REFERENCES "Lagerhalle"("LagerhalleID"),
	FOREIGN KEY ("FahrzeugID") REFERENCES "Fahrzeug"("FahrzeugID"),
	FOREIGN KEY ("buerogebaeudeID") REFERENCES "Buerogebaeude"("buerogebaeudeID"),
	FOREIGN KEY ("AuftragID") REFERENCES "Auftrag"("AuftragID"),
	FOREIGN KEY ("mitarbeiterID") REFERENCES "mitarbeiter"("mitarbeiterIID")
)







