# # Make sure it matches the Ruby version in .ruby-version and Gemfile
# ARG RUBY_VERSION=3.2.0

# # Install libvips for Active Storage preview support
# RUN apt-get update -qq && \
#     apt-get install -y build-essential libvips bash bash-completion libffi-dev tzdata postgresql nodejs npm yarn && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man

# # Rails app lives here
# WORKDIR /rails

# # Set production environment
# ENV RAILS_LOG_TO_STDOUT="1" \
#     RAILS_SERVE_STATIC_FILES="true" \
#     RAILS_ENV="production" \
#     BUNDLE_WITHOUT="development"

# # Install application gems
# COPY Gemfile Gemfile.lock ./
# RUN bundle install

# # Copy application code
# COPY . .

# # Precompile bootsnap code for faster boot times
# RUN bundle exec bootsnap precompile --gemfile app/ lib/

# # Precompiling assets for production without requiring secret RAILS_MASTER_KEY
# RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

# # Entrypoint prepares the database.
# ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# # Start the server by default, this can be overwritten at runtime
# EXPOSE 3000
# CMD ["./bin/rails", "server"]






# Base image
FROM ruby:3.2.0
# Set working directory
WORKDIR /app
# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./
# Install gems
RUN bundle install
# Copy the rest of the application code
COPY . .

# Set environment variables
ENV RAILS_ENV=development \
    DATABASE_URL=postgres://admin:password@localhost:5432/chicago_bus_system_development

ENTRYPOINT ["bin/docker-entrypoint"]

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
