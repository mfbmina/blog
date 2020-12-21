FROM elixir:1.11.2

RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y inotify-tools && \
    apt-get install -y nodejs && \
    curl -L https://npmjs.org/install.sh | sh && \
    mix local.hex --force && \
    mix archive.install hex phx_new 1.5.3 --force && \
    mix local.rebar --force

WORKDIR /app

COPY mix.exs .
COPY mix.lock .

CMD mix deps.get

CMD ["mix", "phx.server"]
