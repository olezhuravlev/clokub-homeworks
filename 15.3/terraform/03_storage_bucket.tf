## Create Storage Bucket.
#resource "yandex_storage_bucket" "storage-bucket" {
#  bucket     = var.bucket_id
#  access_key = yandex_iam_service_account_static_access_key.storage-service-account-static-key.access_key
#  secret_key = yandex_iam_service_account_static_access_key.storage-service-account-static-key.secret_key
#
#  anonymous_access_flags {
#    read = true
#    list = false
#  }
#
#  website {
#    index_document = "index.html"
#  }
#}
