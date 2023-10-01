# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

# Current directory that Dockerfile is in is copied to root in container
COPY ./app /app
RUN pip install -r requirements.txt
WORKDIR /app

# Pipiline commands
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
