#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

echo "Running in mode: $MODE"

# Apply database migrations before starting the server
python manage.py migrate

if [ "$MODE" = "dev" ]; then
  echo "Starting Django development server (runserver)..."
  python manage.py runserver 0.0.0.0:8000

elif [ "$MODE" = "prod" ]; then
  echo "Starting uWSGI server (production mode)..."
  python manage.py collectstatic --noinput
  uwsgi --http :8000 --module core.wsgi --chmod-socket=666

else
  echo "Unknown mode: $MODE"
  exit 1
fi
