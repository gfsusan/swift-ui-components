
Pod::Spec.new do |spec|

# 1
  spec.platform = :ios
  spec.name         = "SimpleUIComponents"
  spec.summary      = "Simple Swift UI components."
  spec.requires_art = true

# 2
  spec.version = "0.1.0"

# 3
spec.license = { :type => "MIT", :file => "LICENSE"}

# 4
  spec.author             = { "Susan Kim" => "suzenyada@gmail.com" }

# 5
  spec.homepage = "https://github.com/gfsusan/swift-ui-components"

# 6
  spec.source = { :git => "https://github.com/gfsusan/swift-ui-components.git", :tag => "#{spec.version}"}

# 7
  spec.framework = "UIKit"

# 8
  spec.swift_version = "5.0"
end
