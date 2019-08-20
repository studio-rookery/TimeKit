Pod::Spec.new do |spec|
  spec.name         = "TimeKit"
  spec.version      = "1.2.1"
  spec.summary      = "Type safe, simple, light weight calendar components."
  spec.homepage     = "https://github.com/studio-rookery/TimeKit"
  spec.license      = "MIT"
  spec.author       = { "masaki" => "studio.rookery@gmail.com" }

  spec.swift_version = "5.0"

  spec.ios.deployment_target = "10.0"
  spec.osx.deployment_target = "10.12"
  spec.tvos.deployment_target = "10.0"
  spec.watchos.deployment_target = "3.0"

  spec.source       = { :git => "https://github.com/studio-rookery/TimeKit.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/**/*.{swift,h,m}"
end
