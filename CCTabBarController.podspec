Pod::Spec.new do |s|
  s.name             = "CCTabBarController"
  s.version          = "0.1.0"
  s.summary          = "CCTabBarController is a highly customizable tab bar controller."

  s.description      = <<-DESC
CCTabBarController reimplement UITabBarController with a easier customized CCTabBar. It providing a lots of convinient methods to help you customize tab bar.
                       DESC

  s.homepage         = "https://github.com/draveness/CCTabBarController"
  s.license          = 'MIT'
  s.author           = { "Draveness" => "stark.draven@gmail.com" }
  s.source           = { :git => "https://github.com/draveness/CCTabBarController.git", :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'CCTabBarController' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Masonry'
end
