CREATE OR REPLACE FUNCTION get_product_revenue(
    p_product_id INT,
    p_start_date DATE,
    p_end_date DATE
) RETURNS DECIMAL(10,2) AS $$
DECLARE
    v_total_revenue DECIMAL(10,2) := 0;
BEGIN
    IF p_start_date > p_end_date THEN
        RAISE EXCEPTION 'Start date must be before end date';
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM products
        WHERE product_id = p_product_id
    ) THEN
        RAISE EXCEPTION 'Product with id % not found', p_product_id;
    END IF;

    SELECT INTO v_total_revenue SUM(od.line_total)
    FROM order_details od
    JOIN orders o ON od.order_id = o.order_id
    WHERE od.product_id = p_product_id
    AND o.order_date_start BETWEEN p_start_date AND p_end_date;

    IF v_total_revenue IS NULL THEN
        v_total_revenue := 0;
    END IF;

    RETURN v_total_revenue;
END;
$$ LANGUAGE plpgsql;