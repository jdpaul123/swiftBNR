import Cocoa

var movieRatings = ["Tron": 4, "WarGames": 5, "Sneakers": 4]
movieRatings.count
let tronRating = movieRatings["Tron"]
movieRatings["Sneakers"] = 5
movieRatings

// using updateValue(_:forKey:) to update a value and see how the optional it returns can be used as a feature
let oldRating: Int? = movieRatings.updateValue(5, forKey: "Tron")
if let lastRating = oldRating, let currentRating = movieRatings["Tron"] {
    print("old rating: \(lastRating)")
    print("current rating: \(currentRating)")
}

// Adding and Removing Values
movieRatings["Hackers"] = 5
movieRatings.removeValue(forKey: "Sneakers")
// you can also remove by setting the value of the key to nil. This does not return the value of the removed pair

for (key, value) in movieRatings {
    print("The movie \(key) was rated \(value)")
}
for movie in movieRatings.keys {
    print("User has rated \(movie).")
}

// Translating a dictionary to an array
let watchedMovies = Array(movieRatings.keys)

// Silver challenge
var teams = ["Greats": ["heather", "john", "sam", "jackson", "robbin"], "Bests": ["george", "david", "timmy", "ron", "phineas"], "Awesomes": ["ryan", "ben", "jonathan", "nick", "jack"]]
var players: [String] = []
for team in teams.values {
    for name in team {
        players.append(name)
    }
}
print("Some league of 3 generic teams of 5 random players has these platers: \(players)")

// Gold Challenge
for team in teams.keys {
    print("\n\(team):\n\(teams[team]?.joined(separator: "\n") ?? "")")
}
