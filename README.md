Dockerized Glutz E-Access Server

Server can be accessed using the alias <glutz> for example: <br>

`glutz --help`

Environment variables: <br>

DOWNLOAD_LINK="https://glutz.com/service/downloads/?dwnldid=97483" <br>
DB_NAME="database.gax"


Place existing database into db-data folder and adjust the environment
var accordingly in the `docker-compose.yml` file.