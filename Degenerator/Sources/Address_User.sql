CREATE TABLE Address_User {
	User_id LONG
	FOREIGN KEY(User_id) REFERENCES User(id) ON UPDATE CASCADE ON DELETE CASCADE,
	Address_id LONG
	FOREIGN KEY(Address_id) REFERENCES Address(id) ON UPDATE CASCADE ON DELETE CASCADE
}