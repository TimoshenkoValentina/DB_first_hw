create table if not exists MusicCategories(
	id SERIAL primary key,
	genre VARCHAR(60) not null
);

create table if not exists Musicians(
	id SERIAL primary key,
	musician_name VARCHAR(60) not null
);

create table if not exists Album(
	id SERIAL primary key,
	album_name VARCHAR(60) not null,
	release_year SMALLINT not null
);

create table if not exists Track(
	id INTEGER primary key REFERENCES Album(id),
	track_name VARCHAR(60) not null,
	track_length TIME not null
);

create table if not exists Collection(
	id SERIAL primary key,
	collection_name VARCHAR(60) not null,
	release_year SMALLINT not null
);

create table if not exists GenresAndMusicians(
	id SERIAL PRIMARY KEY,
	musician_id INTEGER NOT NULL REFERENCES Musicians(id),
	genre_id INTEGER NOT NULL REFERENCES MusicCategories(id)
);

create table if not exists MusiciansAndAlbums(
	id SERIAL PRIMARY KEY,
	musician_id INTEGER NOT NULL REFERENCES Musicians(id),
	album_id INTEGER NOT NULL REFERENCES Album(id)
);


create table if not exists CollectionsAndTracks(
	id SERIAL PRIMARY KEY,
	track_id INTEGER NOT NULL REFERENCES Track(id),
	collection_id INTEGER NOT NULL REFERENCES Collection(id)
);