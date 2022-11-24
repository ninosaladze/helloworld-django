FROM public.ecr.aws/docker/library/python:3.6.12
ENV MICRO_SERVICE=/home/app
RUN mkdir -p $MICRO_SERVICE
RUN mkdir -p $MICRO_SERVICE/static
WORKDIR $MICRO_SERVICE
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN apt-get update \
    && apt-get install -y --no-install-recommends libpq-dev python3-dev python3-pip gcc
RUN pip install --upgrade pip
COPY . $MICRO_SERVICE
RUN pip install -r requirements.txt
CMD ["uwsgi", "--ini", "website.ini"]
