# Use an official node LTS version from Docker Hub
FROM node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# Use wildcard match to copy package-lock.json file as well
COPY package*.json ./

# Install any pre-reqs
RUN npm install

# Copy the application source
RUN mkdir -p src
COPY src/* src/
RUN mkdir -p public
COPY public/* public/
RUN mkdir -p jenkins/scripts
COPY jenkins/* jenkins/

# Command to run at launch
CMD ["npm", "start"]
