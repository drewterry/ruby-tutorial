# ruby-tutorial
http://guides.rubyonrails.org/getting_started.html

#build-container
docker build -t ruby-tutorial .

#dev-server
docker run -it --rm -p 3000:3000 -v $PWD/blog:/blog ruby-tutorial

#dev-terminal
docker run -it --rm -v $PWD/blog:/blog ruby-tutorial /bin/ash