DROP TABLE IF EXISTS property;

CREATE TABLE property (
  id SERIAL4 PRIMARY KEY,
  address VARCHAR(255),
  value INT8,
  year_built INT8,
  buy_let_status VARCHAR(255)
);
