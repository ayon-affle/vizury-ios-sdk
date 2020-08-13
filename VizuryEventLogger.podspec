
Pod::Spec.new do |spec|

 spec.name         = "VizuryEventLogger"
 spec.version      = "1.3.9"
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
                        :tag => 'vizuryeventlogger-' + spec.version.to_s
                    }

 spec.ios.vendored_frameworks = 'Frameworks/VizuryEventLogger/VizuryEventLogger.framework'
 spec.preserve_paths =  'Frameworks/VizuryEventLogger/VizuryEventLogger.framework'
 spec.module_map = 'Frameworks/VizuryEventLogger/VizuryEventLogger.framework/Modules/module.modulemap'

 spec.requires_arc = true
 spec.frameworks = 'Foundation', 'UIKit', 'SystemConfiguration' , 'Security'
 spec.weak_framework = 'UserNotifications',  'WebKit'
 
end
