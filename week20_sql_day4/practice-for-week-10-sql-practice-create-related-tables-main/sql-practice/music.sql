-- This ensures that SQLite enforces FOREIGN KEY constraints
PRAGMA foreign_keys = 1;
DROP TABLE IF EXISTS instruments;
DROP TABLE IF EXISTS musicians;
DROP TABLE IF EXISTS bands;
DROP TABLE IF EXISTS musicians_instruments;

CREATE TABLE bands (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(100)
);
CREATE TABLE musicians (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100),
  bands_id VARCHAR(100),
  FOREIGN KEY (bands_id) REFERENCES bands(id) on DELETE CASCADE
);
CREATE TABLE instruments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type VARCHAR(100) NOT NULL
);

INSERT INTO bands (name)
VALUES
('Jam Packed');

INSERT INTO musicians (first_name, last_name, bands_id)
VALUES
('Olive', 'EMSBACH', 1),
('Cory', 'Baker', 1);

CREATE TABLE musicians_instruments (
  musician_id INTEGER,
  instrument_id INTEGER,
  FOREIGN KEY (musician_id) REFERENCES musicians(id)
  FOREIGN KEY (instrument_id) REFERENCES instruments(id)
);
