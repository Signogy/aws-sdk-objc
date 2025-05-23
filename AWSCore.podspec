Pod::Spec.new do |s|

  s.name         = 'AWSCore'
  s.version      = '2.40.2'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.ios.deployment_target  = '14.0'
  s.osx.deployment_target  = '10.15'
  s.tvos.deployment_target = '14.0'
  s.watchos.deployment_target = '7.0'
  s.source       = { :git => 'https://github.com/signogy/aws-sdk-objc.git',
                     :tag => s.version}

  s.frameworks   = 'CoreGraphics', 'Foundation', 'SystemConfiguration', 'Security'
  s.libraries    = 'z', 'sqlite3'
  s.requires_arc = true

  s.source_files = 'AWSCore/*.{h,m}', 'AWSCore/**/*.{h,m}', 'AWSCore/Logging/Extensions/*.swift'
  s.private_header_files = 'AWSCore/XMLWriter/**/*.h', 'AWSCore/FMDB/AWSFMDatabase+Private.h', 'AWSCore/Fabric/*.h', 'AWSCore/Mantle/extobjc/*.h', 'AWSCore/CognitoIdentity/AWSCognitoIdentity+Fabric.h'
  s.resource_bundle = { 'AWSCore' => ['AWSCore/PrivacyInfo.xcprivacy']}
end
