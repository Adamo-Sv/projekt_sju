ARG VARIANT=3.12-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/python:${VARIANT}

# [Optional] Install additional OS packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
       git curl build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Jupyter environment
RUN pip3 install --disable-pip-version-check --no-cache-dir \
    ipykernel jupyter \
    qiskit \
    matplotlib \
    pillow \
    pycryptodomex \
    cryptography 

# Set user and create workspace directory
USER vscode
RUN mkdir -p /home/vscode/workspace