## UplLoad test picture into the Storage Bucket.
#resource "yandex_storage_object" "storage-object-picture" {
#  bucket     = yandex_storage_bucket.storage-bucket.bucket
#  access_key = yandex_storage_bucket.storage-bucket.access_key
#  secret_key = yandex_storage_bucket.storage-bucket.secret_key
#  key        = var.picture_key
#  source     = var.picture_source
#  acl        = "public-read"
#}
#
#resource "yandex_storage_object" "storage-object-index-html" {
#  bucket     = yandex_storage_bucket.storage-bucket.bucket
#  access_key = yandex_storage_bucket.storage-bucket.access_key
#  secret_key = yandex_storage_bucket.storage-bucket.secret_key
#  key        = var.index_html_key
#  source     = var.index_html_source
#  acl        = "public-read"
#}
