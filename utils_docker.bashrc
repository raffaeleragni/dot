servestatic() {
  docker run -it --rm -v$PWD:/usr/share/nginx/html -p8080:80 nginx
}
