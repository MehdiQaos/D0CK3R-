# Project Setup Guide

This guide will help you clone the necessary repositories, build the project, and access the application and its services.

## Cloning Repositories

Ensure that the `clone_repos.sh` script has execute rights. If not, run the following command:

```bash
chmod +x clone_repos.sh

```

Then, run the following command to clone the repositories:

```bash
./clone_repos.sh

```

## Building the Project

To build the project, run the following command:

```bash
docker-compose up

```

## Accessing the Application

To access the application, open a browser and go to the following URL:

`http://localhost:4200`

## Accessing the Database

To access the MySQL database, use port 3307.
user and password are in the .env file

## Accessing the API

To access the API, use port 8080.

## Configuration

To configure the application, use the following file:

```bash
# .env file
```
