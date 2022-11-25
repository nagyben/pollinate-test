variable "region" {
    description = "The default GCP region to deploy services in"
    default = "europe-west2" // europe-west2 = London
}

variable "api_image" {
    description = "The cloud run image to deploy"
}