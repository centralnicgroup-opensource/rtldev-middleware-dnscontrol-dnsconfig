# Use the official Microsoft Go development container image
FROM mcr.microsoft.com/devcontainers/go

# Set environment variables
ENV TZ=Europe/Berlin
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
ENV DEBIAN_FRONTEND=noninteractive

# Define paths for configuration and scripts
ENV CONFIGURATION_DIR_PATH=supporting_files/configuration
ENV SCRIPTS_DIR_PATH=supporting_files/scripts
# Set a default value for ZSH_CUSTOM if it's not already set
ENV ZSH_CUSTOM=/home/vscode/.oh-my-zsh/custom

# Install necessary packages
RUN apt-get update && apt-get install -y \
    postfix \
    wget \
    sudo \
    git \
    pwgen \
    zip \
    unzip \
    curl \
    nodejs \
    npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the time zone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Specifics to user vscode
ARG USERNAME="vscode"
ARG USERHOME="/home/${USERNAME}"

# Copy scripts and configuration files
COPY --chown=${USERNAME}:${USERNAME} ${SCRIPTS_DIR_PATH}/*.sh /

# Clone the powerlevel10k theme for zsh and change owner
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k \
    && chown -R ${USERNAME}:${USERNAME} $ZSH_CUSTOM/themes/powerlevel10k

# Clone the zsh-autosuggestions repository and change owner
RUN git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions \
    && chown -R ${USERNAME}:${USERNAME} $ZSH_CUSTOM/plugins/zsh-autosuggestions
    
# copy zsh and committizen configuration file
COPY --chown=${USERNAME}:${USERNAME} ${CONFIGURATION_DIR_PATH}/.zshrc ${USERHOME}/.zshrc
COPY --chown=${USERNAME}:${USERNAME} ${CONFIGURATION_DIR_PATH}/.czrc ${USERHOME}/.czrc
# zsh theme powerline10k
COPY --chown=${USERNAME}:${USERNAME} ${CONFIGURATION_DIR_PATH}/.p10k.zsh ${USERHOME}/.p10k.zsh
COPY --chown=${USERNAME}:${USERNAME} ${CONFIGURATION_DIR_PATH}/p10k-instant-prompt-vscode.zsh ${USERHOME}/.cache/p10k-instant-prompt-vscode.zsh

# Set the working directory
WORKDIR /usr/share/rtldev-middleware-dnscontrol-dnsconfig
