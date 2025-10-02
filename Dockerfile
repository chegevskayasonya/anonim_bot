FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY вимоги.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

EXPOSE 8080

ENV WEBAPP_HOST=0.0.0.0 \
    WEBAPP_PORT=8080 \
    WEBHOOK_URL=""

CMD ["python", "anonim.py"]
