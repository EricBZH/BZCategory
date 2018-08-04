Pod::Spec.new do |s|


  s.name         = "BZCategory"
  s.version      = "1.1.1"
  s.summary      = "项目通用分类库。"

  s.description  = <<-DESC
                   项目通用分类库，方便开发使用。
                   DESC

  s.homepage     = "https://github.com/EricBZH/BZCategory"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "EricBup" => "375298211@qq.com" }
  s.source       = { :git => "https://github.com/EricBZH/BZCategory.git", :tag => "#{s.version}" }

  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files = "BZCategoryDemo/BZCategory/*.{h,m}"
  s.public_header_files = "BZCategoryDemo/BZCategory/BZCategory.h"
  s.dependency     "MJExtension"

  s.subspec 'Foundation' do |ss|

    # ss.source_files = "BZCategoryDemo/BZCategory/Foundation/*.{h,m}"

    ss.subspec 'NSUserDefaults' do |sss|
      sss.source_files = "BZCategoryDemo/BZCategory/Foundation/NSUserDefaults/*.{h,m}"

      end
    ss.subspec 'Regex' do |sss|
      sss.source_files = "BZCategoryDemo/BZCategory/Foundation/Regex/*.{h,m}"

      end
    ss.subspec 'Safe' do |sss|
      sss.source_files = "BZCategoryDemo/BZCategory/Foundation/Safe/*.{h,m}"

      end
    ss.subspec 'UnicodeReadable' do |sss|
      sss.source_files = "BZCategoryDemo/BZCategory/Foundation/UnicodeReadable/*.{h,m}"

      end

  end

  s.subspec 'BZModel' do |ss|

    ss.source_files = "BZCategoryDemo/BZCategory/BZModel/*.{h,m}"
  end

end