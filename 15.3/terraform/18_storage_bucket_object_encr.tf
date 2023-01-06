## UplLoad test picture into the Storage Bucket.
#resource "yandex_storage_object" "storage-object-encrypted-picture" {
#  bucket     = yandex_storage_bucket.storage-bucket-encrypted.bucket
#  access_key = yandex_storage_bucket.storage-bucket-encrypted.access_key
#  secret_key = yandex_storage_bucket.storage-bucket-encrypted.secret_key
#  key        = var.picture_key
#  source     = var.picture_source
#  acl        = "public-read"
#}
#
#resource "yandex_storage_object" "storage-object-encrypted-index-html" {
#  bucket     = yandex_storage_bucket.storage-bucket-encrypted.bucket
#  access_key = yandex_storage_bucket.storage-bucket-encrypted.access_key
#  secret_key = yandex_storage_bucket.storage-bucket-encrypted.secret_key
#  key        = var.index_html_key
#  source     = var.index_html_source
#  acl        = "public-read"
#}
