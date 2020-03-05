platform :ios, '11.0'
workspace 'WildForkFoods.xcworkspace'
project 'WffApp/WffApp.xcodeproj'
project 'WffPlatform/WffPlatform.xcodeproj'

abstract_target 'WFF' do
def wffAppPods
pod 'Firebase/Analytics'
 pod 'Firebase/Messaging'
 pod 'Firebase/Crashlytics'
 pod "Player", :git => 'https://github.com/nishitmishra96/Player.git'
end
#app target
  target 'WffApp' do
    use_frameworks!
    project 'WffApp/WffApp.xcodeproj'
    wffAppPods
  end
  
#platform target
  target 'WffPlatform' do
    use_frameworks!
    project 'WffPlatform/WffPlatform.xcodeproj'
  end
end
