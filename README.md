# Store

Store is a take home test by honestbee, it contains the following features:
* A user can register as a normal user
* A user can browse products on this website
* A user can choose to purchase premium membership(can skip payment)
* A premium member can see products with discount prices
* A user can be set as admin
* An admin can create/edit products on this website
* A product would have product price/name/image(s)

# System dependencies
  * Ruby 2.3.7
  * Rubygems
  * Bundler (gem install bundler)
  * Docker 18.09.2
  * MySQL (use docker image mysql:5.7)

# Development
To get started with development:

## Clone the repo
```
git clone git@github.com:tsungying/store.git
```

## Install dependencies
```
bundle install
```

## Set enviroment variables
```
cp .sample.env .env
```
After create file, set the environment value in the `.env` file, for example:
```
MYSQL_HOST=127.0.0.1
MYSQL_USERNAME=root
MYSQL_PASSWORD=root
```

## Setup the database

Create a docker-compose.yml
```
touch docker-compose.yml
```

Copy the following content:
```
mysql-5.7:
  image: mysql:5.7
  container_name: mysql-5.7
  restart: always
  ports:
    - 3306:3306
  volumes:
    - .:/var/lib/mysql
  environment:
    MYSQL_ROOT_PASSWORD: root
  command: ['--character-set-server=utf8']
```

Start MySQL server
```
docker-compose up -d
```

Create DB and tables
```
bin/rails db:drop db:create db:migrate db:seed
```

## Run the app
```
rails s
```
Then visit http://localhost:3000 and has a admin account: `email: admin@example.com`, `password: 1234567890`

## Install for Selenium Webdriver (for test)

- Chrome: https://www.google.com/chrome/

- Chrome Driver

``` sh
$ brew cask install chromedriver
```

## Run Cucumber Test (for automation testing)

``` sh
# run all features
cucumber

# run all features and generate report
cucumber features --format html --out reports.html

# run single feature and specify the first scenario, for example:
cucumber features/membership_system.feature:42 -r features
```
