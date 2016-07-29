### Unboxing JSON With Swift and Unbox

#### Author: Bart Jacobs

Many developers new to Swift seem to be struggling with JSON. Despite the speed of Foundation's `NSJSONSerialization` class, it hands you an object of type `AnyObject`, leaving it up to you to unwrap the object you received.

In Objective-C, that is less of a problem. But Swift’s inherent safety measures make this less trivial. This is what you end up with if you decide to choose for `NSJSONSerialization`.

```language-swift
if let JSON = try? NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String: AnyObject],
   let currently = JSON?["currently"] as? [String: AnyObject],
   let summary = currently["summary"] {
    print(summary)
}
```

That doesn't look pretty. It looked even worse in earlier versions of Swift. Once the [Swift Core Libraries](https://swift.org/core-libraries/) project starts to take shape, this becomes much easier. The goal of this project is to add functionality to the Swift programming language on top of the Swift Standard Library.

Fortunately, there are a bunch of open source libraries available for handling JSON in Swift. One of the most popular solutions is [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON). SwiftyJSON is quickly gaining in popularity for the same reasons [AFNetworking](https://github.com/AFNetworking/AFNetworking) was a few years ago, a lack of a robust, native solution.

Another popular solution is, [Argo](https://github.com/thoughtbot/Argo), created and maintained by none other than [ThoughtBot](https://thoughtbot.com/).

For many years, I have been using [JSONModel](https://github.com/icanzilb/JSONModel). I love JSONModel because it makes consuming APIs so much easier. The most important downside of JSONModel is that every model class needs to inherit from `JSONModel`. That is a trade-off many developers are not willing to make.

I have been looking for a nice solution to replace JSONModel in Swift. Ideally, it is a solution that does not rely on inheritance but that still gives me access to a nice API for parsing JSON and pouring raw data into model objects. [Unbox](https://github.com/JohnSundell/Unbox), created by [John Sundell](https://github.com/JohnSundell), looks very promising to me.

Unbox does not rely on inheritance. It defines a protocol that any class or structure can conform to. It provides support for:

- key paths
- nested models
- failable initializers
- native error handling
- custom transformations

I would like to show you how Unbox works by consuming the [Forecast](http://forecast.io/) API. Forecast's API returns a large blob of data that would be a pain to consume if all you had was the `NSJSONSerialization` class. Unbox makes this much, much easier.

**Read this article on the [blog](https://cocoacasts.com/unboxing-json-with-swift-and-unbox/)**.
