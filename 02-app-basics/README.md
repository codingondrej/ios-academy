# Introduction, programming and Swift basics

[Slides](https://docs.google.com/presentation/d/1T8O3T8P6nB8fvG8xoCsvzF8vzNiskmjNXF14baNXYeM)

## Topics

* organizing code
  * code units with defined inputs and outputs
  * using classes, structs and protocols
  * ticket machine example
* Xcode basics
  * navigation
  * interface builder
  * code editor
* UIKit components
  * buttons
  * images and asset catalogs
  * labels
  * text field
  * activity indicator
  * stack views
  * navigation + tabbar + nav and bar button items
  * table view
  * visual effect views
  * page view controller


## Resources

| Name | Description |
| --- | --- |
| [High-level Xcode overview](https://developer.apple.com/xcode/ide/) | Starting point for looking around in Xcode |
| [Autolayout guide](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/index.html#//apple_ref/doc/uid/TP40010853-CH7-SW1) | All you need to know about autolayout |
| [User interface catalog](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/Introduction/Introduction.html#//apple_ref/doc/uid/TP40009503-CH1-SW2) | In depth guide about most of UIKit components |
| [Views and Windows guide](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/UIKitUICatalog/index.html#//apple_ref/doc/uid/TP40012857-UIView-SW1) | A bit outdated, but contains lot of useful info |
| [Asset catalog secrets](https://krakendev.io/blog/4-xcode-asset-catalog-secrets-you-need-to-know) | Features of asset catalogs |



## Assignments for next lecture

### ATM implementation

Using playgrounds, write ATM implementation. Include all components and functionality in the list below. Write it in similar way as the ticket machine example.

* Components
  * card reader
  * touchscreen
  * pin pad/keyboard
  * banknote dispenser (assume only 100 CZK bills)
  * receipt printer
  * remote validation logic (connection to the bank, used for checking if user has enough balance)
* User will insert card, type his pin, select amount to withdraw, receives cash and receipt
* Take care of error states, at least:
  * invalid pin
  * not enough cash on users account
  * not enough cash in banknote dispenser
  * out of paper in receipt printer
  * cannot insert two cards at once
* Use protocols to specify interfaces between components

### Simple contact list app

* Show hardcoded list of contacts in table view
* Allow deleting contacts
* Tap on contact to go to detail
* Delete contact from here
* Edit contact info
* Contact will have
  * name
  * surname
  * phone number
  * email
