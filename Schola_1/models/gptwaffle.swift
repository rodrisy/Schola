//
//  gptwaffle.swift
//  Schola_1
//
//  Created by Rodrigo Sánchez Yuste on 2/5/24.
//

import Foundation

func parseSchedule(_ scheduleText: String) -> [Schedule] {
    var schedules = [Schedule]()
    var currentSchedule: Schedule?
    var currentStudent: Student?
    var currentDay: Day?
    var classes = [Class]()

    let lines = scheduleText.components(separatedBy: .newlines)
    for line in lines {
        if line.isEmpty { continue }

        if line.contains("Grade:") {
            if let schedule = currentSchedule {
                if let student = currentStudent {
                    if var day = currentDay {
                        day.schedule = classes
                        currentStudent?.cycle.append(day)
                    }
                    currentSchedule?.students.append(student)
                }
                schedules.append(schedule)
            }
            currentSchedule = nil
            currentStudent = nil
            currentDay = nil
            classes = []

            let grade = line.components(separatedBy: "Grade: ")[1]
            currentSchedule = Schedule(grade: grade, students: [], vacations: [])
        } else if line.contains("Monday") || line.contains("Tuesday") || line.contains("Wednesday") || line.contains("Thursday") || line.contains("Friday") {
            if var student = currentStudent {
                if var day = currentDay {
                    day.schedule = classes
                    student.cycle.append(day)
                }
                currentSchedule?.students.append(student)
            }
            currentStudent = nil
            currentDay = nil
            classes = []

            let nameComponents = line.components(separatedBy: "  ")
            let studentName = nameComponents[0]
            let username = studentName.components(separatedBy: "(")[1].replacingOccurrences(of: ")", with: "")
            let grade = nameComponents[1].components(separatedBy: "  ")[0]

            currentStudent = Student(username: username, cycle: [])
        } else if line.contains("Lunch") {
            let classComponents = line.components(separatedBy: "    ")
            let name = classComponents[0]
            let room = classComponents[4]
            let level = !name.contains("HL")
            let teacher = classComponents[5]

            classes.append(Class(name: name, level: level, teacher: teacher, room: room, building: "N/A"))
        } else {
            let classComponents = line.components(separatedBy: "    ")
            let name = classComponents[0]
            let room = classComponents[4]
            let level = !name.contains("HL")
            let teacher = classComponents[5]

            classes.append(Class(name: name, level: level, teacher: teacher, room: room, building: "Main Campus"))
        }
    }

    if let schedule = currentSchedule {
        if var student = currentStudent {
            if var day = currentDay {
                day.schedule = classes
                student.cycle.append(day)
            }
            currentSchedule?.students.append(student)
        }
        schedules.append(schedule)
    }

    return schedules
}

// Example usage:
let scheduleText = """
Sanchez Yuste, Rodrigo (Rodrigo) '25    Grade: 11th
Course    Start Time    End Time    Room    Block    Teacher
Monday
IB DP Economics HL I (1)    ######    ######    Main Campus - M7    A    Jorge Ruel
IB DP Chemistry HL I (1)    ######    ######    Main Campus - 403 Lab    C    James Kearsley
IB DP Chemistry HL I (1)    ######    ######    Main Campus - 403 Lab    C    James Kearsley
Lunch 11 (1)    ######    ######    N/A    D
IB DP Computer Science HL I (1)    ######    ######    Main Campus - 501 Lab    D    Matthew Moran
IB DP English A Lang and Lit SL I (2)    ######    ######    North Campus - NC12    E    Sarah Waldron
IB DP Spanish A Lang & Lit SL I (1)    ######    ######    Columbus Campus - 564 Col Av    F    Javier Sanchez Rodriguez
"""

let dwightSchedule1 = parseSchedule(scheduleText)
print(dwightSchedule1)
