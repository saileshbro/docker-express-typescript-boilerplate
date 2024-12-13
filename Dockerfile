FROM node:23.3.0-bookworm-slim

# Add package file
COPY package*.json ./

# Install deps
RUN npm i

# Copy source
COPY src ./src
COPY tsconfig.json ./tsconfig.json
COPY openapi.json ./openapi.json

# Build dist
RUN npm run build

# Expose port 3000
EXPOSE 3000

CMD npm run start
