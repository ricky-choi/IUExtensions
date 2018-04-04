Pod::Spec.new do |s|
  s.name                        = "IUExtensions"
  s.version                     = "0.2.1""
  s.summary                     = "Extensions for cocoa programming"
  s.homepage                    = "https://github.com/Ricky-Choi/IUExtensions"
  s.license                     = "MIT"
  s.author                      = { "Jaeyoung Choi" => "hideyf@gmail.com" }
  s.ios.deployment_target       = "8.0"
  s.osx.deployment_target       = "10.12"
  s.source                      = { :git => "https://github.com/Ricky-Choi/IUExtensions.git", :tag => "#{s.version}" }
  s.source_files                = "IUExtensions/*.swift"
  s.resource_bundle             = { 'IUExtensions' => ['IUExtensions/*.lproj'] }
end
