# NY Times
> News app that displays the most popular articles

![Language](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)
![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)

## Version

1.0

## Requirements

- iOS 12.0+
- Xcode 11+

## Getting Started

1. First download the project by cloning this repository on Xcode or by downloading the Zip file.
2. Open shell window and navigate to the project.
3. Run `pod install`.
4. Open the corresponding `.xcworkspace` file.
5. Select any iPhone Simulator to run the app on.

## Pods used

```ruby
pod 'RxSwift'
pod 'ReachabilitySwift'
pod 'Kingfisher'
pod 'FuntastyKit'
pod 'appstore-card-transition'
```

## Summary

Black themed app listing the mostpopular & mostviewed news.
Easy to change news data source by a simple enum switch.
Offline data caching so you can read the news anytime you want.

## Application Architecture

The NY Times App follows the Model-View-ViewModel-C + RXSwift (MVVM-C+RX) design pattern and uses advanced app development practices including Storyboards.

## Unit Tests

NY Times has a unit test written to test the API that retrieves the news articles as well as a UI test that tests the app when clicking on the first article directs you to the details page.
To run the unit tests press `Command+u`.

## Automated Tests

NY Times is using fastlane command line for CD/CI
A Jenkins server is connected to this project's remote repo.
The Jenkins server will trigger a build once the source code is pushed to 'master'.
The sever will prepare the app for release with app metadata within the 'fastlane' folder.

## Fastlane
To run the fastlane tests, run `fastlane tests`.
The below commands are used & deployed on Jenkins, more details in `NYTimes Config [Jenkins].html` & `Fastfile` 

```sh
$ fastlane scan #To build the UnitTests & UITests 
$ fastlane fastlane-credentials ## To Add the ApplID that used with Apple Developer & iTunes Connect
$ fastlane produce #To Create the app on Apple Developer Portal if it wasn't created before
$ fastlane match development #To Create the profiles and certs on Apple Developer Portal & sync them with git
$ fastlane match appstore #Same as above
$ fastlane gym #To Build & Sign the app and export it as .ipa file
```

## Features

- [x] Object oriented programming approach
- [x] Offline caching
- [x] MVVM-C+RX
- [x] XCTest
- [x] XCUITest
