FROM ruby:2.6.3-alpine3.9

RUN apk update && apk add --no-cache \
        postgresql-dev \
        postgresql-client \
        build-base \
        libxml2-dev \
        libxslt-dev

RUN gem install bundler:2.0.1

COPY . /application

WORKDIR /application

# Set Rails environment to production
ENV RAILS_ENV production

# Install gems, 
RUN bundle install --deployment --without development test

#Start the application server
ENTRYPOINT ['./entrypoint.sh']
