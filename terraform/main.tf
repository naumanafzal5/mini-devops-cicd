terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.35"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = "devops-demo"
  }
}

resource "kubernetes_deployment" "mini_devops_app" {
  metadata {
    name      = "mini-devops-app"
    namespace = kubernetes_namespace.app_namespace.metadata[0].name

    labels = {
      app = "mini-devops-app"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "mini-devops-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "mini-devops-app"
        }
      }

      spec {
        container {
          name  = "mini-devops-app"
          image = "naumanafzal5/mini-devops-app:latest"

          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "mini_devops_service" {
  metadata {
    name      = "mini-devops-service"
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
  }

  spec {
    selector = {
      app = "mini-devops-app"
    }

    port {
      port        = 80
      target_port = 3000
      node_port   = 30080
    }

    type = "NodePort"
  }
}