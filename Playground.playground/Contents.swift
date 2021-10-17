

func loveCalculator() {
    let score = Int.random(in: 1...100)
    
    if score > 80 {
        print("You love each other like Kanye loves Kanye! Now that's a whole whole lot... ")
    } else if score > 40 {
        print("You go together like Coke & Mentos... Yikes!")
    } else {
        print("You'll be alone forever & ever.  Sucks to suck!")
    }
}

loveCalculator()
