FROM postgres

WORKDIR /usr/app

ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB gs_money_db_dev
