
Pod::Spec.new do |s|
  s.name             = 'JSCategory'
  s.version          = '0.1.0'
  s.summary          = 'JSCategory'



  s.description      = <<-DESC
          开发过程中常用的类扩展
                       DESC

  s.homepage         = 'https://github.com/lmg4819/JSCategory'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lmg4819' => 'luomengge@cheyipai.com' }
  s.source           = { :git => 'https://github.com/lmg4819/JSCategory.git', :tag => s.version.to_s }


  s.ios.deployment_target = '9.0'

  s.source_files = 'JSCategory/Classes/JSCategory/**/*.{h,m}'
  

end
