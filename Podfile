platform :ios, '13.0'

#Shared Pods for NYTimes
def shared_pods
  pod 'RxSwift'
  pod 'ReachabilitySwift'
  pod 'Kingfisher'
  pod 'FuntastyKit'
  pod 'appstore-card-transition'
end

target 'NYTimes' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for NYTimes
  inhibit_all_warnings!
  shared_pods

  target 'NYTimesTests' do
    inherit! :search_paths
    # Pods for testing
    use_frameworks!
    inhibit_all_warnings!
    shared_pods
  end

  target 'NYTimesUITests' do
    # Pods for testing
    use_frameworks!
    inhibit_all_warnings!
    shared_pods
  end

end
