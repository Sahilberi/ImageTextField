
Pod::Spec.new do |s|
  s.name         = "ImageTextField"
  s.version      = "1.0.0"
  s.summary      = "A Designable Textfield For adding textfield leftview and rightview images in storyboard for swift 3.0"
  s.homepage     = "https://github.com/Sahilberi/ImageTextField/tree/master/ImageTextField"
  s.screenshots  = "https://cloud.githubusercontent.com/assets/7422405/23651176/b1db6c48-034a-11e7-90c0-571da6a150f3.png"
  s.license      = "MIT"
  s.author             = { "Sahil" => "Sahilberi97@gmail.com" }
   s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/Sahilberi/ImageTextField.git", :tag => s.version }
  s.source_files = "Source/**/*.{swift,h}"
end
