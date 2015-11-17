# Mock Orders

This app uses TPC-H to mock an e-commerce application. It consists of a
dashboard and some information on customers. If the database isn't working
correctly it will let you know. :-)

## Setup

* Clone this repo

* Create an app on heroku

* Deploy application
  ```
  $ git push heroku master
  ```

* Navigate to the heroku dashboard. Show that theres no database. You can even
  try loading app, the app will give you the error in a decent form.

* Create a database
  ```
  $ heroku addons:create heroku-postgresql:standard-0
  ```

* Load tpch dataset

* Reload the app
* Profit!
