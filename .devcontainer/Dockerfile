ARG VARIANT=3.12-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/python:${VARIANT}

# Instalacja dodatkowych pakietów systemowych
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        git curl build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y gcc python3-dev musl-dev linux-headers
RUN pip3 install --disable-pip-version-check --no-cache-dir \
    ipykernel jupyter \
    qiskit \
    matplotlib \
    pillow \
    pycryptodomex \
    cryptography

# Upewnij się, że użytkownik vscode istnieje
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

# Przełącz się na użytkownika vscode
USER $USERNAME

# Utwórz katalog roboczy
WORKDIR /home/vscode/workspace
