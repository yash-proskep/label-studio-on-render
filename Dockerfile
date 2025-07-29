FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential gcc git curl libmagic1 && \
    pip install --upgrade pip

RUN pip install label-studio

ENV PORT=10000

EXPOSE ${PORT}

CMD ["sh", "-c", "label-studio start --host 0.0.0.0 --port $PORT"]
