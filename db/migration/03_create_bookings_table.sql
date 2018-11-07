CREATE TABLE bookings(id SERIAL PRIMARY KEY, posting_id INTEGER REFERENCES postings(id) ON DELETE CASCADE, owner_id INTEGER REFERENCES users(id) ON DELETE CASCADE, user_id INTEGER REFERENCES users(id) ON DELETE CASCADE), status VARCHAR(60);
