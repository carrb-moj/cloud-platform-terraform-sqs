provider "aws" {
  region = "eu-west-2"
}

provider "aws" {
  alias  = "ireland"
  region = "eu-west-1"
}

provider "aws" {
  alias  = "london"
  region = "eu-west-2"
}

