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
* Try to PSQL not `heroku pg:psql`
* Load [tpch
  dataset](https://s3-us-west-2.amazonaws.com/rimas-pgbackups-testing/tpch_logical.dump)
* Reload dashboard
* Profit!
