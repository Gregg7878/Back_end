# Rails API Backend for Front-End Application

This Rails API backend serves as the data and authentication server for the front-end application. It utilizes a PostgreSQL database to manage users and activities.

## Prerequisites

Before getting started, make sure you have the following software installed on your system:

- Ruby
- Ruby on Rails
- PostgreSQL

## Getting Started

Follow these steps to set up and run the Rails API:

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/yourusername/your-backend-repo.git

1. Change to the project directory:
```
    cd your-backend-repo
 ```
2. Install Ruby dependencies:
```
    bundle install

```
3. Set up the PostgreSQL database:

    Create a PostgreSQL database and update the database configuration in config/database.yml.
```
default: &default
  adapter: postgresql
  encoding: unicode
  database: your_database_name
  username: your_database_username
  password: your_database_password
  host: localhost
  port: 5432

```
4. Run the database migrations:
```
rails db:create
rails db:migrate

```
5. Start the Rails server:
```
rails server -p 3000

```

API Endpoints

The following API endpoints are available:

    User Authentication:
        POST /api/auth/signup: Create a new user account.
        POST /api/auth/login: Log in with email and password.

    Activity Management:
        GET /api/activities: Fetch activities created by the user.
        POST /api/activities: Create a new activity.
        PUT /api/activities/:id: Update an existing activity.
        DELETE /api/activities/:id: Delete an activity.

    Session Management:
        GET /api/auth/logout: Log out the currently authenticated user.
