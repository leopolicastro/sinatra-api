# Sinatra API

## Requirements:

- Ruby 3.1.1

## Setup

```shell
cp .env.sample .env
bundle install
cd db
APP_ENV=development ruby seeds.rb
cd ..
```

## Usage

```shell
ruby server.rb
```

## Testing

```shell
bundle exec rspec
```

## Reference

- https://docs.mongodb.com/mongoid/current/tutorials/getting-started-sinatra/
