
Pod::Spec.new do |s|
  s.name             = 'JSCategory'
  s.version          = '0.5.0'
  s.summary          = 'JSCategory'



  s.description      = <<-DESC
          开发过程中常用的类扩展
                       DESC

  s.homepage         = 'https://github.com/lmg4819/JSCategory'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lmg4819' => 'luomengge@cheyipai.com' }
  s.source           = { :git => 'https://github.com/lmg4819/JSCategory.git', :tag => s.version.to_s }
  s.requires_arc = true


  s.ios.deployment_target = '9.0'

  #  s.source_files = "JSCategory", "JSCategory/*.{h}","JSCategory/**/*.{h,m}"

  s.source_files = 'JSCategory/JSCategorys.h'
  s.public_header_files = 'JSCategory/JSCategorys.h'

  #Foundation
  s.subspec 'Foundation' do |foundation|
      #       foundation.source_files = 'JSCategory/Foundation/**/*.{h,m}'
       foundation.public_header_files = 'JSCategory/Foundation/Foundation_JS.h'
       foundation.source_files = 'JSCategory/Foundation/Foundation_JS.h'
       foundation.frameworks = 'Foundation','Security'

       #三级
       foundation.subspec 'NSArray' do |array|          array.source_files = 'JSCategory/Foundation/NSArray/*.{h,m}'
       end
       foundation.subspec 'NSData' do |data|
          data.source_files = 'JSCategory/Foundation/NSData/*.{h,m}'
       end
       foundation.subspec 'NSObject' do |object|
          object.source_files = 'JSCategory/Foundation/NSObject/*.{h,m}'
       end
       foundation.subspec 'NSTimer' do |timer|
          timer.source_files = 'JSCategory/Foundation/NSTimer/*.{h,m}'
       end
       foundation.subspec 'NSNumber' do |number|
          number.source_files = 'JSCategory/Foundation/NSNumber/*.{h,m}'
       end
       foundation.subspec 'NSThread' do |thread|
          thread.source_files = 'JSCategory/Foundation/NSThread/*.{h,m}'
        end
         foundation.subspec 'NSString' do |string|
           string.source_files = 'JSCategory/Foundation/NSString/*.{h,m}'
           string.dependency 'JSCategory/Foundation/NSNumber'
           string.dependency 'JSCategory/Foundation/NSData'
          end
        foundation.subspec 'NSFileManager' do |filemanager|
           filemanager.source_files = 'JSCategory/Foundation/NSFileManager/*.{h,m}'
        end
        foundation.subspec 'NSKeyedUnrchiver' do |keyedunarchive|
             keyedunarchive.source_files = 'JSCategory/Foundation/NSKeyedUnrchiver/*.{h,m}'
        end
        foundation.subspec 'NSDictionary' do |dictionary|
           dictionary.source_files = 'JSCategory/Foundation/NSDictionary/*.{h,m}'
        end
  end
  #UIKit
   s.subspec 'UIKit' do |uikit|
       #   uikit.source_files = 'JSCategory/UIKit/**/*.{h,m}'
       uikit.public_header_files = 'JSCategory/UIKit/UIKit_JS.h'
       uikit.source_files = 'JSCategory/UIKit/UIKit_JS.h'
       uikit.frameworks = 'UIKit'

       #三级
        uikit.subspec 'UIImage' do |image|
           image.source_files = 'JSCategory/UIKit/UIImage/*.{h,m}'
        end
        uikit.subspec 'UILabel' do |label|
           label.source_files = 'JSCategory/UIKit/UILabel/*.{h,m}'
        end
        uikit.subspec 'UIScrollView' do |scrollview|
           scrollview.source_files = 'JSCategory/UIKit/UIScrollView/*.{h,m}'
          end
        uikit.subspec 'UIWindow' do |window|
            window.source_files = 'JSCategory/UIKit/UIWindow/*.{h,m}'
        end
        uikit.subspec 'UIApplication' do |application|
            application.source_files = 'JSCategory/UIKit/UIApplication/*.{h,m}'
        end
        uikit.subspec 'UIColor' do |color|
            color.source_files = 'JSCategory/UIKit/UIColor/*.{h,m}'
        end
        uikit.subspec 'UIView' do |view|
            view.source_files = 'JSCategory/UIKit/UIView/*.{h,m}'
        end
        uikit.subspec 'UITextView' do |textview|
            textview.source_files = 'JSCategory/UIKit/UITextView/*.{h,m}'
        end
        uikit.subspec 'UIDevice' do |device|
             device.source_files = 'JSCategory/UIKit/UIDevice/*.{h,m}'
        end
        uikit.subspec 'UIBarButtonItem' do |barbuttonitem|
             barbuttonitem.source_files = 'JSCategory/UIKit/UIBarButtonItem/*.{h,m}'
        end
        uikit.subspec 'UITableView' do |tableview|
             tableview.source_files = 'JSCategory/UIKit/UITableView/*.{h,m}'
        end
        uikit.subspec 'UITextField' do |textfield|
             textfield.source_files = 'JSCategory/UIKit/UITextField/*.{h,m}'
        end
        uikit.subspec 'UIScreen' do |screen|
              screen.source_files = 'JSCategory/UIKit/UIScreen/*.{h,m}'
              screen.dependency 'JSCategory/UIKit/UIDevice'
        end
   end
   #QuartzCore
   s.subspec 'QuartzCore' do |quartzcore|
       #    quartzcore.source_files = 'JSCategory/QuartzCore/**/*.{h,m}'
       quartzcore.public_header_files = 'JSCategory/QuartzCore/Quartz_JS.h'
       quartzcore.source_files = 'JSCategory/QuartzCore/Quartz_JS.h'
       quartzcore.frameworks = 'QuartzCore','UIKit'

       #三级
        quartzcore.subspec 'CALayer' do |layer|
        layer.source_files = 'JSCategory/QuartzCore/CALayer/*.{h,m}'
       end
   end
   
end
