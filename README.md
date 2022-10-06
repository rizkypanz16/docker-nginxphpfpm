##image information
base image : nginx:1.20.1

##build image

$ docker build -t nginxphpfpm .

##running image

$ docker run -it --name <container_name> -d -p 80:80 nginxphpfpm
