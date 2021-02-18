Pod::Spec.new do |s|
  s.name         = 'AWSS3'
  s.version      = '2.22.3'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platforms: {
    "iOS": "14.0",
    "watchos": "7.0"
    "tvOS": "14.0"
    "macOS": "10.15"
  }
  s.source       = { :git => 'https://github.com/signogy/aws-sdk-objc.git',
                     :tag => s.version}
  s.requires_arc = true
  s.dependency 'AWSCore', '2.22.3'
  s.source_files = 'AWSS3/*.{h,m}'
end
