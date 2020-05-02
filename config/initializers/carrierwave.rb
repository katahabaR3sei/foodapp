unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAYDYGMJ4S3ZPQHOMY',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'rails-photo-yutaro'
    config.cache_storage = :fog
    config.fog_public = false
  end
end