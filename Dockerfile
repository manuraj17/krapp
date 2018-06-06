# Base image:
FROM ruby:2.4.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev apt-transport-https ca-certificates sqlite3 libsqlite3-dev

# Install nodejs and yarn
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN npm install --global yarn

# Set an environment variable where the Rails app is installed to inside of Docker image:
# ENV RAILS_ROOT /var/www/sleekr-admin
RUN mkdir app

# Set working directory, where the commands will be ran:
WORKDIR /app

# Gems:
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install --without development test

# Puma
# COPY config/puma.rb config/puma.rb

# Copy the main application.
COPY . .
# COPY config/database.docker.yml config/database.yml

EXPOSE 3000

# The default command that gets ran will be to start the Puma server.
CMD bundle exec puma -C config/puma.rb
