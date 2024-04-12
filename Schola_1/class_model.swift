import Foundation

// Represents a class within a regular schedule
struct Class {
    let startTime: String
    let endTime: String
    let subject: String
    let teacher: String
    let room: String
}

// Represents a schedule for a specific day
struct Schedule {
    let day: String
    let classes: [Class]
}

// Represents a user of the app
struct User {
    let id: String
    let schedules: [Schedule]
}

// Represents a class within a block schedule
struct BlockClass {
    let subject: String
    let teacher: String
    let room: String
}

// Represents a block within a block schedule
struct Block {
    let letter: String
    let startTime: String
    let endTime: String
}

// Represents a day within a block schedule
struct BlockDay {
    let dayName: String
    let blocks: [Block]
}

// Represents a block schedule
struct BlockSchedule {
    let scheduleName: String
    let days: [BlockDay]
    let vacationDays: [Date]
}

// Represents a user within the context of block schedules
struct BUser {
    let id: String
    let blockDictionary: [String: BlockClass]
}
