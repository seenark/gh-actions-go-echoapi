# Build stage
FROM golang:1.25-alpine AS builder

WORKDIR /app

# Copy go mod files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy source code
COPY . .

# Build static binary
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o main .

# Final stage - scratch for smallest possible image
FROM scratch

# Copy the binary
COPY --from=builder /app/main /main

# Expose port
EXPOSE 1323

# Run the application
CMD ["/main"]

