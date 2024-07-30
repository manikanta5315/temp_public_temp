FROM ubuntu
EXPOSE 80
WORKDIR var/www/html
RUN apt-get update && apt-get install apache2 -y && apt-get clean
CMD ["apache2", "-D", "demon off"]
COPY index.html