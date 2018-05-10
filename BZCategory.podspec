Pod::Spec.new do |s|


  s.name         = "BZCategory"
  s.version      = "1.0.6"
  s.summary      = "集成常用的分类，方便开发使用"

  s.description  = <<-DESC
                   集成常用的分类，方便开发使用。
                   DESC

  s.homepage     = "https://github.com/EricBZH/BZCategory"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "EricBup" => "375298211@qq.com" }
  s.source       = { :git => "https://github.com/EricBZH/BZCategory.git", :tag => "#{s.version}" }

  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files = "BZCategory/*.{h,m}"
  s.public_header_files = "BZCategory/BZCategory.h"
  s.dependency     "MJExtension"

  s.subspec 'Foundation' do |ss|

    ss.source_files = "BZCategory/Foundation/*.{h,m}"
  end

  s.subspec 'BZModel' do |ss|

    ss.source_files = "BZCategory/BZModel/*.{h,m}"
  end

end