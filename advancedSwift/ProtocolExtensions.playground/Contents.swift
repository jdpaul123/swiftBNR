import Cocoa

protocol Exercise: CustomStringConvertible {
    var caloriesBurned: Double { get set }
    var minutes: Double { get set }
    var title: String { get }
}

extension Exercise {
    var description: String {
        return "Exercise(\(Self.self), burned \(caloriesBurned) calories in \(minutes) minutes)"
    }
}

struct EllipticalWorkout: Exercise {
    var caloriesBurned: Double
    var minutes: Double
}

let ellipticalWorkout = EllipticalWorkout(caloriesBurned: 335, minutes: 30)

struct RunningWorkout: Exercise {
    let title = "Gotta go fast!"
    var caloriesBurned: Double
    var minutes: Double
    var meters: Double
    
    var description: String {
        return "RunningWorkout(\(caloriesBurned) calories and \(meters)m in \(minutes) minutes)"
    }
}

let runningWorkout = RunningWorkout(caloriesBurned: 350, minutes: 25, meters: 5000)

extension Exercise {
    // Protocol extensions can add computed properties, but not stored properties. They can also add methods
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}

print(ellipticalWorkout.caloriesBurnedPerMinute)
print(runningWorkout.caloriesBurnedPerMinute)

print(ellipticalWorkout)
print(runningWorkout)

extension Exercise {
    func adding(calories: Double) -> Self {
        var dupe = self
        dupe.caloriesBurned += calories
        print("Creating a new \(Self.self) with \(dupe.caloriesBurned)cal burned.")
        return dupe
    }
}

let ellipticalCopy = ellipticalWorkout.adding(calories: 50)
let runningCopy = runningWorkout.adding(calories: 100)

// Protocol Extension where Clauses
extension Sequence where Element == Exercise {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout: [Exercise] = [ellipticalWorkout, runningWorkout]
print(mondayWorkout.totalCaloriesBurned())

extension Exercise {
    var title: String {
        return "\(Self.self) - \(minutes) minutes"
    }
}

let tenKRun: RunningWorkout = RunningWorkout(caloriesBurned: 750, minutes: 60, meters: 10000)

let workout: Exercise = tenKRun

print(tenKRun.title)
print(workout.title)


// Bronze Challenge Chapter 22
extension Sequence where Element == Exercise {
    func count(where limit: (Element) -> Bool ) -> Int {
        var doesItPass: Bool
        var count = 0
        for exercise in self {
            doesItPass = limit(exercise)
            if doesItPass {
                count += 1
            }
        }
        return count
    }
}

let workouts: [Exercise] = [ellipticalWorkout, runningWorkout, tenKRun]
let hardWorkoutCount = workouts.count(where: { $0.caloriesBurned >= 500} )
print(hardWorkoutCount)

// Silver Challenge Chapter 22
extension Sequence where Element: Numeric {
    var sum: Self.Element {
        var sum: Self.Element = 0
        for num in self {
            sum += num
        }
        return sum
    }
}

[4, 8,  15, 16, 23, 42].sum
[80.5, 9.6].sum
