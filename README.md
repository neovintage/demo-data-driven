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
* Deploy application
* Navigate to the dashboard. Show that theres no database

* Create a database
  ```
  $ heroku addons:create heroku-postgresql:standard-4 --private=true
  ```

* Try to PSQL not `heroku pg:psql`
  ```
  $ env PGCONNECT_TIMEOUT=1 psql connection-string-goes-here
  ```

* Load [tpch
  dataset](https://s3-us-west-2.amazonaws.com/rimas-pgbackups-testing/tpch_logical.dump). Note have the file locally because its big and trying to download and put it to db is no bueno.
  ```
  $ pv tpch_logical.dump | heroku pg:psql
  ```

* Reload dashboard
* Profit!
