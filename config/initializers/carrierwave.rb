CarrierWave.configure do |config|
    config.fog_credentials = {
        provider:                         'Google',
        google_storage_access_key_id:     'GOOGIS6SSEOALKH4HAGR3NCF',
        google_storage_secret_access_key: 'jBcti0WikiVdwfls7Ba8LUFVTDDP/bW2RxoX7gUW'    
    }
    config.fog_directory = 'bucket-libro-rails-2'
end