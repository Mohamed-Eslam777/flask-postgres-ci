
# تعيين مجلد العمل داخل الحاوية
WORKDIR /app

# تثبيت التبعيات الأساسية و curl (للاختبار)
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# نسخ ملف المتطلبات وتثبيتها
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# نسخ ملف التطبيق إلى مجلد العمل
COPY app.py .

# تحديد المنفذ الذي سيستمع إليه التطبيق
EXPOSE 5000

# الأمر الذي سيتم تنفيذه عند تشغيل الحاوية
CMD ["python", "app.py"]
