
Pod::Spec.new do |spec|

 spec.name         = "VizuryEventLoggerReact"
 spec.version      = "1.0.4"
 spec.summary      = "Vizury Event Logger for React Native"
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
                        :tag => 'vizuryeventloggerreact-' + spec.version.to_s
                    }

 spec.ios.vendored_frameworks = 'Frameworks/VizuryEventLoggerReact/VizuryEventLogger.framework'
 spec.preserve_paths =  'Frameworks/VizuryEventLoggerReact/VizuryEventLogger.framework'
 spec.module_map = 'Frameworks/VizuryEventLoggerReact/VizuryEventLogger.framework/Modules/module.modulemap'

 spec.requires_arc = true
 spec.frameworks = 'Foundation', 'UIKit', 'SystemConfiguration' , 'Security'
 spec.weak_framework = 'UserNotifications',  'WebKit'
 
 spec.xcconfig = {
    'ENABLE_BITCODE' => 'NO'
 }

 
end
