// import 'package:project/models/jobesmodel.dart';

// class JobSearch {
//   // Sample list of jobs
//   List<Job> jobs;

//   JobSearch(this.jobs);

//   // Search by name
//   List<Job> searchByName(String query) {
//     return jobs
//         .where((job) => job.name.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }

//   // Search by location
//   List<Job> searchByLocation(String query) {
//     // Assuming 'aboutCompany' contains location information
//     return jobs
//         .where((job) =>
//             job.aboutCompany.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }

//   // Search by salary
//   List<Job> searchBySalary(String query) {
//     return jobs
//         .where((job) => job.salary.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }
// }
