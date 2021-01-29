# r-service

* _Build_ da imagem: ( no diretório do Dockerfile ) 
> docker build -t r-service:0.0.0 .

* _Run container_: 
> docker rm -f r-service >/dev/null 2>&1; \
> docker run --name r-service -p 8000:8000 --restart always -d r-service:0.0.0