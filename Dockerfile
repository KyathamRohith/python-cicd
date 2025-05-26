# Use official Python image
FROM python:3.9-slim

# Copy app.py into the container
COPY app.py /app/app.py

# Set working directory
WORKDIR /app

# Command to run the script
CMD ["python", "app.py"]
