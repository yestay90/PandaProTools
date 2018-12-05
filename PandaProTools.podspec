#
# Be sure to run `pod lib lint PandaProTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'PandaProTools'
    s.version          = '0.1.8'
    s.summary          = 'Helper classes, managers, views for iOS Apps'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    TODO: Helper classes, managers, views for iOS Apps. Install library into project, so in order to have access for generic classes, views, managers, and so on
    DESC
    
    s.homepage         = 'https://github.com/yestay90/PandaProTools'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Yestay Muratov' => 'yestay90@gmail.com' }
    s.source           = { :git => 'https://github.com/yestay90/PandaProTools.git', :tag => s.version.to_s }
    s.swift_version      = '4.1'
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
    s.ios.deployment_target = '9.0'
    
    s.source_files = 'PandaProTools/Classes/**/*'
    
    # s.resource_bundles = {
    #   'PandaProTools' => ['PandaProTools/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
end
