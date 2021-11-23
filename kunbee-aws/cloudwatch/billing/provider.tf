provider "aws" {
  region     = "eu-west-2"
  access_key = "AKIAQOCCNIKNEZSXWLED"
  secret_key = "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"

}

provider "aws" {
  alias      = "sns"
  region     = var.sns["region"]
  access_key = "AKIAQOCCNIKNEZSXWLED"
  secret_key = "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"

}