# docker-mysql-s3-backup

Runs `mysqldump` and pipes the output to AWS S3 using `s3cmd`.

## Configuration

| Environement          | default         |
|-----------------------|-----------------|
| SCHEDULE              | `* * * * *`     |
| TZ                    | America/Toronto |
| MYSQL_HOST            | `127.0.0.1`     |
| MYSQL_USER            | `root`          |
| MYSQL_PASSWORD        | *required*      |
| MYSQL_DATABASE        | *required*      |
| AWS_ACCESS_KEY_ID     | *required*      |
| AWS_SECRET_ACCESS_KEY | *required*      |
| AWS_BUCKET_NAME       | *required*      |
| AWS_OBJECT_PATH       | `backup.sql`    |

## Examples

Using `docker-compose`:

```
version: '3'
services:
  mysql:
    image: mysql:latest
    ports:
      - 3306:3306
    environment:
      MYSQL_DATABASE: my_database
      MYSQL_ROOT_PASSWORD: ******

  backup:
    image: lracicot/mysql-s3-backup:latest
    links:
      - mysql
    environment:
      SCHEDULE: "* * * * *"
      MYSQL_HOST: 127.0.0.1
      MYSQL_USER: root
      MYSQL_PASSWORD: ******
      MYSQL_DATABASE: my_database
      AWS_ACCESS_KEY_ID: ******
      AWS_SECRET_ACCESS_KEY: ******
      AWS_BUCKET_NAME: my_bucket_name
      AWS_OBJECT_PATH: path/to/backup.sql
```

# Contributors
Special thanks to [PHPCreation Inc.](https://www.phpcreation.com)
