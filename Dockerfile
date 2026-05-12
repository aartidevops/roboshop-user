# Build stage — install dependencies inside Docker
# Previously expected pre-built node_modules from local machine
# which breaks in CI. npm install runs inside the image instead.
FROM        node:22-alpine AS builder
WORKDIR     /home/node
COPY        package.json ./
RUN         npm install --production

# Runtime stage — only copy what's needed
FROM        node:22-alpine
USER        node
WORKDIR     /home/node
COPY        --from=builder /home/node/node_modules/ node_modules/
COPY        package.json server.js ./
ENTRYPOINT  ["node", "server.js"]
