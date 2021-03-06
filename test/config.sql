CREATE TABLE log(id INTEGER PRIMARY KEY,
    who TEXT,
    what TEXT,
    location TEXT,
    happened_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    how TEXT,
    why TEXT);
CREATE TABLE server (id INTEGER PRIMARY KEY,
    uuid TEXT,
    access_log TEXT,
    error_log TEXT,
    chroot TEXT DEFAULT '/var/www',
    pid_File TEXT,
    default_host INTEGER,
    name TEXT DEFAULT '',
    port INTEGER);
CREATE TABLE host (id INTEGER PRIMARY KEY, 
    server_id INTEGER,
    maintenance BOOLEAN DEFAULT 0,
    name TEXT,
    matching TEXT);
CREATE TABLE handler (id INTEGER PRIMARY KEY,
    send_spec TEXT, 
    send_ident TEXT,
    recv_spec TEXT,
    recv_ident TEXT,
   raw_payload INTEGER DEFAULT 0);
CREATE TABLE proxy (id INTEGER PRIMARY KEY,
    addr TEXT,
    port INTEGER);
CREATE TABLE directory (id INTEGER PRIMARY KEY,
    base TEXT, index_file TEXT, default_ctype TEXT);
CREATE TABLE route (id INTEGER PRIMARY KEY,
    path TEXT,
    reversed BOOLEAN DEFAULT 0,
    host_id INTEGER,
    target_id INTEGER,
    target_type TEXT, solidrails_container_id integer);
CREATE TABLE setting (id INTEGER PRIMARY KEY, key TEXT, value TEXT);
CREATE TABLE statistic (id SERIAL, 
    other_type TEXT,
    other_id INTEGER,
    name text,
    sum REAL,
    sumsq REAL,
    n INTEGER,
    min REAL,
    max REAL,
    mean REAL,
    sd REAL,
    primary key (other_type, other_id, name));
CREATE TABLE mimetype (id INTEGER PRIMARY KEY, mimetype TEXT, extension TEXT);
