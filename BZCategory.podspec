Pod::Spec.new do |s|


  s.name         = "BZCategory"
  s.version      = "1.0.1"
  s.summary      = "分类"

  s.description  = <<-DESC
                   分类.
                   DESC

  s.homepage     = "https://github.com/EricBZH/BZCategory"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "EricBup" => "375298211@qq.com" }
  s.source       = { :git => "https://github.com/EricBZH/BZCategory.git", :tag => "#{s.version}" }

  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files = "BZCategory/*.{h,m}"

end