Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "TwitterJSON"
s.summary = "Simple integration with Twitter REST api."
s.requires_arc = true

s.version = "1.0.0"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Kyle Goslan" => "kylegoslan@me.com" }
s.social_media_url = 'https://twitter.com/kylegoslan'
s.homepage = "https://github.com/KyleGoslan/TwitterJSON"
s.source = { :git => "https://github.com/KyleGoslan/TwitterJSON.git", :tag => "#{s.version}"}

s.frameworks = "Foundation", "UIKit"
s.dependency 'Alamofire', '~> 4.0'
s.dependency 'SwiftyJSON', '= 3.1.1'
s.source_files = "TwitterJSON"

end
