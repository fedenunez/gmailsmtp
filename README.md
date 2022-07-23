
# Description

A docker image that will open a SMTP server on port 25 (using postfix) that will relay the emails of a gmail account through the gmail SMTP server using a secure connection. The account is defined by the environmental variables ```$USER``` and ```$PASSWORD```.


# Usage

```
docker run -t -i -e USER=user@your-lovely-domain.com -e PASSWORD=YourLovelyPass fedenunez/gmailsmtp
```

# docker-compose service definition

```
services:
  gmailrelay:
    image: fedenunez/gmailsmtp
    environment:
      USER: user@your-lovely-domain.com
      PASSWORD: YourLovelyPass
```

# Build

```
docker build -t fedenunez/gmailsmtp .
```
