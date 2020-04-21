
Pod::Spec.new do |s|

  s.name             = 'VizuryRichNotification'
  s.version          = '1.0.0'
  s.summary          = 'Vizury Rich Notifications for iOS.'

  s.description  = <<-DESC
                   VizuryRichNotification helps you to make use Notification Service Extensions to support media in notifications(Rich Push Notifications).
                   DESC

  s.homepage     = 'https://www.vizury.com'
  s.documentation_url = 'https://github.com/ayon-affle/vizury-ios-sdk'

  s.license      = { :type => 'Commercial', :file => 'LICENSE' }
  s.author       = { 'Anurag Bhowmick' => 'anurag.bhowmick@affle.com' }
  s.platform     = :ios
  s.ios.deployment_target = '9.0'
  s.source           = {
      :git => 'https://github.com/ayon-affle/vizury-ios-sdk.git',
      :tag => 'richPush-' + s.version.to_s
  }


  s.ios.vendored_frameworks = 'Frameworks/VizuryRichNotification/VizuryRichNotification.framework'
  s.preserve_paths = 'Frameworks/VizuryRichNotification/VizuryRichNotification.framework'
  s.module_map = 'Frameworks/VizuryRichNotification/VizuryRichNotification.framework/Modules/module.modulemap'

  s.requires_arc = true
  s.frameworks = 'Foundation', 'UIKit', 'UserNotifications'

end
