# CognitoDataSyncBlocking

This project showcases how AWS iOS SDK Cognito Sync deadlocks in poor (100% loss) network conditions.
Created in response to [this thread on the AWS Developer Forums](https://forums.aws.amazon.com/message.jspa?messageID=756870#756870)

The UI is blocked when you try to sync the same dataset twice. You can sync multiple distinct datasets without blocking as long as you don't attempt to sync them multiple times each before you receieve a response.

## Getting Started
1. Clone the project, open CognitoSyncBlockingExample.xcworkspace
2. In AppDelegate.swift, add your cognito pool id, and region.
3. In ViewController.swift, add your cognito dataset name, and a key name.
4. Run the project. When project is running configure [Network Link Conditioner](http://nshipster.com/network-link-conditioner/) or your preferred network simulator to be 100% loss.
    - iOS devices come with network link conditioner via settings -> developer -> network link conditioner if you prefer to test on a device
5. Press the "Click twice to block" button twice.
6. Observe how the main thread is now blocked, and how you cannot select between the two segmented controls.
7. After cognito times out (about 3:30 minutes) the main thread is unblocked and the UI is unblocked.