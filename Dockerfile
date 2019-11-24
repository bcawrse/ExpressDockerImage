# Filename: Dockerfile
# Image used to start this image.
FROM node:10-alpine
# Working directory within the image.
WORKDIR /usr/src/app
# Copy package.json files to the image separately from source code so 
# it's a separate layer and won't have to be done everytime we build 
# the image; only when the package.json changes.
# Takes advantage of the Docker Cache for faster dev time.
COPY docker-app/package*.json ./
# Run npm install after copying the package.json files.
RUN npm install
# Copy everything else.
#COPY . .
COPY docker-app/ .
# Which port to expose for this image.
EXPOSE 3000
# CMD tells image what command to run at start. CMD ["Command", "Argument1", "Argument2", ..]
CMD ["npm", "start"]
