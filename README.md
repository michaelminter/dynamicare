Ruby on Rails
-------------

This application requires:

- Ruby 2.3.1
- Rails 5.1.1

Getting Started
---------------

From a command line:

* `rvm use 2.3.1@dynamicare --ruby-version --create` if you want to use a gem manager.
* Open **config/database.yml** and update Postgres values for development.
* `rake db:setup` to create database and load schema.
* `bundle install` to install gems.
* `foreman start` to run application.
* Point browser to **http://localhost:5000**
