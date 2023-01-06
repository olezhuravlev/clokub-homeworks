# UplLoad test picture into the Storage Bucket.
resource "yandex_storage_object" "storage-object-picture" {
  bucket     = yandex_storage_bucket.storage-bucket-https.bucket
  access_key = yandex_storage_bucket.storage-bucket-https.access_key
  secret_key = yandex_storage_bucket.storage-bucket-https.secret_key
  key        = var.picture_key
  source     = var.picture_source
  acl        = "public-read"
}

resource "yandex_storage_object" "storage-object-index-html" {
  bucket     = yandex_storage_bucket.storage-bucket-https.bucket
  access_key = yandex_storage_bucket.storage-bucket-https.access_key
  secret_key = yandex_storage_bucket.storage-bucket-https.secret_key
  key        = var.index_html_key
  source     = var.index_html_source
  acl        = "public-read"
}

# Let's encrypt checking file.
#resource "yandex_storage_object" "lets-encrypt" {
#  bucket     = yandex_storage_bucket.storage-bucket-https.bucket
#  access_key = yandex_storage_bucket.storage-bucket-https.access_key
#  secret_key = yandex_storage_bucket.storage-bucket-https.secret_key
#  key        = ".well-known/acme-challenge/6VE3kGnt2Of-YosRKbHhJ3DinW8gO5YBlY3SbM6OqGM"
#  source     = "../certificates/6VE3kGnt2Of-YosRKbHhJ3DinW8gO5YBlY3SbM6OqGM"
#  acl        = "public-read"
#}
