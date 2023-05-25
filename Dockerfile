FROM ubuntu:latest

# Update package lists
RUN apt-get update

# Install primary dependencies
RUN apt-get install -y \
    build-essential \
    python3-dev \
    python3-pip \
    git \
    curl \
    wget

# Additional instructions if needed

# Set the working directory
WORKDIR /app

# Copy your application files to the container
COPY . /app
COPY entrypoint.sh /entrypoint.sh

# Compile & Prepare Vicuna model
RUN echo "Compiling model code" && cd llama.cpp && make -j
RUN echo "Copying source model files" && cp -r vicuna-13B-model/* llama.cpp/models/

# Make the shell script executable
RUN chmod +x /entrypoint.sh

# Set the shell script as the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
