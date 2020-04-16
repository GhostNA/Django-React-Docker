FROM python:3.8

WORKDIR /app/

COPY ./app /app

RUN pip install -r requirements.txt

ENV PYTHONPATH=/app
ENV PTVSD_DEBUG 1

EXPOSE 80
