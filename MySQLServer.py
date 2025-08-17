#!/usr/bin/env python3
import mysql.connector
'''from mysql.connector import Error'''

def create_database():
    try:
        # Connect to MySQL server (adjust host, user, password as needed)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="my_password"
        )

        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as e:
        print(f"Error: Unable to connect or create database. Details: {e}")

    finally:
        if 'cursor' in locals() and cursor:
            cursor.close()
        if 'connection' in locals() and connection.is_connected():
            connection.close()
            # print("MySQL connection closed.")  # optional debug

if __name__ == "__main__":
    create_database()

