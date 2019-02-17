# Base image
FROM ruby:2.5.1

# Installation of dependencies
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update && \
    apt-get install -y \
    # Needed for certain gems
    build-essential \
    mysql-client \
    # Needed for asset compilation
    nodejs \
    yarn && \
    # The following are used to trim down the size of the image by removing unneeded data
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf \
      /var/lib/apt \
      /var/lib/dpkg \
      /var/lib/cache \
      /var/lib/log

ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

# set it as the working directory for our application
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install

# Copy the main application
COPY . .

# Precompile Rails assets (plus Webpack)
RUN bundle exec rake assets:precompile

# Run our app
CMD bundle exec rails s -p ${PORT} -b '0.0.0.0'
