FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem install rails -v "~> 5.2" -N

RUN mkdir /railsapp
WORKDIR /railsapp
COPY ./railsapp /railsapp
# 後で有効化
RUN bundle install