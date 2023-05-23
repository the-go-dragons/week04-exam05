/* Target: The only requirement of this question is to create and send the table of
 the shape mentioned at the beginning of the question after normalization,
 using only DDL statements. You must continue normalization until none of
 the dependencies are violated. It is not allowed to be NULL in any of the columns.*/
CREATE TABLE capacities (
    level int NOT NULL,
    capacity bigint NOT NULL,
    PRIMARY KEY (level)
);

CREATE TABLE markets (
    m_id bigint AUTO_INCREMENT NOT NULL,
    m_name varchar(255) NOT NULL,
    m_address text NOT NULL,
    m_score bigint NOT NULL,
    level int NOT NULL,
    PRIMARY KEY (m_id),
    FOREIGN KEY (level) REFERENCES capacities(level)
);

CREATE TABLE products (
    p_id bigint AUTO_INCREMENT NOT NULL,
    p_name varchar(255) NOT NULL,
    p_weight bigint NOT NULL,
    PRIMARY KEY (p_id)
);

CREATE TABLE prices (
    price bigint NOT NULL,
    p_id bigint NOT NULL,
    m_id bigint NOT NULL,
    PRIMARY KEY (m_id, p_id),
    FOREIGN KEY (p_id) REFERENCES products(p_id),
    FOREIGN KEY (m_id) REFERENCES markets (m_id)
);
