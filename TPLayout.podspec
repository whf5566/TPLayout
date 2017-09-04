Pod::Spec.new do |s|
  s.name                  = 'TPLayout'
  s.version               = '1.0.2'
  s.homepage              = 'https://github.com/whf5566/TPLayout'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { 'huafeng.wei' => 'whf5566@gmail.com' }
  s.social_media_url      = 'https://www.wellphone.me'
  s.platform              = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source                = { :git => 'https://github.com/whf5566/TPLayout.git', :tag => 'v1.0.2' }
  s.source_files          = 'TPLayout/TPLayout'
  s.public_header_files   = 'TPLayout/TPLayout/*.{h}'
  s.requires_arc          = true
  s.summary               = 'The simple API for iOS Auto Layout — impressively simple, immensely powerful.'
  s.description  = <<-DESC
	  # TPLayout
	  Harness the power of AutoLayout NSLayoutConstraints with a simplified, chainable and expressive syntax. The  API for iOS Auto Layout — impressively simple, immensely powerful.  PureLayout extends `UIView`, `NSArray`, and `NSLayoutConstraint` . TPLayout is an Objective-C library that also works (and looks!) great with Swift using a bridging header.
	  Writing Auto Layout code from scratch isn't easy. TPLayout provides a fully capable and developer-friendly interface for Auto Layout. It is designed for clarity and simplicity, it adds only a thin layer of third party code and is engineered for maximum performance.
	  DESC
end