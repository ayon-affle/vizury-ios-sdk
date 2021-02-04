
Pod::Spec.new do |spec|

 spec.name         = "VizuryEventLoggerUniversal"
 spec.version      = "1.5.3"
 spec.summary      = "Vizury Event Logger for iOS"
 spec.description  = <<-DESC
                    Vizury is a mobile marketing automation company. This framework helps to track events of users.
                    DESC

 spec.homepage     = "https://affle.com"
 spec.documentation_url = 'https://github.com/ayon-affle/vizury-ios-sdk'
 spec.license      = { :type => 'Commercial', :file => 'LICENSE' }
 spec.author       = { 'Ayon Chowdhury' => 'ayon.chowdhury@affle.com' }
 spec.platform     = :ios
 spec.ios.deployment_target = '9.0'

 spec.source       = {
                        :git => 'https://github.com/ayon-affle/vizury-ios-sdk.git',
                        :tag => 'vizuryeventloggeruniversal-' + spec.version.to_s
                    }

 spec.ios.vendored_frameworks = 'Frameworks/VizuryEventLoggerUniversal/VizuryEventLogger.framework'
 spec.preserve_paths =  'Frameworks/VizuryEventLoggerUniversal/VizuryEventLogger.framework'
 spec.module_map = 'Frameworks/VizuryEventLoggerUniversal/VizuryEventLogger.framework/Modules/module.modulemap'

 spec.requires_arc = true
 spec.frameworks = 'Foundation', 'UIKit', 'SystemConfiguration' , 'Security'
 spec.weak_framework = 'UserNotifications',  'WebKit'
 spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
 spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
 spec.static_framework = true
 
end
