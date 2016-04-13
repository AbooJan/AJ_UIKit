#
#  Be sure to run `pod spec lint AJ_UIKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
    s.name             = "AJ_UIKit"   
    s.version          = "0.1.0"            
    s.summary          = "常用UI控件封装"    
    s.description      = <<-DESC
                            一些常用的UI控件封装, 支持Storyboard和纯代码
                            DESC
    s.homepage         = "https://github.com/AbooJan/AJ_UIKit"              
    s.license          = "MIT"   
    s.author           = { "AbooJan" => "aboojaner@gmail.com" }                   
    s.source           = { :git => "https://github.com/AbooJan/AJ_UIKit.git", :tag => "0.1.0" }
    s.platform          = :ios, '8.0'   
    s.ios.deployment_target = '8.0'               
    s.requires_arc      = true   
    s.source_files      = 'AJ_UIKit/AJ_UIKit/AJ_UIKit/Classes/*.swift'    
    s.resources         = 'AJ_UIKit/AJ_UIKit/AJ_UIKit/Classes/AJ_UIKit_Resource.bundle'             
    s.frameworks        = 'UIKit', 'Foundation'   
end
