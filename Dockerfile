FROM node:20-alpine

WORKDIR /app

# Install Inngest CLI
RUN npm install -g inngest@3.11.0

# Copy minimal package.json (optional, only if you want local deps)
COPY package.json ./

# App Platform injects PORT; default to 8080
EXPOSE 8080

# Run the dev server directly
CMD ["inngest", "dev", "--port", "${PORT:-8080}", "--no-open"]
