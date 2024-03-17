## Overview

This repository ollama with interface in one container. Users interested in using the LLM model should follow the instructions below to download the appropriate model.

## Model Download Instructions

To download the model, you need to:

1. Sign up for an account.
2. Log in to the Web UI.
3. Navigate to `Settings > Models`.
4. Choose the model to download that is compatible with the `llama2` image.

For more details on the image that contains the `llama2` model, please refer to the Docker image `litrane/theta-ollama`. Inside the `litrane/theta-ollama` image, the model for `llama2` can be found at the path `/root/.ollama/`.
https://hub.docker.com/repository/docker/litrane/theta-ollama/general

## Base Repositories

The base repositories for the LLM model and the Web UI support are:

- Ollama Base Repository: [ollama/ollama](https://github.com/ollama/ollama)
- Open Web UI Support: [open-webui/open-webui](https://github.com/open-webui/open-webui/tree/main)

## API and Web UI Access

The model supports an Openai API endpoint that can be accessed at:

```
http://localhost:11434/v1/chat/completions
```

The Web UI is available on port `8080`.

## Usage

Please ensure that you have Docker installed and running on your machine. Once you have the image, you can run it using Docker and interact with the model through the provided API or the Web UI.
