# r-service

* _Build_ da imagem: ( no diretório do Dockerfile ) 
> docker build -t r-service:latest . # Não se esqueça do "." no final do comando, ele indica que é o diretório atual.

* _Run container_: 
> docker rm -f r-service >/dev/null 2>&1; \
> docker run --name r-service -p 8000:8000 --restart always -d r-service:latest
