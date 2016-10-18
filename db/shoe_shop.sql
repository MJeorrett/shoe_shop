DROP TABLE orders;


CREATE TABLE orders(
  id serial4 PRIMARY KEY,
  address VARCHAR(255),
  quantity INT2,
  size INT2
);
