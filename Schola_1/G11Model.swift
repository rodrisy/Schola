//
//  G11Model.swift
//  Schola_1
//
//  Created by Rodrigo Sánchez Yuste on 2/5/24.
//

import Foundation

let dwightSchedule: [Schedule] = [
    Schedule(grade: "11th", students: [
        Student(username: "2025rsanchez", cycle: [
            Day(name: "Day 1", schedule: [
                Class(name: "Economics", level: true, teacher: "Jorge Ruel", room: "M7", building: "Main Campus"),
                Class(name: "Chemistry", level: true, teacher: "James Kearsley", room: "403 Lab", building: "Main Campus"),
                Class(name: "Chemistry", level: true, teacher: "James Kearsley", room: "403 Lab", building: "Main Campus"),
                Class(name: "Lunch 11", level: false, teacher: "N/A", room: "N/A", building: "N/A"),
                Class(name: "Computer Science", level: true, teacher: "Matthew Moran", room: "501 Lab", building: "Main Campus"),
                Class(name: "English A Lang and Lit", level: false, teacher: "Sarah Waldron", room: "NC12", building: "North Campus"),
                Class(name: "Spanish A Lang & Lit", level: false, teacher: "Javier Sanchez Rodriguez", room: "564 Col Av", building: "Columbus Campus")
            ]),
            Day(name: "Day 2", schedule: [
                Class(name: "Grade 11 Micro Course (Con Law D2 P2)", level: true, teacher: "Michael Wiesenfeld", room: "M21", building: "Main Campus"),
                Class(name: "Math Analysis and Approaches", level: false, teacher: "Summer Long", room: "LL6", building: "Main Campus"),
                Class(name: "Lunch 11", level: false, teacher: "N/A", room: "N/A", building: "N/A"),
                Class(name: "Economics", level: true, teacher: "Jorge Ruel", room: "M7", building: "Main Campus"),
                Class(name: "Economics", level: true, teacher: "Jorge Ruel", room: "M7", building: "Main Campus"),
                Class(name: "Chemistry", level: true, teacher: "James Kearsley", room: "403 Lab", building: "Main Campus")
            ]),
            Day(name: "Day 3", schedule: [
                Class(name: "Computer Science", level: true, teacher: "Matthew Moran", room: "501 Lab", building: "Main Campus"),
                Class(name: "English A Lang and Lit", level: false, teacher: "Sarah Waldron", room: "NC12", building: "North Campus"),
                Class(name: "Spanish A Lang & Lit", level: false, teacher: "Javier Sanchez Rodriguez", room: "564 Col Av", building: "Columbus Campus"),
                Class(name: "Mastering Fluency 11", level: false, teacher: "Lindsey Otterbourg", room: "N/A", building: "N/A"),
                Class(name: "Grade 11 Micro Course (Fin Lit D3 P6)", level: true, teacher: "Denise Nann", room: "Main Campus - 205", building: "H"),
                Class(name: "Math Analysis and Approaches", level: false, teacher: "Summer Long", room: "LL6", building: "Main Campus")
            ]),
            Day(name: "Day 4", schedule: [
                Class(name: "Economics", level: true, teacher: "Jorge Ruel", room: "M7", building: "Main Campus"),
                Class(name: "Study Center P2", level: true, teacher: "Sandra Darzy (H), Denise Nann", room: "Main Campus - M27", building: "B"),
                Class(name: "Chemistry", level: true, teacher: "James Kearsley", room: "403 Lab", building: "Main Campus"),
                Class(name: "Lunch 11", level: false, teacher: "N/A", room: "N/A", building: "N/A"),
                Class(name: "Computer Science", level: true, teacher: "Matthew Moran", room: "501 Lab", building: "Main Campus"),
                Class(name: "English A Lang and Lit", level: false, teacher: "Sarah Waldron", room: "NC12", building: "North Campus"),
                Class(name: "Spanish A Lang & Lit", level: false, teacher: "Javier Sanchez Rodriguez", room: "564 Col Av", building: "Columbus Campus")
            ]),
            Day(name: "Day 5", schedule: [
                Class(name: "Grade 11 Meeting", level: true, teacher: "Ellen Sayers (H), Montana Bass, Bentley Ferraina, Michael Horvath, Denise Nann, Bethany Roeth, Kevin Rosenberg", room: "Main Campus - Quad", building: "H"),
                Class(name: "Math Analysis and Approaches", level: false, teacher: "Summer Long", room: "LL6", building: "Main Campus"),
                Class(name: "Lunch 11", level: false, teacher: "N/A", room: "N/A", building: "N/A"),
                Class(name: "Economics", level: true, teacher: "Jorge Ruel", room: "M7", building: "Main Campus"),
                Class(name: "Computer Science", level: true, teacher: "Matthew Moran", room: "501 Lab", building: "Main Campus"),
                Class(name: "Chemistry", level: true, teacher: "James Kearsley", room: "403 Lab", building: "Main Campus")
            ]),
            Day(name: "Day 6", schedule: [
                Class(name: "Computer Science", level: true, teacher: "Matthew Moran", room: "501 Lab", building: "Main Campus"),
                Class(name: "English A Lang and Lit", level: false, teacher: "Sarah Waldron", room: "NC12", building: "North Campus"),
                Class(name: "Spanish A Lang & Lit", level: false, teacher: "Javier Sanchez Rodriguez", room: "564 Col Av", building: "Columbus Campus"),
                Class(name: "The Core Class I: ToK, EE, CAS", level: true, teacher: "Aysin Christensen", room: "Main Campus - 305 Lab", building: "G"),
                Class(name: "Study Center P6", level: true, teacher: "Sandra Darzy", room: "Main Campus - M27", building: "H"),
                Class(name: "Math Analysis and Approaches", level: false, teacher: "Summer Long", room: "LL6", building: "Main Campus")
            ])
        ])
    ],
     vacations: []
    )
    
]


struct Schedule {
    var grade: String
    var students: [Student]
    var vacations: [Date]
}

struct Student {
    var username: String
    var cycle: [Day]
}

struct Day {
    var name: String
    var schedule: [Class]
}

struct Class {
    var name: String
    var level: Bool
    var teacher: String
    var room: String
    var building: String
}

