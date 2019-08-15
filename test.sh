#! /bin/bash

TEST_CMD="xcodebuild -scheme SwiftExample -workspace SwiftExample.xcworkspace -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6S,OS=11.0.1' build test"

which -s xcpretty
XCPRETTY_INSTALLED=$?

if [[ $TRAVIS || $XCPRETTY_INSTALLED == 0 ]]; then
  eval "${TEST_CMD} | xcpretty"
else
  eval "$TEST_CMD"
fi
