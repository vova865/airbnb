FROM ruby:2.6.5-slim

RUN apt-get update
RUN wget --no-check-certificate --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get install -y postgresql-client build-essential libpq-dev nodejs

RUN gem install bundler -v 2.3.26
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install

COPY . /app

CMD ["rails", "server", "-b", "0.0.0.0"]
#ENTRYPOINT ["/app/entrypoint.sh"]
