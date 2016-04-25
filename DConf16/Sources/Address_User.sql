CREATE TABLE Address_User {
	id LONG PRIMARY KEY AUTO INCREMENT,
	User_id LONG
	FOREIGN KEY(User_id) REFERENCES User(id),
	Address_id LONG
	FOREIGN KEY(Address_id) REFERENCES Address(id)
)
