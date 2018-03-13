FROM elixir:1.6.1
ENV MIX_ENV=prod
ENV PORT=80
# Install hex
RUN mix local.hex --force
# Install rebar
RUN mix local.rebar --force
# Install the Phoenix framework itself
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force

# Create app directory
ENV WEDEPLOY_APP_DIRECTORY=/wedeploy/app
RUN mkdir -p $WEDEPLOY_APP_DIRECTORY

WORKDIR $WEDEPLOY_APP_DIRECTORY

# Bundle app source
ADD . $WEDEPLOY_APP_DIRECTORY

RUN mix deps.get --force

# Compile
RUN mix compile --force

WORKDIR $WEDEPLOY_APP_DIRECTORY

EXPOSE 80

CMD [ "mix", "phx.server" ]
