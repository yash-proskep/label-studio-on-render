FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential gcc git curl libmagic1 && \
    pip install --upgrade pip

# Install Label Studio
RUN pip install label-studio

# Let Render set the port dynamically via env variable
ENV PORT=10000

# Expose the port (Render requires this to match ENV PORT)
EXPOSE ${PORT}

# Start Label Studio using the PORT env variable Render provides
CMD ["sh", "-c", "label-studio start --host 0.0.0.0 --port $PORT"]
