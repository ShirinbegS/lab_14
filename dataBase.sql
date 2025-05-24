erDiagram
    CUSTOMERS ||--o{ ORDERS : places
    ORDERS ||--|{ ORDER_ITEMS : contains
    PRODUCTS ||--o{ ORDER_ITEMS : includes

    CUSTOMERS {
        int customer_id PK
        varchar(100) name
        varchar(200) address
        varchar(20) phone
        varchar(100) email
    }

    ORDERS {
        int order_id PK
        int customer_id FK
        date order_date
        varchar(20) status
        decimal(10,2) total
    }

    PRODUCTS {
        int product_id PK
        varchar(100) name
        text description
        decimal(10,2) price
        int stock_quantity
    }

    ORDER_ITEMS {
        int order_item_id PK
        int order_id FK
        int product_id FK
        int quantity
        decimal(10,2) unit_price
    }