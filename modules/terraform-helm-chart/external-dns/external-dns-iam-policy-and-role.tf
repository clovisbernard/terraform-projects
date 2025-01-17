# resource "aws_iam_role" "external-dns" {
#   name = "${data.aws_eks_cluster.example.name}-external-dns-iam-role"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRoleWithWebIdentity"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Federated = join("/", ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider", split("https://", data.aws_eks_cluster.example.identity.0.oidc.0.issuer)[1]])
#         }
#         Condition = {
#           StringEquals = {
#             join(":", [split("https://", data.aws_eks_cluster.example.identity.0.oidc.0.issuer)[1], "sub"]) : "system:serviceaccount:${var.external-dns-ns}:${var.external-dns-sa}"
#           }
#         }
#       },
#     ]
#   })

#   tags = {
#     tag-key = "${data.aws_eks_cluster.example.id}-external-dns-iam-role"
#   }
# }

resource "aws_iam_policy" "external-dns-polcy" {
  name        = "external-dns-polcy"
  path        = "/"
  description = "External DNS IAM Policy"
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "route53:ChangeResourceRecordSets"
          ],
          "Resource" : [
            "arn:aws:route53:::hostedzone/*"
          ]
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "route53:ListHostedZones",
            "route53:ListResourceRecordSets"
          ],
          "Resource" : [
            "*"
          ]
        }
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "external-dns_attach" {
  role       = aws_iam_role.external_dns.name
  policy_arn = aws_iam_policy.external-dns-polcy.arn
}



resource "aws_iam_role" "external_dns" {
  name = "${data.aws_eks_cluster.example.name}-external-dns-iam-role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"  # Open assume_role_policy
    Statement = [  # Open Statement array
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Sid    = ""
        Principal = {  # Open Principal object
          Federated = join("/", ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider", split("https://", data.aws_eks_cluster.example.identity.0.oidc.0.issuer)[1]])
        },  # Close Principal object
        Condition = {  # Open Condition object
          StringEquals = {  # Open StringEquals object
            "${split("https://", data.aws_eks_cluster.example.identity.0.oidc.0.issuer)[1]}:sub": "system:serviceaccount:external-dns:external-dns-sa"
          }  # Close StringEquals object
        }  # Close Condition object
      }  # Close Statement object
    ]  # Close Statement array
  })  # Close assume_role_policy
  
  tags = {  # Open tags object
    Name = "${data.aws_eks_cluster.example.name}-external-dns-iam-role"
    Environment = "production"  # You can add more specific tags based on your use case
  }  # Close tags object
}