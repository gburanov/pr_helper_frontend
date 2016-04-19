FROM ruby:2.3.0-onbuild

RUN apt-get update
RUN apt-get -y install nodejs

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5 --without development test

# Set Rails to run in production
ENV RAILS_ENV production
ENV RACK_ENV production

# Copy the main application.
COPY . ./

# Precompile Rails assets
RUN bundle exec rake assets:precompile

CMD ["bundle", "exec", "rails", "server"]
