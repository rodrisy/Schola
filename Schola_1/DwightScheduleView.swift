//import UIKit
//
//class DwightScheduleScreen: UIViewController {
//    // MARK: - Properties
//
//    var currentUser: User?
//    var currentBUser: BUser?
//    var selectedDate: Date = Date()
//    var indexDay: Int = 0
//    var weekDay: String = ""
//    var exactDate: String = ""
//
//    // MARK: - Lifecycle Methods
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupInitialData()
//    }
//
//    // MARK: - Setup Methods
//
//    func setupInitialData() {
//        selectedDate = calculateCurrentDay(Date(), 0)
//        indexDay = calculateCycleDay(selectedDate, 6)
//        weekDay = formatDateEEEE(selectedDate)
//        exactDate = formatDateMMMMDD(selectedDate)
//
//        // Initialize currentUser based on the logged-in user ID.
//        if let userId = UserDefaults.standard.string(forKey: "student_id") {
//            // if let foundUser = users.first(where: { $0.id == userId }) {
//            //     currentUser = foundUser
//            // }
//
//            if let foundBUser = busers.first(where: { $0.id == userId }) {
//                currentBUser = foundBUser
//            }
//        }
//    }
//
//    // MARK: - UI Methods
//
//    func buildSchedule() -> UIView {
//        let containerView = UIView()
//        if let currentUser = currentUser, let currentBUser = currentBUser {
//            // Build your schedule UI based on currentUser and currentBUser
//            // You can use the properties like currentUser.id, currentUser.schedules, currentBUser.id, currentBUser.blockDictionary, etc.
//        } else {
//            let label = UILabel()
//            label.text = "User not found"
//            label.textAlignment = .center
//            containerView.addSubview(label)
//            label.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//                label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
//            ])
//        }
//        return containerView
//    }
//
//    // MARK: - Helper Methods
//
//    func updateSelectedDate(dayDifference: Int) {
//        selectedDate = selectedDate.addingTimeInterval(TimeInterval(dayDifference * 24 * 60 * 60))
//        indexDay = calculateCycleDay(selectedDate, 6)
//        weekDay = formatDateEEEE(selectedDate)
//        exactDate = formatDateMMMMDD(selectedDate)
//    }
//
//    // MARK: - Action Methods
//
//    @objc func backButtonTapped() {
//        updateSelectedDate(dayDifference: -1)
//        // Reload your schedule UI here
//    }
//
//    @objc func forwardButtonTapped() {
//        updateSelectedDate(dayDifference: 1)
//        // Reload your schedule UI here
//    }
//
//    @objc func addButtonTapped() {
//        // Show custom alert or implement logic to add a new class
//    }
//}
