import Cocoa
print("HI")
/*
var myFirstInt: Int = 0


for _ in 1...5 {
    myFirstInt += 1
    print(myFirstInt)
}

print()

var i = 1
while i < 6 {
    myFirstInt += 1
    print(myFirstInt)
    i += 1
}

print()

for i in 1...100 where i % 3 == 0 {
    print(i)
}
*/

var shields = 5
var blastersOverheating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0
while shields > 0 {
    if spaceDemonsDestroyed == 500 {
        print("You beat the game!")
        break
    }
    
    if blastersOverheating{
        print("Blasters overheated! Cooldown initiated")
        sleep(5)
        print("Blasters ready to fire!")
        sleep(1)
        blastersOverheating = false
        blasterFireCount = 0
    }
    
    if blasterFireCount > 100 {
        blastersOverheating = true
        continue
    }
    
    print("Fire blasters!")
    
    blasterFireCount += 1
    spaceDemonsDestroyed += 1
}
