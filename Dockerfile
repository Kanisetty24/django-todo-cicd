# Use a specific Python version that supports distutils
FROM python:3.11-slim

# Set the working directory
WORKDIR /data

# Install system dependencies and python3-distutils
RUN apt-get update && apt-get install -y python3-distutils python3-venv

# Install Django
RUN pip install --upgrade pip && pip install django==3.2

# Copy project files into the container
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose port 8000 for the application
EXPOSE 8000

# Command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

