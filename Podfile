platform :ios, '11.0'
workspace 'WildForkFoods.xcworkspace'
project 'WFFApp/WFFApp.xcodeproj'
project 'WffPlatform/WffPlatform.xcodeproj'

abstract_target 'WFF' do
  
def wffAppPods
  pod 'CZTableView',:git => "https://gitlab.craterzone.com/administartor/CZTableView-1.git"
  pod 'Firebase/RemoteConfig'
  pod 'TTTAttributedLabel'
  pod 'SWSegmentedControl'
  pod 'SDWebImage', '~> 5.0'
  pod 'IQKeyboardManagerSwift'
  pod 'ReachabilitySwift'
  pod 'Firebase/Analytics'
  pod 'Firebase/Messaging'
  pod 'Firebase/Crashlytics'
end

def platformPods
  
#  pod 'RealmSwift' ,'~> 3.21.0'
  
end

def commonPods
  pod 'Moya','~> 12.0.1'
  pod 'ObjectMapper', '~> 3.5'
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
#  pod 'RealmSwift' ,'~> 3.21.0'
end

#app target
  target 'WFFApp' do
    use_frameworks!
    project 'WFFApp/WFFApp.xcodeproj'
    wffAppPods
    commonPods
  end
  
#platform target
  target 'WffPlatform' do
    use_frameworks!
    project 'WffPlatform/WffPlatform.xcodeproj'
    platformPods
    commonPods
  end
end
