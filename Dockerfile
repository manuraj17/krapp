# Base image:
FROM ruby:2.4.4-alpine

RUN apk --update upgrade && apk add --no-cache build-base sqlite-dev tzdata

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock .
RUN gem install bundler
RUN bundle install

COPY . .

RUN bundle exec rake db:migrate

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server"]
