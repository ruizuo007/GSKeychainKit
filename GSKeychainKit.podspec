#
# Be sure to run `pod lib lint GSKeychainKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GSKeychainKit'
  s.version          = '0.1.1'
  s.summary          = 'A convenient and fast tool for using iOS keychain.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                       A convenient and fast tool for using iOS keychain
                       DESC

  s.homepage         = 'https://github.com/ruizuo007/GSKeychainKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ruizuo007' => 'ruizuo007@gmail.com' }
  s.source           = { :git => 'https://github.com/ruizuo007/GSKeychainKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ruizuo007'

  s.ios.deployment_target = '7.0'

  s.source_files = 'GSKeychainKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GSKeychainKit' => ['GSKeychainKit/Assets/*.png']
  # }

  s.public_header_files = 'GSKeychainKit/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
