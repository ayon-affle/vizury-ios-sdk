
Pod::Spec.new do |s|

 s.name         = "VizuryEventLogger"
 s.version      = "1.6.1"
 s.summary      = "Vizury Event Logger for iOS"
 s.description  = <<-DESC
                    Vizury is a mobile marketing automation company. This framework helps to track events of users.
                    DESC

 s.homepage     = "https://affle.com"
 s.documentation_url = 'https://github.com/ayon-affle/vizury-ios-sdk'
 s.license      = { :type => 'Commercial', :file => 'LICENSE' }
 s.author       = { 'Ayon Chowdhury' => 'ayon.chowdhury@affle.com' }
 s.platform     = :ios
 s.ios.deployment_target = '9.0'

 s.source       = {
                        :git => 'https://github.com/ayon-affle/vizury-ios-sdk.git',
                        :tag => 'vizuryeventlogger-' + s.version.to_s
                    }

 s.ios.vendored_frameworks = 'Frameworks/VizuryEventLogger.framework'
 s.preserve_paths =  'Frameworks/VizuryEventLogger.framework'
 #s.module_map = 'Frameworks/VizuryEventLogger.framework/Modules/module.modulemap'

 s.requires_arc = true
 s.frameworks = 'Foundation', 'UIKit', 'SystemConfiguration' , 'Security'
 s.weak_framework = 'UserNotifications',  'WebKit'
 s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
 s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
 
 s.static_framework = true
 s.dependency 'Protobuf'
 
end
