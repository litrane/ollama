#!/bin/bash

# Start the ollama service in the background
ollama serve &

sleep 10

# ollama run llama2 &

./start.sh

tail -f /dev/null
