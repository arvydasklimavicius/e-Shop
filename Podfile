# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared_pods
	pod 'Firebase/Core'
	pod 'Firebase/Auth'
	pod 'Firebase/Firestore'
	pod 'Firebase/Storage'	
	pod 'Firebase/Functions'
	pod 'IQKeyboardManagerSwift'
	pod 'Kingfisher'
end

target 'Admin' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Admin
	shared_pods
	pod 'Stripe'
	pod 'Alamofire'

end

target 'e-Shop' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for e-Shop
	shared_pods
	pod 'CropViewController'

end
