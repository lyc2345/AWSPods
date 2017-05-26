#
# Be sure to run `pod lib lint AWSPods.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AWSPods'
  s.version          = '0.1.0'
  s.summary          = 'A short description of AWSPods.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/lyc2345/AWSPods'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lyc2345' => 'lyc2345@gmail.com' }
  s.source           = { :git => 'https://github.com/lyc2345/AWSPods.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  
  # s.resource_bundles = {
  #   'AWSPods' => ['AWSPods/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.resource_bundles        = { 'AWSUtiles' => [ 'AWSPods/**/*.{png,storyboard,lproj}' ] }
  #s.source_files            = 'AWSPods/Classes/**/*', '*.framework/headers/*.h'
  s.source_files            = 'AWSPods/Classes/**/*'

  s.ios.dependency 'AWSCognito'
  s.ios.dependency 'AWSCognitoIdentityProvider'
  s.ios.dependency 'AWSDynamoDB'
  s.ios.dependency 'AWSCore'
  s.ios.dependency 'DS'
  s.ios.dependency 'AFNetworking', '~> 3.0'
  s.ios.dependency 'SAMKeychain'

end
