FROM alpine

RUN apk --update --no-cache add \
    ruby \
    ruby-json \
    ruby-bigdecimal \
    libpq \
    nodejs \
    tzdata \
    &&  echo 'gem: --no-document' > /etc/gemrc

RUN mkdir /blog
WORKDIR /blog

COPY blog/Gemfile blog/Gemfile.lock ./

RUN apk --update --no-cache add \
        --virtual build-dependencies \
        ruby-dev \
        libffi-dev \
        postgresql-dev \
        zlib-dev \
        build-base && \
    gem install -N bundler && \
    bundle install --no-cache && \
    apk del build-dependencies

COPY ./blog /blog

RUN adduser -D myuser
USER myuser

CMD bin/rails server -p $PORT -b 0.0.0.0