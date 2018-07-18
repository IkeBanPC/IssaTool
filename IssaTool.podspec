Pod::Spec.new do |s|


  s.name          = "IssaTool"
  s.version       = "0.0.3"
  s.summary       = "Common tools for Swift projects."
  s.homepage      = "https://github.com/IkeBanPC/IssaTool.git"
  s.license       = "MIT"
  s.authors       = {'IkeBan' => 'https://github.com/IkeBanPC'}
  s.platform      = :ios, "8.0"
  s.source        = { :git => "https://github.com/IkeBanPC/IssaTool.git", :tag => "0.0.3" }
  s.source_files  = "Source/**/*.swift"
  s.swift_version = "4.0"
  s.ios.frameworks = 'Foundation', 'UIKit'
  s.requires_arc  = true

end
