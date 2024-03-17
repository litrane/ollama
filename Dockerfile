# Use the base image provided by ollama/ollama
FROM ollama/ollama

# Run ollama pull command (assuming this is a valid command for the base image)
COPY .ollama /root/.ollama


# Update package lists, install software requirements
RUN apt-get update && apt-get install -y \
    git \
    python3-pip \
    curl

# Clone the open-webui repository
RUN git clone https://github.com/open-webui/open-webui.git

# Change directory to open-webui
WORKDIR /open-webui

SHELL ["/bin/bash", "--login", "-c"]

# Install nvm (Node Version Manager), Node.js and npm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash \
    && . $HOME/.nvm/nvm.sh \
    && nvm install node \
    && nvm use node

ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 21.7.1

# Copy .env.example to .env, install npm dependencies, and build the project
RUN cp -RPp .env.example .env 

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN npm i \
    && npm run build


# Change directory to the backend
WORKDIR /open-webui/backend

# Install Python dependencies
RUN pip install -r requirements.txt --upgrade

COPY init.sh /init.sh

# Give execution rights on the start-up script
RUN chmod +x /init.sh
# Your Dockerfile may need additional configuration such as setting environment variables,
# exposing ports, setting a CMD or ENTRYPOINT, etc.

# Expose the port the app runs on
EXPOSE 8080 

EXPOSE 11434 

ENTRYPOINT ["/bin/bash"]

CMD ["/init.sh"]



