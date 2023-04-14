
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.1"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}


resource "docker_image" "image" {
  name = "mikaelkrief/demobook:latest"
}

resource "docker_container" "container" {
  name  = "demo"
  image = docker_image.image.image_id
}