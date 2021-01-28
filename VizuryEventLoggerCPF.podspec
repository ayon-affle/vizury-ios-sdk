
Pod::Spec.new do |spec|

 spec.name         = "VizuryEventLoggerCPF"
 spec.version      = "1.2.1"
 spec.summary      = "Vizury Event Logger for CPF"
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
                        :tag => 'vizuryeventloggercpf-' + spec.version.to_s
                    }

 spec.ios.vendored_frameworks = 'Frameworks/VizuryEventLoggerCPF/VizuryEventLogger.framework'
 spec.preserve_paths =  'Frameworks/VizuryEventLoggerCPF/VizuryEventLogger.framework'
 spec.module_map = 'Frameworks/VizuryEventLoggerCPF/VizuryEventLogger.framework/Modules/module.modulemap'

 spec.requires_arc = true
 spec.frameworks = 'Foundation', 'UIKit', 'SystemConfiguration', 'Security'
 spec.weak_framework = 'UserNotifications', 'UserNotificationsUI',  'WebKit'
 
 spec.xcconfig = {
    'ENABLE_BITCODE' => 'NO'
 }

 spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
 spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

 spec.static_framework = false
 
end
