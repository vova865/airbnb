FROM ruby:2.6.5-slim

RUN apt-get update \
    && apt-get install -y \
        libpq-dev \
        postgresql-client \
        netcat \
        nodejs \
        qt5-default \
        build-essential \
        openssh-client \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler -v 2.3.26

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install

COPY . /app

ENTRYPOINT ["/app/.docker/backend/scripts/entrypoint.sh"]
