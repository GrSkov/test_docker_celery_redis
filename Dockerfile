FROM python:3.9-alpine3.16

COPY requirements.txt /temp/requirements.txt

RUN apk add postgresql-client build-base postgresql-dev

RUN pip install -r /temp/requirements.txt

RUN adduser --disabled-password test-user

COPY main_dir /main_dir
WORKDIR /main_dir
EXPOSE 8000

USER test-user