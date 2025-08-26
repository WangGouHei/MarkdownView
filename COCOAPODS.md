# CocoaPods Installation Guide

This guide explains how to use MarkdownView with CocoaPods.

## Prerequisites

Make sure you have CocoaPods installed on your system:

```bash
sudo gem install cocoapods
```

## Basic Installation

### 1. Add to Podfile

Add the following line to your `Podfile`:

```ruby
pod 'MarkdownView'
```

### 2. Install Dependencies

Run the following command in your project directory:

```bash
pod install
```

### 3. Open Workspace

After installation, make sure to open the `.xcworkspace` file instead of the `.xcodeproj` file.

## Subspecs Usage

MarkdownView provides several subspecs for modular usage:

### Core (Default)
Includes all components:
```ruby
pod 'MarkdownView/Core'
```

### MarkdownView Component
Only the main Markdown rendering component:
```ruby
pod 'MarkdownView/MarkdownView'
```

### MarkdownParser Component
Only the Markdown parsing functionality:
```ruby
pod 'MarkdownView/MarkdownParser'
```

### Litext Component
Only the custom text layout engine:
```ruby
pod 'MarkdownView/Litext'
```

## Example Podfile

Here's a complete example `Podfile`:

```ruby
platform :ios, '13.0'
use_frameworks!

target 'YourApp' do
  # Use the full library
  pod 'MarkdownView'
  
  # Or use specific subspecs
  # pod 'MarkdownView/Core'
  # pod 'MarkdownView/MarkdownView'
  # pod 'MarkdownView/MarkdownParser'
  # pod 'MarkdownView/Litext'
end
```

## Usage in Code

After installation, you can import and use MarkdownView in your Swift code:

```swift
import MarkdownView
import MarkdownParser

let markdownTextView = MarkdownTextView()
let parser = MarkdownParser()
let result = parser.parse("# Hello World")
let content = MarkdownTextView.PreprocessedContent(parserResult: result, theme: .default)
markdownTextView.setMarkdown(content)
```

## Troubleshooting

### Common Issues

1. **Build Errors**: Make sure you're opening the `.xcworkspace` file, not the `.xcodeproj` file.

2. **Import Errors**: Ensure you've run `pod install` and cleaned your build folder.

3. **Version Conflicts**: If you encounter dependency conflicts, try updating your CocoaPods:
   ```bash
   sudo gem update cocoapods
   pod repo update
   ```

### Updating

To update to a newer version:

```bash
pod update MarkdownView
```

## Requirements

- iOS 13.0+
- macOS 10.15+ (Mac Catalyst)
- Swift 5.9+
- Xcode 15.0+

## Support

If you encounter any issues with CocoaPods installation, please check:
1. Your CocoaPods version is up to date
2. You're using the correct iOS deployment target
3. You've cleaned and rebuilt your project

For additional help, please open an issue on the GitHub repository.
