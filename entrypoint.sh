#!/bin/bash

# Command 1
echo "Running Model"
cd llama.cpp && ./main --mlock -m models/ggml-vic13b-uncensored-q5_1.bin -f 'prompts/chat-with-vicuna-v1.txt' -r 'User:' --temp 0.36

