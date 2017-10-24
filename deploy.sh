lexport PORT=8000
DIR=$1

if [ ! -d "$DIR" ]; then
  printf "Usage: ./deploy.sh <path>\n"
  exit
fi

echo "Deploy to [$DIR]"

mix deps.get
(cd assets && npm install)
(cd assets && ./node_modules/brunch/bin/brunch b -p)
mix phx.digest
MIX_ENV=prod mix release --env=prod

$DIR/bin/microblog stop || true

mix ecto.migrate

_build/prod/rel/microblog/releases/0.0.1/microblog start
