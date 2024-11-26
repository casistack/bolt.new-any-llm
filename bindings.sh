#!/bin/bash

# Function to generate bindings from environment variables
generate_bindings() {
    bindings=""
    # List of environment variables to include in bindings
    env_vars=(
        "GROQ_API_KEY"
        "HUGGINGFACE_API_KEY"
        "OPENAI_API_KEY"
        "ANTHROPIC_API_KEY"
        "OPEN_ROUTER_API_KEY"
        "GOOGLE_GENERATIVE_AI_API_KEY"
        "OLLAMA_API_BASE_URL"
        "DEEPSEEK_API_KEY"
        "OPENAI_LIKE_API_BASE_URL"
        "OPENAI_LIKE_API_KEY"
        "MISTRAL_API_KEY"
        "COHERE_API_KEY"
        "LMSTUDIO_API_BASE_URL"
        "XAI_API_KEY"
        "VITE_LOG_LEVEL"
        "DEFAULT_NUM_CTX"
    )
    # Generate bindings for each environment variable that is set
    for var in "${env_vars[@]}"; do
        if [ -n "${!var}" ]; then
            bindings+="--binding ${var}=${!var} "
        fi
    done
    # Trim trailing whitespace
    bindings=$(echo "$bindings" | sed 's/[[:space:]]*$//')
    echo "$bindings"
}

# Call the function and output bindings
generate_bindings
