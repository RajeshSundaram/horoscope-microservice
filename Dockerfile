FROM node:latest AS dependency_builder
WORKDIR /usr/package
COPY ./tamil-astro-package/package*.json ./
RUN npm ci
COPY ./tamil-astro-package/ ./
RUN npm run compile
RUN npm pack

FROM node:current-slim
EXPOSE 8080
ENV PORT 8080
WORKDIR /usr/app
COPY --from=dependency_builder /usr/package/tamil-astro*.tgz ./
COPY . .
RUN npm i tamil-astro*.tgz
RUN npm ci
RUN rm -rf tamil-astro-package
CMD npm run start