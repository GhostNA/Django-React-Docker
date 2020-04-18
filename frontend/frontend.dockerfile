# Stage 0, "build-stage", based on Node.js, to build and compile the frontend
FROM tiangolo/node-frontend:10 as build-stage

WORKDIR /app

COPY app/package*.json /app/

RUN npm install

COPY ./app/ /app/

RUN npm run build