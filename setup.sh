#!/bin/bash

# Exit immediately on error
set -e

# ---- USER INPUT ----
if [ -z "$1" ]; then
  echo "❌ Please provide a project name!"
  echo "👉 Usage: ./setup.sh my-app"
  echo "👉 Or:    ./setup.sh .   (for current directory)"
  exit 1
fi

PROJECT_NAME=$1
BOILERPLATE_REPO="https://github.com/<your-username>/mern-starter.git"

if [ "$PROJECT_NAME" = "." ]; then
  echo "📥 Cloning boilerplate into current directory..."
  TEMP_DIR=$(mktemp -d)

  git clone $BOILERPLATE_REPO $TEMP_DIR
  rm -rf $TEMP_DIR/.git
  cp -r $TEMP_DIR/* $TEMP_DIR/.* . 2>/dev/null || true
  rm -rf $TEMP_DIR

  echo "📂 Initializing fresh git repo..."
  rm -rf .git
  git init
  git add .
  git commit -m "Initial commit from boilerplate"

  echo "📦 Installing dependencies..."
  npm run install-all

  echo "✅ Project setup complete in current directory!"
  echo ""
  echo "👉 Next steps:"
  echo "   npm run dev"

else
  echo "📥 Cloning boilerplate into $PROJECT_NAME..."
  git clone $BOILERPLATE_REPO $PROJECT_NAME
  cd $PROJECT_NAME

  echo "🧹 Removing old .git history..."
  rm -rf .git

  echo "📂 Initializing fresh git repo..."
  git init
  git add .
  git commit -m "Initial commit from boilerplate"

  echo "📦 Installing dependencies..."
  npm run install-all

  echo "✅ Project $PROJECT_NAME setup complete!"
  echo ""
  echo "👉 Next steps:"
  echo "   cd $PROJECT_NAME"
  echo "   npm run dev"
fi
