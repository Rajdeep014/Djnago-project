# Use the official Python image from the Docker Hub
FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    pkg-config \
    libmariadb-dev-compat \
    build-essential

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies inside the container
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Set environment variable to tell Django to not create .pyc files
ENV PYTHONUNBUFFERED=1

# Expose port 8000 (default for Django)
EXPOSE 8000

# Command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
