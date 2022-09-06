# syntax=docker/dockerfile:1

## Build
FROM golang:1.16-buster AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /golang-simple-app

## Deploy
FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /golang-simple-app /golang-simple-app

EXPOSE 8080

USER devops:devops

ENTRYPOINT ["/golang-simple-app"]
