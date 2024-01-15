#!/bin/bash

# GitHub repositories
API_REPO="https://github.com/MehdiQaos/Aftas-api.git"
FRONTEND_REPO="https://github.com/MehdiQaos/Aftas-angular.git"

# Directory names
API_DIR="Aftas-api"
FRONTEND_DIR="Aftas-angular"

API_BRANCH="docker"
FRONTEND_BRANCH="docker"

# Function to clone a repository into a directory
clone_repository() {
    REPO_URL=$1
    DIR_NAME=$2
    BRANCH=$3

    echo "Cloning $REPO_URL branch $BRANCH into $DIR_NAME..."
    git clone --branch "$BRANCH" "$REPO_URL" "$DIR_NAME"

    if [ $? -eq 0 ]; then
        echo "Clone successful: $REPO_URL"
    else
        echo "Error cloning repository: $REPO_URL"
        exit 1
    fi
}

# Remove repos if they exist
rm -rf "$API_DIR"
rm -rf "$FRONTEND_DIR"

# Create directories
mkdir -p "$API_DIR"
mkdir -p "$FRONTEND_DIR"

# Clone repositories
clone_repository "$API_REPO" "$API_DIR" "$API_BRANCH"
clone_repository "$FRONTEND_REPO" "$FRONTEND_DIR" "$FRONTEND_BRANCH"

echo "Repositories cloned successfully!"