# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

COPY ./app /app
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt

A dyno is a container for a single main process falling into two main categories, web or worker:
* A web process could be a Rails web server, Django app, etc. A worker process could be running Sidekiq, Resque, RQ or celery.
* https://medium.com/ruby-daily/deploy-backend-and-frontend-apps-on-the-same-heroku-dyno-cfc6978a24d5
# Set environment variables
ENV DATABASE_HOST=your_database_host
ENV DATABASE_PORT=your_database_port
ENV DATABASE_USERNAME=your_database_username
ENV DATABASE_PASSWORD=your_database_password
ENV DATABASE_NAME=your_database_name

# Pipiline commands
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
