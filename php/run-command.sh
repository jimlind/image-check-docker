#!/bin/sh
name="simple-docker-php"

docker run -t -w /src $name php run.php