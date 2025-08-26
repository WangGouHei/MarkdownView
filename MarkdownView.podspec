Pod::Spec.new do |spec|
  spec.name         = "MarkdownView"
  spec.version      = "1.0.0"
  spec.summary      = "A Swift library for rendering Markdown with rich text support"
  spec.description  = <<-DESC
    MarkdownView is a comprehensive Swift library that provides rich Markdown rendering capabilities.
    It includes a custom text layout engine (Litext), Markdown parsing, syntax highlighting for code blocks,
    table rendering, and math formula support. Perfect for iOS and macOS applications that need to display
    formatted Markdown content with interactive features.
  DESC
  
  spec.homepage     = "https://github.com/yourusername/MarkdownView"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Your Name" => "your.email@example.com" }
  spec.source       = { :git => "https://github.com/yourusername/MarkdownView.git", :tag => "#{spec.version}" }
  
  spec.ios.deployment_target = "13.0"
  spec.macos.deployment_target = "10.15"
  spec.swift_version = "5.9"
  
  spec.source_files = [
    "Sources/MarkdownView/**/*.swift",
    "Sources/MarkdownParser/**/*.swift",
    "Sources/Litext/**/*.swift"
  ]
  
  spec.resource_bundles = {
    'MarkdownView' => ['Sources/MarkdownView/Resources/*.xcstrings'],
    'Litext' => ['Sources/Litext/Resources/*.xcstrings']
  }
  
  spec.dependency 'swift-collections', '~> 1.2.0'
  spec.dependency 'SwiftMath', '1.7.2'
  spec.dependency 'Splash', '~> 0.18.0'
  spec.dependency 'swift-cmark', '~> 0.6.0'
  spec.dependency 'LRUCache', '~> 1.0.7'
  
  spec.frameworks = 'Foundation', 'UIKit', 'CoreText', 'CoreGraphics'
  
  spec.requires_arc = true
  
  # Exclude test files and other non-source files
  spec.exclude_files = [
    "Example/**/*",
    "Tests/**/*",
    "*.xcodeproj",
    "*.xcworkspace"
  ]
  
  # Subspecs for modular usage
  spec.subspec 'Core' do |core|
    core.source_files = [
      "Sources/MarkdownView/**/*.swift",
      "Sources/MarkdownParser/**/*.swift",
      "Sources/Litext/**/*.swift"
    ]
    core.resource_bundles = {
      'MarkdownView' => ['Sources/MarkdownView/Resources/*.xcstrings'],
      'Litext' => ['Sources/Litext/Resources/*.xcstrings']
    }
  end
  
  spec.subspec 'MarkdownView' do |mv|
    mv.source_files = "Sources/MarkdownView/**/*.swift"
    mv.resource_bundles = {
      'MarkdownView' => ['Sources/MarkdownView/Resources/*.xcstrings']
    }
    mv.dependencies = ['MarkdownParser', 'Litext', 'SwiftMath', 'Splash', 'LRUCache']
  end
  
  spec.subspec 'MarkdownParser' do |mp|
    mp.source_files = "Sources/MarkdownParser/**/*.swift"
    mp.dependencies = ['swift-cmark']
  end
  
  spec.subspec 'Litext' do |lt|
    lt.source_files = "Sources/Litext/**/*.swift"
    lt.resource_bundles = {
      'Litext' => ['Sources/Litext/Resources/*.xcstrings']
    }
    lt.dependencies = ['swift-collections']
  end
  
  # Default to Core subspec
  spec.default_subspecs = 'Core'
end
