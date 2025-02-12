FROM golang:1.23.6

WORKDIR /app

RUN go install github.com/air-verse/air@latest

COPY go.mod go.sum ./

RUN go mod download

EXPOSE 8080 40000

CMD ["air", "-c", ".air.toml"]