resource "kubernetes_namespace" "test" {
  metadata {
    name = var.namespace
    labels = {
      "app.kubernetes.io/managed-by" = "plural"
      "app.plural.sh/name" = "test"

    }
  }
}

