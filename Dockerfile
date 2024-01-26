FROM ruby:2.6.5

RUN apt-get update
RUN apt-get install -y build-essential libpq-dev nodejs

RUN gem install bundler -v 2.3.26
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install

COPY . /app

CMD ["rails", "server", "-b", "0.0.0.0"]
