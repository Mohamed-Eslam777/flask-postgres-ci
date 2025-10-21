FROM python:3.12-slim

# تعيين مجلد العمل داخل الحاوية
WORKDIR /app

# تحديث وتثبيت curl (مطلوب للاختبار في CI)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# نسخ ملف المتطلبات وتثبيتها
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# نسخ ملف التطبيق إلى مجلد العمل
COPY app.py .

# تحديد المنفذ الذي سيستمع إليه التطبيق
EXPOSE 5000

# الأمر الذي سيتم تنفيذه عند تشغيل الحاوية
CMD ["python", "app.py"]
