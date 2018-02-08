FROM ruby:2.5-alpine

RUN apk add --update --no-cache \
#   build-base \
    nodejs \
#   sqlite-dev \
    tzdata

RUN mkdir /blog
WORKDIR /blog

COPY blog/Gemfile blog/Gemfile.lock ./

RUN apk --update add --virtual build-dependencies build-base sqlite-dev && \
    gem install bundler && \
    bundle install --without development test && \
    apk del build-dependencies

# RUN gem install rails && bundle install

EXPOSE 3000

CMD ["bin/rails", "server"]