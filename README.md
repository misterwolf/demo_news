# demo_news

Implementare un’applicazione “News” like.

L’applicazione dovrà permettere ad un utente di:
- Vedere la lista degli articoli disponibili
- Filtrare la lista per autore
- Ordinare la lista per 
   - data creazione crescente / decrescente
   - data ultimo aggiornamento crescente / decrescente
- Vedere il dettaglio di un singolo articolo

Inoltre un utente loggato potrà:
   - Aggiungere un nuovo articolo
   - Editare un suo articolo
   - Eliminare un suo articolo permanentemente

Un utente sarà definito dai campi: nome, cognome, email e password, tutti obbligatori

Un articolo sarà definito dai campi: titolo, testo, autore, data creazione, data ultimo aggiornamento.

Aggiungere nel codice applicativo un seed per la creazione automatica di 3 utenti e n articoli assegnati a questi autori a piacere.

Si invita il candidato a:
- Ignorare gli aspetti puramente estetici; si consiglia l’utilizzo di un framework come Bootstrap o Bulma per il raggiungimento di uno standard di utilizzo accettabile
- Testare il codice utilizzando RSpec come ritenuto necessario
- Fornire la documentazione necessaria per eseguire l’applicativo e i test


## Install project
Install RVM first!

### Run:
in your project folder:
`$ git clone git@github.com:misterwolf/demo_news.git` # Download repository

`$ cd demo_project` # Make sure gemset "demo_news" is created/selected.

`$ bundle install`

### Setup database:

**important notes**: version of mysql used is _Ver 14.14 Distrib 5.7.29_

_if you want skip the creation of a new DB-user (and privileges), add your personal configuration in *config/database.yml* and then run_ 
   - `$ rake db:create`

Otherwise:

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

`$ rake db:seed` # fill the database with base data

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
(29 examples)

## Run application

`$ rails s -p 3000`

open browser on localhost:3000 and enojy :)



## For the future
 Install
  - deployment system, docker or Capisctrano
  - CircleCI installed to build spec in PR
  - Other cool stuff
