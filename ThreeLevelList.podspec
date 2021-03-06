#
# Be sure to run `pod lib lint ThreeLevelList.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ThreeLevelList'
  s.version          = '0.1.0'
  s.summary          = '三级列表ThreeLevelList.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '这是一个三级列表的pod库'

  s.homepage         = 'https://github.com/cocoanerd/ThreeLevelList'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'cocoanerd' => 'cocoanerd@163.com' }
  s.source           = { :git => 'https://github.com/cocoanerd/ThreeLevelList.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  
  s.swift_version = '5.0'

  s.source_files = 'ThreeLevelList/*.swift'
  
  # s.resource_bundles = {
  #   'ThreeLevelList' => ['ThreeLevelList/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
