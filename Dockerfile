FROM ruby:2.3.0-onbuild

RUN apt-get update
RUN apt-get -y install nodejs

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5 --without production test

# Set Rails to run in production
ENV RAILS_ENV development
ENV RACK_ENV development

# Copy the main application.
COPY . ./

# Expose the following ports:
# - Port 3000 for the Rails web process
# - Port 28080 for the ActionCable WebSocket server (Puma)
#EXPOSE 3000 28080

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
