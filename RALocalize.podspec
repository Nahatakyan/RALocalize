Pod::Spec.new do |spec|
 
  spec.name         = "RALocalize"
  spec.version      = "1.2.2"
  spec.summary      = "iOS realtime localization framework written on swift"

  spec.homepage     = "https://github.com/Nahatakyan/RALocalize"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Ruben Nahatakyan" => "rubennah@gmail.com" }

  spec.ios.deployment_target = "10"
  spec.swift_version = "5"

  spec.source        = { :git => "https://github.com/Nahatakyan/RALocalize.git", :tag => "#{spec.version}" }
  spec.source_files  = "RALocalize", "RALocalize/**/*.{h,m,swift}"

end