# Use the specific version of node as the base image
FROM node:16

# Install OpenJDK-11
RUN apt-get update && \
    apt-get install -y openjdk-11-jre && \
    apt-get clean;

# Set the working directory in the container to /usr/src/app
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages specified in package.json
RUN npm install

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable, optional based on your app's need
ENV NAME World

# Run index.js when the container launches
CMD ["node", "index.js"]
