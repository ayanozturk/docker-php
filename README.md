## Example use of this docker image

Add `docker-compose.yml` into root of a Symfony project:

```yaml
version: '3'

services:
  web:
    image: ayanozturk/php-generic:latest
    volumes:
      - .:/var/www/html
    ports:
      - '8001:80'
    depends_on:
      - db

  db:
    image: mysql:5
    ports:
      - "3308:3306"
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: myapp
```
