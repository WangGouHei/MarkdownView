#!/bin/bash

echo "🔍 Validating MarkdownView.podspec..."

# Check if podspec file exists
if [ ! -f "MarkdownView.podspec" ]; then
    echo "❌ Error: MarkdownView.podspec not found!"
    exit 1
fi

# Validate the podspec
echo "📋 Running pod spec lint..."
pod spec lint MarkdownView.podspec --allow-warnings

if [ $? -eq 0 ]; then
    echo "✅ Podspec validation successful!"
    echo ""
    echo "📦 You can now:"
    echo "   1. Push your code to GitHub"
    echo "   2. Create a release tag matching the version in podspec"
    echo "   3. Submit to CocoaPods trunk (if you want to publish to the public repo)"
    echo ""
    echo "🔧 To test locally in another project:"
    echo "   pod 'MarkdownView', :path => '/path/to/your/MarkdownView'"
else
    echo "❌ Podspec validation failed!"
    echo "Please fix the issues above and try again."
    exit 1
fi
