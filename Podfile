platform :ios, '8.0'
use_frameworks!

target 'TwitterJSON' do
    pod 'Alamofire', '~> 4.0'
    pod 'SwiftyJSON' , '= 3.1.1'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
end
