# demo_news

## Download repository
`$ git clone git@github.com:misterwolf/demo_news.git`

## Install project
Install RVM first!

### Run:
`$ cd .. & cd .` # Make sure gemset is created/selected.
`$ bundle install`

## Setup database:

### Set up a new DB user and gran privileges.
**Notes**:
 - if you want skip creating a new user, simply change the *config/database.yml* and add your personal configuration and then run `$ rake db:create`
 - my version of mysql used is _Ver 14.14 Distrib 5.7.29_

In terminal:
`$ mysql -uroot -pYOURPASSWORD`

in mysql shell

`mysql> create database demo_news_dev;`

`mysql> create database demo_news_test;`
`mysql> CREATE USER 'demo_news_user'@'localhost' IDENTIFIED BY 'password';`

`mysql> GRANT ALL PRIVILEGES ON demo_news_dev. * TO 'demo_news_user'@'localhost';`

`mysql> GRANT ALL PRIVILEGES ON demo_news_test. * TO 'demo_news_user'@'localhost';`

`$ rake db:migrate` # run migrations

`$ rake db:seed` # fill a bit the database

`$ rake db:schema:load RAILS_ENV=test` # set the test db

## Run tests
Capybara, for curiosity purpose, use Firefox. Install it following these steps:

`cd ~/Downloads/`

`wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-macos.tar.gz`

***note***: check your best build here: https://github.com/mozilla/geckodriver/releases)

`tar -zxvf geckodriver-v0.24.0-linux64.tar.gz` or file you just downloaded

`sudo mv geckodriver /usr/local/bin/`

and finally

`$ rspec spec/`

## For the future
 Install
  - deployment system, docker or Capisctrano
  - CircleCI installed to build spec in PR
  - Others?
