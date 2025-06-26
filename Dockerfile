FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    python3-dev \
    gcc \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY requirements/requirements.txt ./requirements/requirements.txt

RUN pip install --no-cache-dir -r requirements/requirements.txt

# Install uwsgi
# RUN pip install uwsgi --no-cache-dir

# Copy application code
COPY . .

EXPOSE 8000

