Pod::Spec.new do |spec|
 
  spec.name         = "RALocalize"
  spec.version      = "1.0.2"
  spec.summary      = "iOS realtime localization framework written on swift"

  spec.homepage     = "https://github.com/Nahatakyan/RALocalize"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Ruben Nahatakyan" => "rubennah@gmail.com" }
  spec.platform     = :ios, "10.0"


  spec.source        = { :git => "https://github.com/Nahatakyan/RALocalize.git", branch => "master", :tag => "#{spec.version}" }
  spec.source_files  = "RALocalize", "RALocalize/**/*.{h,m,swift}"

  spec.swift_version = "5"

end