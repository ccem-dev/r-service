###############################################
###               Variables                 ###
###############################################
variable "r-service-dockerfile" {
  default = "."
}
variable "r-service-name" {
  default = "r-service"
}

#################################################
### R-SERVICE : Build Image Service ###
#################################################
resource "null_resource" "r-service" {
  provisioner "local-exec" {
    command = "docker build -t ${var.r-service-name} ${var.r-service-dockerfile}"
  }
}