FROM alpine:3.15

# Install dependencies
RUN apk update && apk add python2 python2-dev build-base gcompat bash curl

# Set working directory (Pterodactyl convention)
WORKDIR /home/container

# Copy BombSquad server files
COPY . /home/container

# Make server scripts executable
RUN chmod +x bombsquad_server bombsquad_headless

# Default user
USER container

# Default entrypoint (Pterodactyl will override)
ENTRYPOINT ["./bombsquad_server"]
