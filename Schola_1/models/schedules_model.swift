import Foundation

// Represents a class within a regular schedule
struct ClassModel {
    let startTime: String
    let endTime: String
    let subject: String
    let teacher: String
    let room: String
}

// Represents a schedule for a specific day
struct ScheduleModel {
    let day: String
    let classes: [ClassModel]
}

// Represents a user of the app
struct UserModel {
    let id: String
    let schedules: [ScheduleModel]
}

// Represents a class within a block schedule
struct BlockClassModel {
    let subject: String
    let teacher: String
    let room: String
}

// Represents a block within a block schedule
struct BlockModel {
    let letter: String
    let startTime: String
    let endTime: String
}

// Represents a day within a block schedule
struct BlockDayModel {
    let dayName: String
    let blocks: [BlockModel]
}

// Represents a block schedule
struct BlockScheduleModel {
    let scheduleName: String
    let days: [BlockDayModel]
    let vacationDays: [Date]
}

// Represents a user within the context of block schedules
struct BUserModel {
    let id: String
    let blockDictionary: [String: BlockClassModel]
}
