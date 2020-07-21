# demo_news

## Download repository
`$ git clone git@github.com:misterwolf/demo_news.git`

## Install project
Install RVM first!

Run:
`$ cd .. & cd .` # Make sure gemset is created/selected.
`$ bundle install`

Setup database:

Set up a new DB user and gran privileges.
**Note**: if you want skip creating a new user, simply change the
*config/database.yml* and add your personal configuration and then run
`$ rake db:create`

In terminal:
`$ mysql -uroot -pYOURPASSWORD`

in mysql shell

`mysql> create database demo_news_dev;`
`mysql> CREATE USER 'demo_news_user'@'localhost' IDENTIFIED BY 'password';`
`mysql> GRANT ALL PRIVILEGES ON demo_news_dev. * TO 'demo_news_user'@'localhost';`

`$ rake db:migrate` # run migrations
`$ rake db:seed` # fill a bit the database
