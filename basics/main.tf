#####################################################################
# configure the docker client for terraform
# remember to enable the TLS port on the docker engine settings
#####################################################################
provider "docker" {
  version = "~> 2.2"
  host = "tcp://localhost:2375"
}


###################################
# Download the latest Ghost image
###################################
resource "docker_image" "image_id" {
  name = "${lookup(var.image_name, var.env)}"
}


#######################
# Start the Container
#######################
resource "docker_container" "container_id" {
  name  = "${lookup(var.container_name, var.env)}"
  image = "${docker_image.image_id.latest}"
  ports {
    internal = "${var.int_port}"
    external = "${lookup(var.ext_port, var.env)}"
  }
}