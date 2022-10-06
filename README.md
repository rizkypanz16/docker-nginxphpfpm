##build image

docker build -t nginxphpfpm .

##running image

docker run -it --name <container_name> -d -p 80:80 nginxphpfpm
