# SpaceX_JA


# Description
The purpose of this project is to show the missions of SpaceX company's rockets.


## Features
-  Access to database for pick launch entity
-  Display the list of launched missiles.
-  Ability to bookmark favorite missions


# Getting started
- Clone the project
- Go to the Repo folder
- Open file SpaceX_JA.xcodeproj
- Wait till SPM gets all dependencies
- Then run the app with Command + R

# Architecture
-  It uses a clean architecture to split data, domain, and view ([Clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html))
  - It makes it easy for the system to change.
  -  Business logic is totally separated from other layers in the code base, and other layers depend on the business rules, making it easy for the system to add/update features.
- I developed simple and readable logic.
 - Every module defines its purpose rather than its details. This helps understand what an app does rather than going in-depth into the technical details.



# Structure
- Presenter: It contains all User interface application code
- Domain: All the domain logic of the application is here and it is totally independent 
- Data: You can find all the repository models or DTO objects


# Dependency
It uses SPM for dependency management and you do not need to install the other third-party management ([Swift Package Manager](https://github.com/apple/swift-package-manager))
- [Kingfisher](https://github.com/onevcat/Kingfisher): Kingfisher is a powerful library for downloading and caching images from the web.
- [Realm](https://github.com/realm/realm-swift): Realm is a mobile database that runs directly inside phones, tablets or wearables
- [Resolver](https://github.com/hmlongco/Resolver): Resolver is an ultralight Dependency Injection system


# Contributions
 Feedback, suggestions, and contributions are welcome. Please use GitHub issues.

 ## Author
 Javad arji ([j.arji](javad.ar2000ir@gmail.com))
