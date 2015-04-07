Fog.credentials = { path_style: true }

FOG_CONNECTION = Fog::Storage.new({
  provider:              'AWS',
  aws_access_key_id:     JiffyBag['AWS_ACCESS_KEY'],
  aws_secret_access_key: JiffyBag['AWS_SECRET_ACCESS_KEY'],
  region:                'eu-west-1'
})
