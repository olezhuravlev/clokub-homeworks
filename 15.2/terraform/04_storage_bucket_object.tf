# UplLoad test picture into the Storage Bucket.
resource "yandex_storage_object" "storage-object" {
  bucket     = yandex_storage_bucket.storage-bucket.bucket
  access_key = yandex_storage_bucket.storage-bucket.access_key
  secret_key = yandex_storage_bucket.storage-bucket.secret_key
  key        = var.picture_key
  source     = var.picture_source
  acl        = "public-read"
}
