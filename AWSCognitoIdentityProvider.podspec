Pod::Spec.new do |s|

  s.name         = 'AWSCognitoIdentityProvider'
  s.version      = '2.4.7'
  s.summary      = 'Amazon Cognito Identity Provider SDK for iOS'

  s.description  = 'Amazon Cognito Identity Provider enables sign up and authentication of your end users'

  s.homepage     = 'http://aws.amazon.com/cognito'
  s.license      = 'Amazon Software License'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.source       = { :git => 'https://github.com/bvjustin/aws-sdk-objc.git',
                     :tag => s.version}
  s.requires_arc = true
  s.dependency 'AWSCore', '2.4.7'

  s.source_files = 'AWSCognitoIdentityProvider/**/*.{h,m,c}'
  s.public_header_files = 'AWSCognitoIdentityProvider/*.h', 'AWSCognitoIdentityProvider/CognitoIdentityProvider/*.h'
  s.private_header_files = 'AWSCognitoIdentityProvider/Internal/*.h'
end
