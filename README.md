# ruby-tutorial

#dev-server
docker run -it --rm -p 3000:3000 -v $PWD/blog:/blog ruby-tutorial

#dev-terminal
docker run -it --rm -v $PWD/blog:/blog ruby-tutorial /bin/ash