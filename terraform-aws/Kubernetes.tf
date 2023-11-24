resource "kubernetes_deployment" "java" {
  metadata {
    name = "microservice-deployment"
    labels = {
      app = "java-microservice"
    }
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "java-microservice"
      }
    }
    template {
      metadata {
        labels = {
          app = "java-microservice"
        }
      }
      spec {
        container {
          image = "200945303249.dkr.ecr.us-east-1.amazonaws.com/petclinic-imagetest-2"
          name  = "java-microservice-container"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}
resource "kubernetes_service" "java" {
  depends_on = [kubernetes_deployment.java]
  metadata {
    name = "java-microservice-service"
  }
  spec {
    selector = {
      app = "java-microservice"
    }
    port {
      port        = 80
      target_port = 8080
    }
    type = "LoadBalancer"
  }
}