FROM alpine:3.10 as builder

RUN apk --update add unzip
COPY ./*.zip /app/site.zip

WORKDIR /app
RUN unzip site.zip
RUN rm site.zip


FROM httpd:alpine

COPY --from=builder /app /usr/local/apache2/htdocs/

EXPOSE 80