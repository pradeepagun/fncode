#Dockerfile
FROM alpine:latest
FROM php:7.4-cli
#Install hotwrap binary in your container
COPY --from=fnproject/hotwrap:latest    /hotwrap    /hotwrap
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
# Run the PHP code
CMD [ "php", "./hello.php"]
# Update entrypoint to use hotwrap, this will wrap your command
ENTRYPOINT ["/hotwrap"]