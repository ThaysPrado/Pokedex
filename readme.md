# Pokedex
Pokedex is an app written in Swift and using RxSwift and Moya.

![ThaysPrado](https://i.imgur.com/LLRC7SF.png)
![ThaysPrado](https://i.imgur.com/cHAKiPp.png)

------------

#### Podfile

- **Moya** - Networking library
- **Alamofire** - Requests Http
- **SwiftyJSON** - Makes it easy to deal with JSON data
- **Kingfisher** - Library for downloading and caching images
- **RxSwift** - It makes it easy to program dynamic apps that respond to data changes and user events.
- **RxCocoa** - Is a framework that makes Cocoa APIs used in iOS to use with reactive techniques.
- **Nimble** - To express the expected outcomes of Swift expressions
- **Quick** - Is a behavior-driven development framework

#### MVVM

Model-View-ViewModel (MVVM) is a UI architectural design pattern that decouples UI code from the business and presentation logic of an application. As it comes from the name, MVVM divides an application into three components to help separate the code: the model, the view, and the view model. 

* The View defines the layout, appearance and structure of the UI. The view informs the ViewModel about user interactions and observables state changes exposed by the viewModel.
* The ViewModel is responsible for wrapping the model and providing state to the UI components. It also defines actions, that can be used by the view to pass events to the model. However, it shouldn’t have access to the view.
* The Model defines core types and implements application business logic. It is completely independent of the view and view-model and reusable in many across the application.

MVVM architecture result in a clean code base and will make it easier to add new functionality to the app

