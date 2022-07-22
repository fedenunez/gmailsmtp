
# Description

A docker image with a configured postfix daemon that will relay any locally received email from $USER to gmail SMTP server using $USER:$PASSWORD gmail account.

# Usage
docker run -t -i -e USER=user@your-lovely-domain.com -e PASSWORD=YourLovelyPass fedenunez/gmailstmp

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
docker build -t fedenunez/gmailstmp .
