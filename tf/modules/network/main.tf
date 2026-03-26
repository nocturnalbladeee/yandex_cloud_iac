resource "yandex_vpc_network" "this" {
  name = var.name
}

resource "yandex_vpc_subnet" "this" {
  name           = var.name
  zone           = var.zone
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = var.v4_cidr_blocks
}

resource "yandex_vpc_default_security_group" "this" {
  count = var.create_default_sg ? 1 : 0

  network_id = yandex_vpc_network.this.id

  ingress {
    description    = "SSH access"
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "HTTP access"
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "HTTPS access"
    protocol       = "TCP"
    port           = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "DB access"
    protocol       = "TCP"
    port           = 6432
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description    = "All outbound traffic"
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  labels = var.labels
}

resource "yandex_vpc_security_group" "gitlab" {
  count = var.create_gitlab_sg ? 1 : 0

  name        = "${var.name}-gitlab-sg"
  description = "Security group for GitLab"
  network_id  = yandex_vpc_network.this.id

  ingress {
    description    = "SSH for Git operations"
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "HTTP access"
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "HTTPS access"
    protocol       = "TCP"
    port           = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    description    = "All outbound traffic"
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  labels = var.labels
}

resource "yandex_vpc_security_group" "kubernetes" {
  count = var.create_k8s_sg ? 1 : 0

  name        = "${var.name}-k8s-sg"
  description = "Security group for Kubernetes cluster"
  network_id  = yandex_vpc_network.this.id

  ingress {
    description    = "Kubernetes API"
    protocol       = "TCP"
    port           = 6443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description       = "Internal cluster communication"
    protocol          = "ANY"
    predefined_target = "self_security_group"
    from_port         = 0
    to_port           = 65535
  }
  ingress {
    description    = "Webhook"
    protocol       = "ANY"
    port           = 10250
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description    = "SSH to nodes"
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "HTTPS to nodes"
    protocol       = "TCP"
    port           = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description    = "All outbound traffic"
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  labels = var.labels
}

resource "yandex_vpc_security_group" "k8s_nodes" {
  count      = var.create_k8s_node_sg ? 1 : 0
  name       = "${var.name}-k8s-nodes-sg"
  network_id = yandex_vpc_network.this.id

  ingress {
    description    = "NLB Health Checks"
    protocol       = "TCP"
    from_port      = 0
    to_port        = 65535
    v4_cidr_blocks = ["198.18.235.0/24", "198.18.248.0/24"]
  }

  ingress {
    description    = "Inbound HTTP/HTTPS"
    protocol       = "TCP"
    from_port      = 80
    to_port        = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "Webhook"
    protocol       = "ANY"
    port           = 10250
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "NodePort range"
    protocol       = "TCP"
    from_port      = 30000
    to_port        = 32767
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "Allow ingress-nginx admission webhook"
    protocol       = "TCP"
    port           = 8443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description       = "Internal communication"
    protocol          = "ANY"
    predefined_target = "self_security_group"
  }

  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
