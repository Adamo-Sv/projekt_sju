FROM python:3.12-slim

# Instalacja pip, ipykernel i narzędzi Jupyter
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        python3-pip \
        python3-dev \
        git \
        curl \
    && pip install --upgrade pip \
    && pip install ipykernel jupyterlab notebook \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Dodaj użytkownika vscode (ważne dla Codespaces)
RUN useradd -m vscode
USER vscode
