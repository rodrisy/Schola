let dwightschedules: [BlockSchedule] = [
    BlockSchedule(scheduleName: "11grade", days: [
        BlockDay(dayName: "day 1", blocks: [
            Block(letter: "a", startTime: "8:00", endTime: "8:55"),
            Block(letter: "b", startTime: "9:00", endTime: "9:55"),
            Block(letter: "c", startTime: "10:00", endTime: "10:55"),
            Block(letter: "lunch", startTime: "11:00", endTime: "11:55"),
            Block(letter: "d", startTime: "12:00", endTime: "12:55"),
            Block(letter: "e", startTime: "13:00", endTime: "13:55"),
            Block(letter: "f", startTime: "14:00", endTime: "14:55"),
        ]),
        BlockDay(dayName: "day 2", blocks: [
            Block(letter: "g", startTime: "8:00", endTime: "8:55"),
            Block(letter: "h", startTime: "9:00", endTime: "9:55"),
            Block(letter: "i", startTime: "10:00", endTime: "10:55"),
            Block(letter: "lunch", startTime: "11:00", endTime: "11:55"),
            Block(letter: "a", startTime: "12:00", endTime: "12:55"),
            Block(letter: "b", startTime: "13:00", endTime: "13:55"),
            Block(letter: "c", startTime: "14:00", endTime: "14:55"),
        ]),
        BlockDay(dayName: "day 3", blocks: [
            Block(letter: "d", startTime: "8:00", endTime: "8:55"),
            Block(letter: "e", startTime: "9:00", endTime: "9:55"),
            Block(letter: "f", startTime: "10:00", endTime: "10:55"),
            Block(letter: "lunch", startTime: "11:00", endTime: "11:55"),
            Block(letter: "g", startTime: "12:00", endTime: "12:55"),
            Block(letter: "h", startTime: "13:00", endTime: "13:55"),
            Block(letter: "i", startTime: "14:00", endTime: "14:55"),
        ]),
        BlockDay(dayName: "day 4", blocks: [
            Block(letter: "a", startTime: "8:00", endTime: "8:55"),
            Block(letter: "b", startTime: "9:00", endTime: "9:55"),
            Block(letter: "c", startTime: "10:00", endTime: "10:55"),
            Block(letter: "lunch", startTime: "11:00", endTime: "11:55"),
            Block(letter: "d", startTime: "12:00", endTime: "12:55"),
            Block(letter: "e", startTime: "13:00", endTime: "13:55"),
            Block(letter: "f", startTime: "14:00", endTime: "14:55"),
        ]),
        BlockDay(dayName: "day 5", blocks: [
            Block(letter: "g", startTime: "8:00", endTime: "8:55"),
            Block(letter: "h", startTime: "9:00", endTime: "9:55"),
            Block(letter: "i", startTime: "10:00", endTime: "10:55"),
            Block(letter: "lunch", startTime: "11:00", endTime: "11:55"),
            Block(letter: "a", startTime: "12:00", endTime: "12:55"),
            Block(letter: "b", startTime: "13:00", endTime: "13:55"),
            Block(letter: "c", startTime: "14:00", endTime: "14:55"),
        ]),
        BlockDay(dayName: "day 6", blocks: [
            Block(letter: "d", startTime: "8:00", endTime: "8:55"),
            Block(letter: "e", startTime: "9:00", endTime: "9:55"),
            Block(letter: "f", startTime: "10:00", endTime: "10:55"),
            Block(letter: "lunch", startTime: "11:00", endTime: "11:55"),
            Block(letter: "g", startTime: "12:00", endTime: "12:55"),
            Block(letter: "h", startTime: "13:00", endTime: "13:55"),
            Block(letter: "i", startTime: "14:00", endTime: "14:55"),
        ])
    ], vacationDays: [])
]

struct BlockSchedule {
    var scheduleName: String
    var days: [BlockDay]
    var vacationDays: [String]
}

struct BlockDay {
    var dayName: String
    var blocks: [Block]
}

struct Block {
    var letter: String
    var startTime: String
    var endTime: String
}

