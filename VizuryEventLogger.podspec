
Pod::Spec.new do |spec|

  spec.name         = "VizuryEventLogger"
  spec.version      = "1.3.0"
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
                    :http => 'https://github.com/ayon-affle/vizury-ios-sdk/blob/master/Frameworks/VizuryEventLogger/VizuryEventLogger.zip',
                    :tag => 'vizuryeventlogger-' + spec.version.to_s
                    }
                  
  s.ios.vendored_frameworks = 'VizuryEventLogger.framework'

end
