FROM python:3.10-slim

# Set environment variables
ENV LABEL_STUDIO_PORT=8080 \
    LABEL_STUDIO_HOST=0.0.0.0

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential gcc git curl libmagic1 && \
    pip install --upgrade pip

# Install Label Studio
RUN pip install label-studio

# Expose port
EXPOSE 8080

# Run Label Studio on start
CMD ["label-studio", "start", "--host", "0.0.0.0", "--port", "8080"]
