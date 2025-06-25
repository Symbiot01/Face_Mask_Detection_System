FROM python:3.9-slim

# Enable non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxrender1 \
    libxext6 \
    python3-opencv \
    v4l-utils \
    && rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /app

# Copy files
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

# Run the script
CMD ["python", "detect_mask_video.py"]
