# Use an official Python image as the base, slim version for smaller size
FROM python:3.13-slim

# Set environment variables
# - PYTHONDONTWRITEBYTECODE: prevents Python from writing .pyc files to disk
# - PYTHONUNBUFFERED: ensures output is logged directly (e.g., to Docker logs)
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Install system-level dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    # PostgreSQL client library headers (needed by psycopg2)
    libpq-dev \
    # Python headers (needed for compiling packages)
    python3-dev \
    # C compiler (used for building Python extensions)
    gcc \
    # Common build tools (make, dpkg-dev, etc.)
    build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy only requirements file first to leverage Docker cache
COPY requirements/requirements.txt ./requirements/requirements.txt

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements/requirements.txt

# Install uWSGI (for production WSGI server)
RUN pip install --no-cache-dir uwsgi

# Copy the entire application source code into the container
COPY . .

# Make entrypoint script executable
RUN chmod +x /app/scripts/entrypoint.sh

# Expose the application port
EXPOSE 8000

# Define the default command to run the container
ENTRYPOINT ["/app/scripts/entrypoint.sh"]
