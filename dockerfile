FROM ruby:2.5-slim

RUN apt-get update && apt-get install -y build-essential libsqlite3-dev libpq-dev nodejs

RUN mkdir /blog
WORKDIR /blog

COPY blog/Gemfile blog/Gemfile.lock ./

RUN gem install rails && bundle install

COPY ./blog /blog

RUN useradd -m myuser
USER myuser

CMD bin/rails server -p $PORT -b 0.0.0.0