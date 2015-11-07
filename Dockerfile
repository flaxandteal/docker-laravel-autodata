FROM dylanlindgren/docker-laravel-data

RUN apt-get update && apt-get install -y python-pip

RUN pip install awscli

COPY initialize.sh /

CMD ["/initialize.sh"]
