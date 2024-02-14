# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

COPY ./app /app
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt

ENV PORT 5000

# Pipiline commands
CMD ["python3", "app.py"]
