FROM ruby:2.5-slim

RUN apt-get update && apt-get install -y build-essential libsqlite3-dev nodejs

RUN mkdir /blog
WORKDIR /blog

COPY blog/Gemfile blog/Gemfile.lock ./

RUN gem install rails && bundle install

EXPOSE 3000

CMD ["bin/rails", "server"]