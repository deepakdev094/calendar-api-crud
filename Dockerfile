# Dockerfile

# Use an existing Docker image as the base
FROM ruby:2.7.5

# Set up the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN gem install bundler:2.2.28
RUN bundle install --jobs=4 --retry=3 

# Copy the rest of the application code into the container
COPY . .

# Specify the command to run when the container starts
CMD ["rails", "server", "-b", "0.0.0.0"]
