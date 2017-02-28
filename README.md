# _My Favorite Places_

#### _A Rails Travel Diary - See the current weather in your favorite places and revisit your memories!_

#### By Diane Douglas

## Description

#### [Try it on Heroku: My Favorite Places](https://secret-thicket-66991.herokuapp.com/)

This app uses the [Open Weather Map API](http://openweathermap.org/api) to allow you to look at the current weather conditions in your favorite places. 

* On the homepage see a preview of a randomized place from a user with their favorite memory, a picture, and the current weather in that place. 
* Create an account with a username and password, then add some of your favorite places. Where did you last go on vacation? Where did you grow up? Use city, state, or city, country, or even specific addresses.
* With each place you can include a picture, the length of your stay and your favorite memory.
* Click on any of your places to see the current weather conditions (for example, light snow at 31.41 &deg;F.) All your places are saved to a database where you can safely edit or delete them later.

## Setup/Installation Requirements

To run this app locally:

* Clone this repository: `git clone https://github.com/dianedouglas/rails-travel-diary`

* Change directory into the top level of the project folder: `cd rails-travel-diary`

* Install dependencies. This project uses `sqlite3` for a local database and `postgresql` for deployment on Herolku. It uses `bcrypt-ruby` for password encryption. 

```
bundle
```

On some machines you may need to run one this command if you encounter errors with bundling:

```
ARCHFLAGS="-arch x86_64" bundle
```

* Set up the database and seed it with some starter data:

```
rake db:migrate
rake db:seed
```

* Create a free account at [Open Weather Map](openweathermap.org/api) and copy the generated API Key from [here](https://home.openweathermap.org/api_keys). 

* Load the API key into an environment variable called "WEATHER_API_KEY" using Figaro. Run `bundle exec figaro install` to create the configuration file `config/application.yml` and then paste the following with your api key in:

```
development:
  WEATHER_API_KEY: "YOURAPIKEY"

test:
  WEATHER_API_KEY: "YOURAPIKEY"

production:
  WEATHER_API_KEY: "YOURAPIKEY"
```

* Start a local server with `rails server` and then navigate your browser to `http://localhost:3000/`

* Here you can either click "Sign Up" to create an account and try adding some places, or you can log in with the test account using Username: `tester` and Password: `secret`. 

## To Run the Tests:

Make sure you're in the top level of the project directory and then run:

```
rake db:migrate RAILS_ENV=test
rake db:fixtures:load
rake test
rake test:models
```

## Deploy Your Own on Heroku

Create a free account on Heroku. Then do the initial deploy by following these steps from the top level of the project directory:

* Install Homebrew, and use it to install the Heroku CLI: `brew install heroku`
* Confirm that it has installed correctly by running: `heroku --version` (oddly, I needed to run this a couple times to get it to update and install all dependencies.)
* Log into Heroku (it will prompt you for your username/password) `heroku login`
* This is already done here, but for your own projects, if you started with the default `rails new projectname` installation, you will need to change your gemfile because you need to use postgres on Heroku. If you don't feel like installing postgres on your local machine, you can use it in production alongside the default sqlite3 database by including the following lines in your gemfile:

```
gem 'sqlite3', :group => [:development, :test]
gem 'pg'
```

* Then, run `bundle`. As above, if you encounter errors, run this command instead: 

```
ARCHFLAGS="-arch x86_64" bundle
```

* Create an app on Heroku: `heroku create`
* Use Git to commit and push your work to the newly created Heroku remote (and to GitHub if you like).

```
git config user.name 'yourname'
git config user.email 'your@email.com'
git init
git add .
git commit -m "Write your commit message here."
git push heroku master
```

* Make sure set up the database on Heroku and make sure everything deployed correctly with these commands:

```
heroku run rake db:migrate
heroku run rake db:seed
heroku ps:scale web=1
heroku ps
```

* Set your environment variables on Heroku so that you can use your API key in production. Make sure you've followed steps 5 and 6 in local setup/installation instructions first to set up the environment variables with Figaro. Then run: `figaro heroku:set -e production`

* Open your app with: `heroku open`.


## Support and Contact Details

Please feel free to fork this repository and submit pull requests back. You can also contact me here:

* Email: diane.douglas1@gmail.com
* My Website: [www.MelodicCode.com](http://www.melodiccode.com)

## Technologies Used

* Rails
* OpenWeatherMap API
* Figaro for environment variables with Heroku for deployment
* SCSS with Bootstrap

Copyright (c) 2017 **Diane Douglas**