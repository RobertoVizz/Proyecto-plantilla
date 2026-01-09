CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    precio NUMERIC(10, 2) NOT NULL CHECK (precio >= 0),
    stock INTEGER NOT NULL CHECK (stock >= 0),
    id_categoria INTEGER,
    CONSTRAINT fk_id_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias (id_categoria)
        ON DELETE SET NULL
);

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    direccion VARCHAR(200),
    telefono VARCHAR(20)
    
);

CREATE TABLE ordenes (
    id_orden SERIAL PRIMARY KEY,
    tipo_orden VARCHAR(100) NOT NULL UNIQUE,
    id_cliente INTEGER,
    CONSTRAINT fk_id_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente)
        ON DELETE SET NULL
);
