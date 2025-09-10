FROM node:20-alpine

WORKDIR /app

# Speed up & harden npm network behavior to avoid flakiness if you later add deps
ENV NPM_CONFIG_FETCH_RETRIES=5 \
    NPM_CONFIG_FETCH_RETRY_FACTOR=2 \
    NPM_CONFIG_FETCH_RETRY_MINTIMEOUT=20000 \
    NPM_CONFIG_FETCH_RETRY_MAXTIMEOUT=120000 \
    NPM_CONFIG_REGISTRY=https://registry.npmjs.org/

# (Optional) pre-install npx cache by touching a dummy install; comment out if you want
# RUN npm -v && node -v

# Expose the port App Platform maps (PORT is injected at runtime)
EXPOSE 8080

# Run the dev server straight via npx, so no global install during build
CMD ["npx", "--yes", "inngest@3.11.0", "dev", "--port", "${PORT:-8080}", "--no-open"]
