// Many things can fly, not just birds and airplanes.
protocol CanFly {
    func fly()
}


// Generic Bird Blueprint class
class Bird {
    var isFemale = true

    func layEgg() {
        if isFemale {
            print("The bird makes a new bird inside a shell.")
        }
    }
}

// Penguins can't fly, but they are still birds.
class Penguin: Bird {
    func swim() {
        print("Penguin swims like a beast, but sadly still can't fly.")
    }
}

// Eagles are birds, and they can also fly!
class Eagle: Bird, CanFly {
    func fly() {
        print("The eagle flaps its wings & accends into the sky!")
    }

    func soar() {
        print("The eagle glides through the air currents like a boss.")   
    }
}

// Airplanes can fly, but they are not a bird.
struct Airplane: CanFly {
    func fly() {
        print("The airplane ignites its jet engines and lifts off from planet earth!")
    }
}

// Using a Protocol we are guaranteed that every flying object has the ability to fly!
struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}