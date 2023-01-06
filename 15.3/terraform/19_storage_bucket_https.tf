# Create Storage Bucket.
resource "yandex_storage_bucket" "storage-bucket-https" {
  bucket     = var.bucket_https_id
  access_key = yandex_iam_service_account_static_access_key.storage-service-account-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.storage-service-account-static-key.secret_key

  anonymous_access_flags {
    read = true
    list = false
  }

  website {
    index_document = "index.html"
  }

#  https {
#    certificate_id = "fpqrtnsmru7llqroj0i2"
#  }
}
