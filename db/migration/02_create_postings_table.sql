CREATE TABLE postings(id SERIAL PRIMARY KEY, title VARCHAR(140), description VARCHAR(500), price INT, date TIMESTAMP, user_id INTEGER REFERENCES users(id) ON DELETE CASCADE, date_from DATE);
