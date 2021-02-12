variable "r-service-port"{ default = 8000 }
variable "r-service-name"{ default = "r-service:latest" }
variable "r-service-network"{ default = "otus-api-network" }

resource "docker_image" "r-service" { name = var.r-service-name }

resource "null_resource" "network-creation" {
  provisioner "local-exec" {
    command = "docker network create ${var.r-service-network}"
    on_failure = continue
  }
}

resource "null_resource" "r-service-container-removal" {
  provisioner "local-exec" {
    command = "docker stop r-service"
    on_failure = continue
  }
  provisioner "local-exec" {
    command = "docker rm r-service"
    on_failure = continue
  }
}

resource "docker_container" "r-service" {
  depends_on = [null_resource.r-service-container-removal]
  name = "r-service"
  image = docker_image.r-service.name
  restart = "always"
  ports {
    internal = 8000
    external = var.r-service-port
  }
  networks_advanced {
    name = var.r-service-network
  }
}