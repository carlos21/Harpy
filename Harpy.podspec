 Pod::Spec.new do |s|
  s.name         = "Harpy"
  s.version      = "4.2.4"
  s.summary      = "Notify users that a new version of your iOS app is available, and prompt them with the App Store link."
  s.homepage     = "https://github.com/ArtSabintsev/Harpy"
  s.platform     = :ios, '9.0'
  s.source       = { :git => "https://github.com/ArtSabintsev/Harpy.git", :tag => s.version.to_s }
  s.source_files = 'Harpy/**'
  s.resources    = 'Harpy/Resources/*'
  s.requires_arc = true
  s.author       = { "Arthur Ariel Sabintsev" => "arthur@sabintsev.com" }
  s.license      = 'MIT'
 end
