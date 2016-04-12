--Creates film artist table
--Functional Dependencies fid --> name, address, spouseName
CREATE TABLE FilmArtists (
  fid integer PRIMARY KEY NOT NULL,
  name varchar(40),
  address varchar(40),
  spouseName varchar(40)
);

--Creates Director table
--Functional Dependencies did --> fid, filmSchool, directorsGuildAnniDat, favLensMaker
CREATE TABLE Director (
  did integer PRIMARY KEY NOT NULL,
  fid integer FOREIGN KEY REFERENCES FilmArtists [fid],
  filmSchool varchar(40),
  directorsGuildAnniDate date,
  favLensMaker varchar(40)
);

--Creates Cast table
--Functional Dependencies cid --> fid, birthDate, hairColor, eyeColor, height, weight, favoriteColor, screenActorsGuildAnniDate
CREATE TABLE MovieCast (
  cid integer PRIMARY KEY NOT NULL,
  fid integer FOREIGN KEY REFERENCES FilmArtists [fid],
  birthDate date,
  hairColor varchar(15),
  eyeColor varchar(15),
  height integer,
  weight integer,
  favoriteColor varchar(15),
  screenActorsGuildAnniDate date
);

--Creates Movies table
--Functional Dependencies MPAA --> did, cid, title, yearReleased, domesticOfficeSales, foreignOfficeSales, DVDblueRaySales
CREATE TABLE Movies (
  MPAA integer PRIMARY KEY NOT NULL,
  did integer FOREIGN KEY REFERENCES Director [did],
  cid integer FOREIGN KEY REFERENCES MovieCast [cid],
  title varchar(40),
  yearReleased integer,
  domesticOfficeSales money,
  foreignOfficeSales money,
  DVDblueRaySales money
);

--4. Write a query to show all the directors with whom actor “Keanu Reeves” has worked.
SELECT name.fa 
FROM FilmArtists fa, Director d, Movies m, MovieCast c
WHERE fid.fa = fid.d 
AND did.d = did.m
AND cid.m = cid.c 
AND fid.c = fid.fa 
AND name.fa = "Keanu Reeves";