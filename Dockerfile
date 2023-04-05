# Set the base image to Ubuntu 20.04
FROM ubuntu:20.04

# Update the package manager and install dependencies
RUN apt-get update && \
    apt-get install -y \
    gcc \
    make \
    mpich \
    libmpich-dev

# Set the working directory
WORKDIR /app

# Copy the source code to the container
COPY main.c .

# Compile the code with MPI support
RUN mpicc -o main main.c

# Set the entrypoint to run the compiled code
ENTRYPOINT ["mpirun", "-np", "4", "/app/main"]
