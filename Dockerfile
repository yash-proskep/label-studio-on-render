FROM python:3.10-slim

# Environment settings for Label Studio
ENV LABEL_STUDIO_PORT=10000 \
    LABEL_STUDIO_HOST=0.0.0.0

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential gcc git curl libmagic1 && \
    pip install --upgrade pip

# Install Label Studio
RUN pip install label-studio

# Expose the correct port
EXPOSE 10000

# Set working directory
WORKDIR /label-studio

# Start Label Studio using the port Render expects
CMD ["label-studio", "start", "--host", "0.0.0.0", "--port", "10000"]
