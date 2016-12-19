# CognitoDataSyncBlocking

This project showcases how AWS iOS SDK Cognito Sync deadlocks in poor (100% loss) network conditions

## Getting Started
1. Clone the project, open CognitoSyncBlockingExample.xcworkspace
2. In AppDelegate.swift, add your cognito pool id, and region.
3. In ViewController.swift, add your cognito dataset name, and a key name.
4. Launching the project, configure [Network Link Condition](http://nshipster.com/network-link-conditioner/) or your preferred network simulator to be 100% loss.
    - iOS devices come with network link conditioner via settings -> developer -> network link conditioner if you prefer to test on a device
5. Press the "Click twice to block" button twice.
6. Observe how the main thread is now blocks, and how you cannot select between the two segmented controls.
7. After cognito times out the main thread is unblocked and the UI is usable again.