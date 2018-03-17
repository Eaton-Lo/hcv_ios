source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8'
use_frameworks!

def pod_list
  pod 'Alamofire', '~> 4.0'
  pod 'SwiftyJSON'
  pod 'SwiftSpinner'
end

target 'MlIosApp' do
  pod_list
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end