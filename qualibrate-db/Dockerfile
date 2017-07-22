FROM mysql:5.7.18

ADD init-db.sql /tmp/init-db.sql
VOLUME /var/lib/mysql

EXPOSE 3306

CMD ["mysqld"]
