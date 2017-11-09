## Requirements
- Ruby 2.4.0
- redis 2.8.17
- Postgres 9.4

## Installation
1. Install gems: `bundle install`
2. Copy database config `cp config/database.yml.example config/database.yml`
3. Fill `config/database.yml` with your postgres username and password
4. Create database `bundle exec rake db:create db:migrate`
5. Copy secrets.yml `cp config/secrets.yml.example config/secrets.yml`

## Commands
- Run app: `foreman start`
- Run tests: `rspec`

## Available urls
1. `localhost:3000` - current news
2. `localhost:3000/admin` - add custom news