# demo_news

## Install project
Install RVM first!

### Run:
in your project folder:
`$ git clone git@github.com:misterwolf/demo_news.git` # Download repository

`$ cd demo_project` # Make sure gemset "demo_news" is created/selected.

`$ bundle install`

### Setup database:

**important notes**: version of mysql used is _Ver 14.14 Distrib 5.7.29_

_if you want skip creating a new DB user with privileges, add your personal configuration in *config/database.yml* and then run_ 
   - `$ rake db:create`

otherwise:

***Set up a new DB user and gran privileges.***

In terminal:
`$ mysql -uroot -pYOURPASSWORD`

in mysql shell

`mysql> create database demo_news_dev;`

`mysql> create database demo_news_test;`

`mysql> CREATE USER 'demo_news_user'@'localhost' IDENTIFIED BY 'password';`

`mysql> GRANT ALL PRIVILEGES ON demo_news_dev. * TO 'demo_news_user'@'localhost';`

`mysql> GRANT ALL PRIVILEGES ON demo_news_test. * TO 'demo_news_user'@'localhost';`

`mysql> exit;`

In terminal, then:

`$ rake db:migrate` # run migrations

`$ rake db:seed` # fill a bit the database

`$ rake db:schema:load RAILS_ENV=test` # set the test db

## Run tests

Capybara, for curiosity purpose, use Firefox. Install it following these steps:

`$ cd ~/Downloads/`

`$ wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-macos.tar.gz`

***note***: check your match build here: https://github.com/mozilla/geckodriver/releases

`$ tar -zxvf geckodriver-v0.24.0-linux64.tar.gz` or file you just downloaded

`$ mv geckodriver /usr/local/bin/`

and finally

`$ rspec spec/`

## Run application

`$ rails s -p 3000`

open browser on localhost:3000 and enojy :)



## For the future
 Install
  - deployment system, docker or Capisctrano
  - CircleCI installed to build spec in PR
  - Other cool stuff
