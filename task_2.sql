#!/usr/bin/env python3
import mysql.connector

def create_tables():
    try:
        # Connect to MySQL server (adjust credentials)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="your_password",
            database="alx_book_store"
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # SQL queries to create tables
            create_authors = """
            CREATE TABLE IF NOT EXISTS Authors (
                author_id INT AUTO_INCREMENT PRIMARY KEY,
                author_name VARCHAR(215) NOT NULL
            )
            """

            create_books = """
            CREATE TABLE IF NOT EXISTS Books (
                book_id INT AUTO_INCREMENT PRIMARY KEY,
                title VARCHAR(130) NOT NULL,
                author_id INT,
                price DOUBLE,
                publication_date DATE,
                FOREIGN KEY (author_id) REFERENCES Authors(author_id)
            )
            """

            create_customers = """
            CREATE TABLE IF NOT EXISTS Customers (
                customer_id INT AUTO_INCREMENT PRIMARY KEY,
                customer_name VARCHAR(215) NOT NULL,
                email VARCHAR(215),
                address TEXT
            )
            """

            create_orders = """
            CREATE TABLE IF NOT EXISTS Orders (
                order_id INT AUTO_INCREMENT PRIMARY KEY,
                customer_id INT,
                order_date DATE,
                FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
            )
            """

            create_order_details = """
            CREATE TABLE IF NOT EXISTS Order_Details (
                orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
                order_id INT,
                book_id INT,
                quantity DOUBLE,
                FOREIGN KEY (order_id) REFERENCES Orders(order_id),
                FOREIGN KEY (book_id) REFERENCES Books(book_id)
            )
            """

            # Execute queries
            cursor.execute(create_authors)
            cursor.execute(create_books)
            cursor.execute(create_customers)
            cursor.execute(create_orders)
            cursor.execute(create_order_details)

            print("All tables created successfully in 'alx_book_store'!")

    except mysql.connector.Error as e:
        print(f"Error: {e}")

    finally:
        if 'cursor' in locals() and cursor:
            cursor.close()
        if 'connection' in locals() and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    create_tables()

