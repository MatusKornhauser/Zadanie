-- Create tables
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date_start DATE,
    order_date_end DATE
);

CREATE TABLE order_details (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders,
    product_id INT REFERENCES products,
    quantity INT,
    line_total DECIMAL(10,2)
);

-- You would add PL/pgSQL function