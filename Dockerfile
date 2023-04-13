FROM ruby:3.1

RUN apt-get update -qq  \
 && apt-get install -y --no-install-recommends build-essential \
 && rm -rf /var/lib/apt/lists/* \
 && gem update --system

WORKDIR /workspace
COPY Gemfile* ./
RUN bundle install
COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
