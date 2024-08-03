# Chicago Bus System

## Project Description

This project fetches chicago bus stop data from the provided dataset API, stores them in a PostgreSql database and then quries the data to find the longest bus route and the most common bus stop. It display the longest bus route in a grid.

## Prerequisites

- Ruby version 3.2.0
- Rails version 7.1.3
- PostgreSQL 14 (required for non-Docker setup)

Please ensure you have the specified versions of Ruby and Rails installed before proceeding.

## Setup Instructions

### Without Docker

1. Clone the repository and navigate to the directory:
    ```bash
    cd Chicago-Bus-System
    ```

2. Install the required Ruby gems:
    ```bash
    bundle install
    ```

3. Create and set up the database:
    ```bash
    rails db:create
    rails db:migrate
    ```

4. Run the rake task to populate your database from the API:
    ```bash
    rails db:fetch_data
    ```

5. Start the Rails server:
    ```bash
    rails s
    ```
    The application will be available at [http://localhost:3000/](http://localhost:3000/).

### With Docker

1. Navigate to the frontend directory:
    ```bash
    cd Chicago-Bus-System
    ```

2. Build and run the Docker Containers with Docker Compose:
    ```bash
    docker-compose up --build
    ```

Please ensure that PostgreSQL is installed and running before attempting to set up the server. Enjoy exploring the project!