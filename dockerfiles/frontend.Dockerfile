FROM bitnami/git:2.43.0 as stage1

ARG REPO_LINK
ARG REPO_BRANCH

ENV BUILD_HOME=/app

WORKDIR $BUILD_HOME

RUN git clone --branch $REPO_BRANCH $REPO_LINK .


FROM node:20.9.0

WORKDIR /app

COPY --from=stage1 /app/package.json .

RUN ["npm", "i"]

COPY --from=stage1 /app/. .

CMD ["npm", "run", "start"]
