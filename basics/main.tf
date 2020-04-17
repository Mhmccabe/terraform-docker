provider "docker" {
  version = "~> 2.2"
  host = "tcp://localhost:2375"
}

resource "docker_image" "image_id" {
  name = "ghost:latest"
}
