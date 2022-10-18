#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_rust_bridge_template.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
    s.name             = 'flutter_rust_bridge_template'
    s.version          = '0.0.1'
    s.summary          = 'A new Flutter FFI plugin project.'
    s.description      = <<-DESC
  A new Flutter FFI plugin project.
                         DESC
    s.homepage         = 'http://example.com'
    s.license          = { :file => '../LICENSE' }
    s.author           = { 'Your Company' => 'email@example.com' }
  
    # This will ensure the source files in Classes/ are included in the native
    # builds of apps using this FFI plugin. Podspec does not support relative
    # paths, so Classes contains a forwarder C file that relatively imports
    # `../src/*` so that the C sources can be shared among all target platforms.
    s.source           = { :path => '.' }
    s.source_files     = 'Classes/**/*'
    s.dependency 'FlutterMacOS'
  
    s.platform = :osx, '10.11'
    s.swift_version = '5.0'

    # use the universal binary created by the lipo command
    s.vendored_libraries = 'libs/libnative.a'
  end
  