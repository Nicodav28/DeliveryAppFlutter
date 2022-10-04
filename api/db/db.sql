CREATE TABLE users(
	id  BIGSERIAL PRIMARY KEY,
	email VARCHAR(255) NOT NULL UNIQUE,
	namer VARCHAR(255) NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	phone VARCHAR(80) NOT NULL UNIQUE
	image VARCHAR(255) NULL,
	password VARCHAR(255) NOT NULL,
	is_available BOOLEAN NULL,
	session_token VARCHAR(255) NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL
);

INSERT INTO users(email, namer, lastname, phone, password, created_at, updated_at) 
VALUES ('esteveznicolas0@gmail.com', 'Nicolas David', 'Estevez Tovar', '3507156518', 'Prueba123.', '2022-10-04', '2022-10-04');

SELECT * FROM users;