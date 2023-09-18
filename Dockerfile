# Use the golang alpine image
FROM golang:alpine3.18

# Install the make utility
RUN apk --no-cache add make

# Set the working directory inside the container to /app/
WORKDIR /app/

# Copy the contents of the current directory to /app/ in the container
COPY . /app/

# Set environment variables for the application
ENV DEMO_APP_ADDR=your_app_address \
    DEMO_REDIS_ADDR=your_redis_address

# Build the Go application using
RUN make build

# Default command to run when the container starts
CMD [ "make", "run" ]
