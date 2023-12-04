CREATE TABLE IF NOT EXISTS NYC_zipcodes
(
    id serial PRIMARY KEY,
    zipcode TEXT, 
    geometry geometry(Polygon, 4326),
    CONSTRAINT unique_zipcode UNIQUE (zipcode)
);

CREATE TABLE IF NOT EXISTS NYC_complaints
(
    id INTEGER PRIMARY KEY, 
    created_date date,
    zipcode TEXT,
    complaint_type TEXT,
    location geometry(Point, 4326),
    CONSTRAINT zip_code
        FOREIGN KEY(zipcode)
            REFERENCES NYC_zipcodes(zipcode)
);

CREATE TABLE IF NOT EXISTS NYC_trees
(
    id INTEGER PRIMARY KEY, 
    created_date date,
    zipcode TEXT,
    location geometry,
    species TEXT,
    health TEXT,
    status TEXT,
    CONSTRAINT zip_code
        FOREIGN KEY(zipcode)
            REFERENCES NYC_zipcodes(zipcode)
);

CREATE TABLE IF NOT EXISTS NYC_rents
(
    id serial PRIMARY KEY,
    zipcode TEXT,
    rents REAL[],  
    CONSTRAINT zip_code
        FOREIGN KEY(zipcode)
            REFERENCES NYC_zipcodes(zipcode)
);
CREATE INDEX IF NOT EXISTS zip_geo ON NYC_zipcodes USING GIST(geometry);
CREATE INDEX IF NOT EXISTS complaints_location ON NYC_complaints USING GIST(location);
CREATE INDEX IF NOT EXISTS tree_location ON NYC_trees USING GIST(location);
