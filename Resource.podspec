Pod::Spec.new do |s|
  s.name         = "Resource"
  s.version      = "0.2"
  s.summary      = "Resource helps you to manage your project resources."
  s.homepage     = "https://github.com/TintPoint/Resource"
  s.author       = { "Justin Jia" => "justin.jia@tintpoint.com" }
  s.license      = "MIT"
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/TintPoint/Resource.git", :tag => "#{s.version}" }
  s.source_files = "Sources/*.swift"
  s.framework    = "UIKit"
end
