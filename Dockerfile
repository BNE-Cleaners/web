FROM node:20-alpine
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm@10.32.1
RUN pnpm install --frozen-lockfile
COPY . .
RUN pnpm run build
RUN npm install -g serve
CMD ["serve", "-s", "dist", "-l", "3000"]