# Use a base image
FROM alpine:latest

# Install SSH and IPUtils-Ping packages
RUN apk update && apk add openssh iputils nano openrc tzdata ansible openjdk21 git

# Set the timezone to Europe/Amsterdam
ENV TZ=Europe/Amsterdam

# Generate host keys for SSH
RUN ssh-keygen -A

# Copy the script to the container
COPY script.sh /mnt/script.sh

# Add execute permissions to the script
RUN chmod +x /mnt/script.sh

# Run the script when the container starts
RUN "/mnt/script.sh"

# Remove the default message of the day
RUN rm /etc/motd

# Copy the custom message of the day script
COPY motd.sh /etc/profile.d/motd.sh

# Add execute permissions to the custom message of the day script
RUN chmod +x /etc/profile.d/motd.sh

# Expose port 2222
EXPOSE 2222

# Start the SSH daemon
CMD ["/usr/sbin/sshd", "-D"]
