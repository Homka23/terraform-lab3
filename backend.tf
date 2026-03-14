terraform {
  backend "gcs" {
    bucket = "tf-state-lab3-khomutnyk-anna-10"
    prefix = "env/dev/var-10.tfstate"
  }
}