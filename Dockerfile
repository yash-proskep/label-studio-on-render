FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential gcc git curl libmagic1 && \
    pip install --upgrade pip

RUN pip install label-studio

# Use default settings, no custom override
ENV PORT=10000
ENV USE_ENFORCE_CSRF_CHECKS=false

EXPOSE ${PORT}

CMD ["sh", "-c", "label-studio start --host 0.0.0.0 --port $PORT"]
