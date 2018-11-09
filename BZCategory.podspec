Pod::Spec.new do |s|


  s.name         = "BZCategory"
  s.version      = "1.3.2"
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

  # s.dependency     "BZModel"

  s.subspec 'Foundation' do |ss|

    # ss.source_files = "BZCategoryDemo/BZCategory/Foundation/*.{h,m}"

    ss.subspec 'NSArray'         do |sss|
    	sss.source_files = "BZCategoryDemo/BZCategory/Foundation/NSArray/*.{h,m}"
    	end

    ss.subspec 'NSTimer'         do |sss|
      sss.source_files = "BZCategoryDemo/BZCategory/Foundation/NSTimer/*.{h,m}"
      end

    ss.subspec 'NSUserDefaults'  do |sss|
    	sss.source_files = "BZCategoryDemo/BZCategory/Foundation/NSUserDefaults/*.{h,m}"
    	end

    ss.subspec 'Regex'           do |sss|
    	sss.source_files = "BZCategoryDemo/BZCategory/Foundation/Regex/*.{h,m}"
    	end

    ss.subspec 'Safe'            do |sss|
    	sss.source_files = "BZCategoryDemo/BZCategory/Foundation/Safe/*.{h,m}"
    	end

    ss.subspec 'UnicodeReadable' do |sss|
    	sss.source_files = "BZCategoryDemo/BZCategory/Foundation/UnicodeReadable/*.{h,m}"
    	end

  end

  s.subspec 'UIKit' do |ss|

  	ss.subspec 'UIButton'    do |sss|
  		sss.source_files = "BZCategoryDemo/BZCategory/UIKit/UIButton/*.{h,m}"
  		sss.dependency "BZCategory/Foundation/NSTimer"
  		end

  	ss.subspec 'UITextField' do |sss|
  		sss.source_files = "BZCategoryDemo/BZCategory/UIKit/UITextField/*.{h,m}"
  		end
  end
  

end