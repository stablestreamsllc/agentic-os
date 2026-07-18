FROM python:3.11-slim

# Étape 1 : Installation des dépendances système nécessaires et de Node.js
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Étape 2 : Installation globale des CLI pour opencode et gemini
RUN npm install -g opencode-ai @google/gemini-cli

# Étape 3 : Installation silencieuse de Hermes Agent (Nous Research)
RUN curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash -s -- --skip-setup

# Ajouter le répertoire de binaires utilisateur au PATH global du conteneur
ENV PATH="/root/.local/bin:${PATH}"

# Étape 4 : Préparation de l'environnement de l'application
WORKDIR /app

# Étape 5 : Copie et installation des dépendances Python d'Agentic OS
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Étape 6 : Copie du reste du code source
COPY . .

# Étape 7 : Création des dossiers requis par l'application
RUN mkdir -p audit data backups

# Le port par défaut configuré dans Agentic OS est 8080
EXPOSE 8080

# Étape 8 : Lancement du serveur d'orchestration
CMD ["python", "server.py"]
