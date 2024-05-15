Pod::Spec.new do |s|
  s.name         = 'AWSS3'
  s.version      = '2.36.2'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.ios.deployment_target  = '14.0'
  s.osx.deployment_target  = '10.15'
  s.tvos.deployment_target  = '14.0'
  s.watchos.deployment_target  = '7.0'
  s.source       = { :git => 'https://github.com/signogy/aws-sdk-objc.git',
                     :tag => s.version}
  s.requires_arc = true
  s.dependency 'AWSCore', '2.36.2'
  s.source_files = 'AWSS3/*.{h,m}'
  s.resource_bundle = { 'AWSS3' => ['AWSS3/PrivacyInfo.xcprivacy']}
end
