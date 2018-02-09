FROM ruby:2.5-alpine

RUN apk add --update --no-cache \
    nodejs \
    sqlite-libs \
    tzdata

RUN mkdir /blog
WORKDIR /blog

COPY blog/Gemfile blog/Gemfile.lock ./

RUN apk --update add --virtual build-dependencies sqlite-dev build-base && \
    gem install bundler && \
    bundle install --without test && \
    apk del build-dependencies

EXPOSE 3000

CMD ["bin/rails", "server"]