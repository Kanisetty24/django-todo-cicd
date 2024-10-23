FROM python:3

# Install system dependencies
RUN apt-get update && apt-get install -y python3-distutils

# Set the working directory
WORKDIR /data

# Install Django
RUN pip install django==3.2

# Copy project files into the container
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose port 8000 for the application
EXPOSE 8000

# Command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

