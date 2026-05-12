FROM        node:22-alpine
USER        node
WORKDIR     /home/node
COPY        node_modules/ node_modules/
COPY        package.json server.js ./
ENTRYPOINT  ["node", "server.js"]
