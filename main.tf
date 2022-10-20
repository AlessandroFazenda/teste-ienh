# Declaring the Required provider (Docker provider)
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

# Specifying the Docker provider configuration
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_container" "app1" {
  image = "php-app:latest"
  name  = "app1"
  restart = "always"
  ports {
    internal = 80
    external = 8081
  }
}

resource "docker_container" "app2" {
  image = "php-app:latest"
  name  = "app2"
  restart = "always"
  ports {
    internal = 80
    external = 8082
  }
}

resource "docker_container" "loadbalancer" {
  image = "nginx-lb:latest"
  name  = "loadbalancer"
  restart = "always"
  ports {
    internal = 80
    external = 80
  }
}
