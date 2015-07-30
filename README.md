# Mock Orders

This app uses TPC-H to mock an e-commerce application. It consists of a
dashboard and some information on customers. If the database isn't working
correctly it will let you know. :-)

## Setup

* Clone this repo

* Create a space in an org
  ```
  $ heroku spaces:create my-space-name --org whatever
  ```

* Create an app in an org
  ```
  $ heroku create space-app --space my-space-name
  ```

* have your clone point to the new app you've just created
  ```
  $ heroku git:remote
  ```

* Deploy application
  ```
  $ git push heroku master
  ```

* Navigate to the heroku dashboard. Show that theres no database. You can even
  try loading app, the app will give you the error in a decent form.

* Create a database
  ```
  $ heroku addons:create heroku-postgresql:standard-4 --private=true
  ```

* For illustrative purposes, Try to psql using the credentials from `heroku pg:credentials`. What we're illustrating is that psql cant connect to the database because it needs to connect through a bastion to actually get to the database. 
  `heroku pg:psql` on the other hand understands the bastions and then connect
  to the database.
  ```
  $ env PGCONNECT_TIMEOUT=1 psql connection-string-goes-here
  ```

* Load [tpch
  dataset](https://s3-us-west-2.amazonaws.com/rimas-pgbackups-testing/tpch_logical.dump). Make sure you download the dataset to your machine before running this command. It's not very fast otherwise. I've included `pv` so you can see progres bar.
  ```
  $ pv tpch_logical.dump | heroku pg:psql
  ```

* Reload the app
* Profit!
