#!/bin/bash

# Exit immediately on error
set -e

# ---- USER INPUT ----
if [ -z "$1" ]; then
  echo "❌ Please provide a project name!"
  echo "👉 Usage: ./setup.sh my-app"
  exit 1
fi

PROJECT_NAME=$1
BOILERPLATE_REPO="https://github.com/<your-username>/mern-starter.git"

# ---- CLONE REPO ----
echo "📥 Cloning boilerplate into $PROJECT_NAME..."
git clone $BOILERPLATE_REPO $PROJECT_NAME
cd $PROJECT_NAME

# ---- REMOVE OLD GIT ----
echo "🧹 Removing old .git history..."
rm -rf .git

# ---- INIT NEW GIT ----
echo "📂 Initializing fresh git repo..."
git init
git add .
git commit -m "Initial commit from boilerplate"

# ---- INSTALL DEPENDENCIES ----
echo "📦 Installing dependencies..."
npm run install-all

# ---- DONE ----
echo "✅ Project $PROJECT_NAME setup complete!"
echo ""
echo "👉 Next steps:"
echo "   cd $PROJECT_NAME"
echo "   npm run dev"
