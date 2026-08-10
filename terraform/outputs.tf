output "namespace" {
  value = kubernetes_namespace.app_namespace.metadata[0].name
}

output "service_name" {
  value = kubernetes_service.mini_devops_service.metadata[0].name
}

output "application_url" {
  value = "http://localhost:30080"
}