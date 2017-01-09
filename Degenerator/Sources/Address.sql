CREATE TABLE Address (
    id BIGINT UNSIGNED PRIMARY KEY AUTO INCREMENT,
    streetname TEXT,
    streetnumber TEXT,
    apartment TEXT,
    city TEXT,
    postalcode TEXT,
    country TEXT,
    state TEXT,
    district TEXT,
    organisation TEXT,
    PostalCode_id INT
);
