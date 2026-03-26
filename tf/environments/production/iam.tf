module "iam" {
  source = "../../modules/iam"
  folder_id = var.folder_id
  
  service_accounts = {
    k8s = {
      name        = "k8s-iam-prod"
      description = "Service account for Kubernetes cluster"
      roles       = [
        "editor",
        "k8s.clusters.agent",
        "load-balancer.admin",
        "vpc.publicAdmin"
      ]
    }
    gitlab = {
      name        = "${var.project_name}-gitlab-sa"
      description = "Service account for GitLab integration"
      roles       = [
        "container-registry.images.pusher",
        "container-registry.images.puller"
      ]
    }
    eso = {
      name        = "${var.project_name}-eso-sa"
      description = "Service account for External Secrets Operator"
      roles       = ["lockbox.payloadViewer",
                     "lockbox.editor",
                     "certificate-manager.certificates.downloader"]
    }
    cert_manager = {
      name        = "${var.project_name}-cert-manager-sa"
      description = "Service account for cert-manager DNS challenges"
      roles       = ["dns.editor"]
    }
  }
}