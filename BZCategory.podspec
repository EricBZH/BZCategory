Pod::Spec.new do |s|


  s.name         = "BZCategory"
  s.version      = "1.4.6"
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

  s.dependency     "YYCategories"
  s.dependency     "MBProgressHUD"

  s.subspec 'Foundation' do |ss|

    ss.subspec 'NSArray'         do |sss|

    	sss.subspec 'NSArray+BZAdd' do        |ssss|
    		ssss.source_files = "BZCategoryDemo/BZCategory/Foundation/NSArray/NSArray+BZAdd/*.{h,m}"
    	end

    end

    ss.subspec 'NSString'        do |sss|
 
    	sss.subspec 'NSString+BZAdd' do       |ssss|
    		ssss.source_files = "BZCategoryDemo/BZCategory/Foundation/NSString/NSString+BZAdd/*.{h,m}"
    	end

    	sss.subspec 'NSString+BZAddRegex' do  |ssss|
    		ssss.source_files = "BZCategoryDemo/BZCategory/Foundation/NSString/NSString+BZAddRegex/*.{h,m}"
    	end
    	
    end

    ss.subspec 'NSTimer'         do |sss|

    	sss.subspec 'NSTimer+BZAdd' do        |ssss|
    		ssss.source_files = "BZCategoryDemo/BZCategory/Foundation/NSTimer/NSTimer+BZAdd/*.{h,m}"
    	end
      
    end

    ss.subspec 'NSUserDefaults'  do |sss|

    	sss.subspec 'NSUserDefaults+BZAdd' do |ssss|
    		sss.source_files = "BZCategoryDemo/BZCategory/Foundation/NSUserDefaults/NSUserDefaults+BZAdd/*.{h,m}"
    	end

    end

    ss.subspec 'Safe'            do |sss|
    	sss.source_files = "BZCategoryDemo/BZCategory/Foundation/Safe/*.{h,m}"
    end

    ss.subspec 'UnicodeReadable' do |sss|
    	sss.source_files = "BZCategoryDemo/BZCategory/Foundation/UnicodeReadable/*.{h,m}"
    end

  end

  s.subspec 'UIKit' do |ss|

  	ss.subspec 'UIButton'         do |sss|

      sss.subspec 'UIButton+BZAddCountdown'     do |ssss|
        ssss.source_files = "BZCategoryDemo/BZCategory/UIKit/UIButton/UIButton+BZAddCountdown/*.{h,m}"
        # 依赖库本身的文件
        sss.dependency "BZCategory/Foundation/NSTimer"
      end

  	end

  	ss.subspec 'UITextField'      do |sss|

      sss.subspec 'UITextField+BZAdd'           do |ssss|
        ssss.source_files = "BZCategoryDemo/BZCategory/UIKit/UITextField/UITextField+BZAdd/*.{h,m}"
      end
  		
  	end

    ss.subspec 'UIViewController' do |sss|

      sss.subspec 'UIViewController+BZAddHUD'   do |ssss|
        ssss.source_files = "BZCategoryDemo/BZCategory/UIKit/UIViewController/UIViewController+BZAddHUD/*.{h,m}"
      end

      sss.subspec 'UIViewController+BZAddToast' do |ssss|
        ssss.source_files = "BZCategoryDemo/BZCategory/UIKit/UIViewController/UIViewController+BZAddToast/*.{h,m}"
      end

    end

  end
  

end