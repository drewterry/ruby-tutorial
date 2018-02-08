FROM ruby:2.5-alpine

RUN apk add --update --no-cache \
    build-base \
    nodejs \
    sqlite-dev \
    tzdata

RUN mkdir /blog
WORKDIR /blog

COPY blog/Gemfile blog/Gemfile.lock ./

RUN gem install rails && bundle install

EXPOSE 3000

CMD ["bin/rails", "server"]