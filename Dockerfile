# Newer base image (buster पुराना हो गया)
FROM python:3.10-slim-bullseye

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy dependencies and install
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . /app

# Start your bot
CMD ["python", "bot.py"]
