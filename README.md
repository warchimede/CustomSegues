CustomSegues
============

## Summary
Custom segues with cool animations in Swift

## Use
Drag the **CustomSegue.swift** file into your project.

Then, set up a custom segue between two **UIViewController** in your **UIStoryboard** (don't forget the exit segue !).
Make the custom forward segue a **CustomSegue**, and override in your source **UIViewController** these two functions :

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue is CustomSegue {
            (segue as CustomSegue).animationType = .SwipeDown
        }
    }

    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String) -> UIStoryboardSegue {
        let segue = CustomUnwindSegue(identifier: identifier, source: fromViewController, destination: toViewController)
        segue.animationType = .SwipeDown
        return segue
    }

## Configuration
Here are the currently available transforms you can use to customize the animation
of your custom segue :

  + `Push` (the default animation)
  + `SwipeDown`
  + `GrowScale`
  + `CornerRotate`

## License
This control was made available under the MIT License

If you use it and like it, let me know: [@warchimede](http://twitter.com/warchimede)
