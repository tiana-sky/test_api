# Мы содаем Докер образ для Python приложения
# в этот образ мы положим Питон, установим зависимости и скопируем файлы приложения
# requirements.txt, model.pkl, 
FROM python:3.11-slim

# Рабочая директория
WORKDIR /app

# Установка зависимостей
RUN apt -get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Копирование файлов приложения
# берем /requirements.txt и кладем в /app
copy ./requirements.txt /app
RUN pip3 install -r requirements.txt

# Копирование остальной код
COPY . /app


CMD ["python3", "app_api.py"]
