FROM ruby:2.7.2

RUN groupadd -g 1000 app && useradd -r -u 1000 -g app app

RUN apt update -qq && apt install -y apt-transport-https

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN apt update -qq && apt install -y build-essential nodejs yarn postgresql-client gnupg ca-certificates nano

RUN gem update --system

RUN gem install bundler -v 2.1.4

WORKDIR /app

RUN chown -R app:app /app

RUN chown -R app:app /usr/local/bundle

RUN usermod -d /app app

USER app

COPY --chown=app:app package.json yarn.lock /app/

RUN yarn install

COPY --chown=app:app Gemfile* /app/

RUN bundle install

COPY --chown=app:app --chmod=775 . /app/

# RUN bundle exec rails assets:precompile

RUN chmod 770 /app/tmp

CMD /bin/sh -c "bundle install && ./bin/rails server -p 3000 -b '0.0.0.0'"
