import os
from flask import Flask
import psycopg2

app = Flask(__name__)

# تفاصيل الاتصال بقاعدة البيانات (مأخوذة من أسماء خدمات Docker Compose)
DB_HOST = "db" 
DB_NAME = "my_app_db"
DB_USER = "devuser"
DB_PASS = "devpassword"

@app.route('/')
def hello_world():
    conn = None
    try:
        # محاولة الاتصال بـ PostgreSQL باستخدام اسم خدمة Docker ("db")
        conn = psycopg2.connect(host=DB_HOST, database=DB_NAME, user=DB_USER, password=DB_PASS)
        cur = conn.cursor()
        cur.execute("SELECT 1")
        return "<h1>Hello from Flask!</h1><p>Database connection established successfully! (PostgreSQL)</p>"
    except Exception as e:
        return f"<h1>Hello from Flask!</h1><p>Error connecting to database: {e}</p>"
    finally:
        if conn:
            conn.close()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

