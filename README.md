##Event Management

This is the README file for the Event-Management Rails project. It provides an overview of the project, installation instructions, and other relevant information.

Prerequisites
Before you begin, please ensure that you have the following software installed on your system:

Ruby (version 2.7.5)
Rails (version 6)
Bundler

Installation -

Clone the repository to your local machine:
$ git clone https://github.com/deepakdev094/calendar-api-crud.git

Change into the project's directory:
$ cd event-management

Install the project dependencies using Bundler:
$ bundle install

Database Setup -

Before running the application, you need to set up the database:

Create the database:
$ rails db:create

Run database migrations:
$ rails db:migrate

Seed the database with initial data:
$ rails db:seed

Running the Application -

To start the Rails server and run the application locally, follow these steps:

Start the server:
$ rails server

Open your web browser and visit http://localhost:3000.


##Docker Setup

1. Make sure you have Docker and Docker Compose installed on your machine.

2. Build the Docker images:

  sudo docker-compose build or docker-compose build

3. Start the Docker containers:

  sudo docker-compose or docker-compose up

4. Access the application in your web browser at `http://localhost:3000`.

