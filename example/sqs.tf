module "example_sqs" {
  # remember to check the latest version
  # source = "github.com/ministryofjustice/cloud-platform-terraform-sqs?ref=4.9.1"
  source = "../"

  sqs_name = "example_sqs_name"
  # if true, the sqs_name will automatically have ".fifo" appended to its name, which is an API naming requirement
  fifo_queue             = false
  team_name              = var.team_name
  business-unit          = var.business_unit
  application            = var.application
  is-production          = var.is_production
  environment-name       = var.environment_name
  infrastructure-support = var.infrastructure_support
  namespace              = var.namespace

  # Set encrypt_sqs_kms = "true", to enable SSE for SQS using KMS key.
  encrypt_sqs_kms = "false"

  # existing_user_name     = module.another_sqs_instance.user_name

  providers = {
    aws = aws.london
  }
}

resource "kubernetes_secret" "example_sqs" {
  metadata {
    name      = "example-sqs"
    namespace = var.namespace
  }

  data = {
    access_key_id     = module.example_sqs.access_key_id
    secret_access_key = module.example_sqs.secret_access_key
    # the above will not be set if existing_user_name is defined
    sqs_id   = module.example_sqs.sqs_id
    sqs_arn  = module.example_sqs.sqs_arn
    sqs_name = module.example_sqs.sqs_name
  }
}

