FROM python:3.11-slim

# Étape 1 : Installation des dépendances système nécessaires et de Node.js
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Étape 2 : Installation globale des CLI pour les agents
RUN npm install -g opencode-ai @google/gemini-cli

# Étape 3 : Préparation de l'environnement de l'application
WORKDIR /app

# Étape 4 : Copie et installation des dépendances Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Étape 5 : Copie du reste du code source
COPY . .

# Étape 6 : Création des dossiers requis par l'application (exclus par .gitignore d'origine)
RUN mkdir -p audit data backups

# Le port par défaut configuré dans Agentic OS est 8080
EXPOSE 8080

# Étape 7 : Lancement du serveur d'orchestration
CMD ["python", "server.py"]
