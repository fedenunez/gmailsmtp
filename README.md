
# Description

A docker image with an SMTP server running on port 25 (postfix) that relays all incoming emails through a gmail email account using the gmail SMTP server. 

The account is defined by the ``$USER`` and ``$PASSWORD`` environment variables.


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
