# Problem

When placing an OutlineGroup inside a List (using SwiftUI), every possible nested child node is evaluated when running the app on macOS.

# Reproduction

The app in this reproduction consists of a simple SwiftUI View with an outline group in a list and an Item struct to represent the nested items for the outline view, nothing more. A fully working

1. Download the repo from GitHub: https://github.com/Dev1an/SwiftUI-Outline-bug
2. Open the project in Xcode and run the “Outline” target on macOS
3. Check the logs in Xcode

# Expectation
I expect to see only one line in the logs: “get children of 10”. This not the case on macOS. However if you run this on iOS (for example on an iPhone or iPad), it works like expected.

# Actual results
More than thousand lines are logged in Xcode. One line for every possible child in the outline group. I expect SwiftUI to only evaluate children for visible items, just like it does it on iOS.
Because otherwise it can drain the memory if the tree is full of memory expensive data that should be lazyloaded. Or if this data is coming  from the network, it will block the network if the entire outline tree is loaded at once.
