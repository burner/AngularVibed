CREATE TABLE PostelCode {
	id LONG PRIMARY KEY AUTO INCREMENT,
	code LONG,
	Address_id LONG
	FOREIGN KEY(Address_id) REFERENCES Address(id)
);
