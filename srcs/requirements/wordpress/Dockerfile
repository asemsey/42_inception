FROM debian:bullseye
WORKDIR /wordpress
# COPY . .
RUN wp core download --path=wp --locale=de_DE
RUN wp config create --dbname=cooldatabase --dbuser=asemsey --prompt=dbpass
RUN wp db create
RUN wp core install --url=wpclidemo.dev --title="demooo" --admin_user=hello --admin_password=hello

EXPOSE 443
# CMD ["", ""]


# 	Configure Web Server (Apache or Nginx):
# 	Install and configure a web server to serve the WordPress application.
# 	Ensure the web server is set to start when the container runs.
# 	Set up the web server to point to the WordPress directory.

# 	Set Up Environment Variables:
# 	Define any environment variables needed for WordPress to connect to the database.

# 	Expose Necessary Ports:
# 	Expose the port(s) on which your web server will listen (commonly port 80 or 443 for HTTP/HTTPS).

# 	Define the Startup Command:
# 	Specify the command to start the web server and any necessary services.