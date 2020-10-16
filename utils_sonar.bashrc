#!/bin/bash

sonarupdate() {
  docker stop sonar
  docker rm sonar
  docker pull sonarqube
  docker run -d --name sonar -p 9000:9000 --restart always sonarqube
}

