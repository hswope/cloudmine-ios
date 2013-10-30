Pod::Spec.new do |s|
  s.name         = 'ArcwebCloudMine'
  s.version      = '1.5.10'
  s.license      = { :type => 'BSD', :file => 'LICENSE'}
  s.homepage     = 'http://www.arcweb.co'
  s.authors      = { 'Howard Swope' => 'howard@arcweb.co' }
  s.summary      = 'Fork of the CloudMine iOS library supporting Arcweb specific needs'
  s.source       = { :git => 'https://github.com/hswope/cloudmine-ios.git', :tag => "#{s.version}" }
  s.source_files = 'ios/ios/**/*.{h,m}'
  s.prefix_header_file = 'ios/ios/cloudmine-ios-Prefix.pch'
  s.platform     = :ios
  s.ios.deployment_target = "6.0"
  s.dependency 'AFNetworking', '0.10.1'
  s.dependency 'MAObjCRuntime', '~> 0.0.1'
  s.dependency 'SPSuccinct', '~> 1.0.1'
  s.dependency 'yajl', '1.0.12'
  s.dependency 'yajl-objc', '~>0.2.27'
  s.dependency 'NSData+Base64', '~> 1.0.0'
  s.requires_arc = true
end

