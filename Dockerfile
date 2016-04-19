FROM ruby:2.3.0-onbuild

RUN apt-get update

COPY Gemfile Gemfile.lock ./
RUN bundle install --deployment --without development test
COPY . ./

CMD ["bundle", "exec", "rails", "server"]
