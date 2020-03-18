platform :ios, '12.0'
workspace 'WildForkFoods.xcworkspace'
project 'WFFApp/WFFApp.xcodeproj'
project 'WffPlatform/WffPlatform.xcodeproj'

abstract_target 'WFF' do
def wffAppPods
  pod 'CZTableView',:git => "https://gitlab.craterzone.com/administartor/CZTableView-1.git"
end

#app target
  target 'WFFApp' do
    use_frameworks!
    project 'WFFApp/WFFApp.xcodeproj'
    pod 'Firebase/RemoteConfig'
    wffAppPods
  end
  
#platform target
  target 'WffPlatform' do
    use_frameworks!
    project 'WffPlatform/WffPlatform.xcodeproj'
  end
end
