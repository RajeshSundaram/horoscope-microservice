FROM node:latest AS dependency_builder
WORKDIR /usr/package
COPY . .
RUN /bin/bash build-package.sh
RUN mv ./tamil-astro-package/tamil-astro.tgz .

FROM node:current-slim
EXPOSE 8080
ENV PORT 8080
WORKDIR /usr/app
COPY --from=dependency_builder /usr/package/tamil-astro.tgz .
COPY . .
RUN npm ci --ignore-scripts
RUN npm i tamil-astro.tgz --no-save
RUN rm -rf tamil-astro-package
CMD npm run start