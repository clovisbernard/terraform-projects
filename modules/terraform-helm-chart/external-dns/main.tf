# Resource: Helm Release 
resource "helm_release" "external_dns" {
  # depends_on = [aws_iam_role.external-dns]
  name       = "external-dns"   #var.external-dns-ns

  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"

  namespace = "external-dns"  #var.external-dns-ns

  set {
    name  = "image.repository"
    value = "registry.k8s.io/external-dns/external-dns"    #"k8s.gcr.io/external-dns/external-dns"
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "external-dns-sa"   #var.external-dns-sa
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = "arn:aws:iam::410052665018:role/2526-dev-alpha-external-dns-iam-role"    #aws_iam_role.external-dns.arn
  }

  set {
    name  = "provider"
    value = "aws"
  }

  set {
    name  = "policy" # Default is "upsert-only" which means DNS records will not get deleted even equivalent Ingress resources are deleted (https://github.com/kubernetes-sigs/external-dns/tree/master/charts/external-dns)
    value = "sync"   # "sync" will ensure that when ingress resource is deleted, equivalent DNS record in Route53 will get deleted
  }
}
