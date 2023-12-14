# Use an official Python runtime as a parent image
FROM buildpack-deps:bookworm

# Set the working directory in the container
WORKDIR /app

# Copy only the necessary files and directories into the container
COPY app.py forms.py models.py requirements.txt /app/
COPY static /app/static/
COPY templates /app/templates/

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 8080

# Run app.py when the container launches
CMD ["python", "app.py"]
