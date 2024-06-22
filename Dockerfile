# Use the specific version of node as the base image
FROM node:16

# Install necessary tools
RUN apt-get update && apt-get install -y wget gnupg

# Install OpenJDK 17 manually
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - && \
    echo "deb https://adoptopenjdk.jfrog.io/adoptopenjdk/deb buster main" | tee /etc/apt/sources.list.d/adoptopenjdk.list && \
    apt-get update && \
    apt-get install -y adoptopenjdk-17-hotspot && \
    apt-get clean;

# Set the working directory in the container to /usr/src/app
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages specified in package.json
RUN npm install

# Make port 80 available to the world outside this container
EXPOSE 50117

# Define environment variable, optional based on your app's need
ENV NAME World

# Run index.js when the container launches
CMD ["java", "-jar", "Lavalink.jar"]
