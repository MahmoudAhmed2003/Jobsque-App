// import 'package:final_project_ii/controller/homeScreenController.dart';
// import 'package:final_project_ii/root/routs.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../controller/dataCrossPages.dart';
// import '../../generated/assets.dart';
//
// class SavedJobs extends StatelessWidget {
//   const SavedJobs({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     DataCrossPages selectedJob = Get.find();
//     HomeScreenController hsc = Get.find();
//     double h = Get.height;
//
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text('Saved'),
//           centerTitle: true,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           )),
//       body: Column(
//         children: [
//           selectedJob.isSaved.length == 0? SizedBox():
//           Container(
//             width: double.infinity,
//             color: Colors.grey[200],
//             child:  Padding(
//               padding: EdgeInsets.all(10.0),
//               child: GetBuilder<DataCrossPages>(
//                 builder: (controller) =>
//                     Text(
//                       selectedJob.isSaved.length.toString() + ' Saved Jobs',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xff6B7280),
//                       ),
//                     ),
//               ),
//
//
//             ),
//           ),
//           Expanded(
//             child:
//                 GetBuilder<DataCrossPages>(
//               builder: (controller) =>
//               selectedJob.isSaved.length!=0?
//
//                 ListView.builder(
//                   itemCount: selectedJob.isSaved.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       child: !selectedJob.isSaved.contains(
//                           hsc.jl.data![index].id.toString()) ?
//                       Container(
//                         // child: Text('No Saved Jobs'),
//                       ) :
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Image.network(
//                                       hsc.jl.data![index].image!,
//                                       width: 50,
//
//                                     ),
//                                     const SizedBox(
//                                       width: 10,
//                                     ),
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment
//                                           .start,
//                                       children: [
//                                         Text(
//                                           hsc.jl.data![index].name!,
//                                           style: const TextStyle(
//                                             fontSize: 16.0,
//                                             fontWeight: FontWeight.bold,
//                                             color: Color(0xff6B7280),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 5,
//                                         ),
//                                         Text(
//                                           hsc.jl.data![index].compName! +
//                                               " • " +
//                                               hsc.jl.data![index].location
//                                                   .toString().split(', ')[hsc.jl
//                                                   .data![index].location
//                                                   .toString()
//                                                   .split(', ')
//                                                   .length - 2]
//                                               + " " +
//                                               hsc.jl.data![index].location
//                                                   .toString()
//                                                   .split(', ')
//                                                   .last!,
//                                           style: const TextStyle(
//                                             fontSize: 16.0,
//                                             fontWeight: FontWeight.bold,
//                                             color: Color(0xff6B7280),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 IconButton(
//                                   icon: const Icon(Icons.more_horiz),
//                                   onPressed: () {
//                                     Get.bottomSheet(
//                                       Container(
//                                         height: h * 0.3,
//                                         color: Colors.white,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(10.0),
//                                           child: Column(
//                                             children: [
//                                               Padding(
//                                                 padding: const EdgeInsets.all(
//                                                     8.0),
//                                                 child: InkWell(
//                                                   onTap: () {
//                                                     selectedJob.job =
//                                                     hsc.jl.data![index];
//                                                     Get.toNamed(
//                                                         myRoutes.jobApply);
//                                                   },
//                                                   child: Container(
//                                                     decoration: BoxDecoration(
//                                                       border: Border.all(
//                                                         color: Colors.grey,
//                                                         width: 2,
//                                                       ),
//                                                       borderRadius: BorderRadius
//                                                           .circular(50),
//                                                     ),
//                                                     child: const Padding(
//                                                       padding: EdgeInsets.all(
//                                                           15.0),
//                                                       child: Row(
//                                                         mainAxisAlignment: MainAxisAlignment
//                                                             .spaceBetween,
//                                                         children: [
//                                                           Row(
//                                                             mainAxisAlignment: MainAxisAlignment
//                                                                 .start,
//                                                             children: [
//                                                               Icon(
//                                                                 Icons
//                                                                     .work_outline_rounded,
//                                                                 size: 20,
//                                                               ),
//                                                               Text(
//                                                                 ' Apply Job',
//                                                                 style: TextStyle(
//                                                                   fontSize: 16.0,
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   color: Color(
//                                                                       0xff6B7280),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           Icon(
//                                                             Icons
//                                                                 .arrow_forward_ios_outlined,
//                                                             size: 20,
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.all(
//                                                     8.0),
//                                                 child: InkWell(
//                                                   onTap: () {
//                                                     Get.back();
//                                                   },
//                                                   child: Container(
//                                                     decoration: BoxDecoration(
//                                                       border: Border.all(
//                                                         color: Colors.grey,
//                                                         width: 2,
//                                                       ),
//                                                       borderRadius: BorderRadius
//                                                           .circular(50),
//                                                     ),
//                                                     child: const Padding(
//                                                       padding: EdgeInsets.all(
//                                                           15.0),
//                                                       child: Row(
//                                                         mainAxisAlignment: MainAxisAlignment
//                                                             .spaceBetween,
//                                                         children: [
//                                                           Row(
//                                                             mainAxisAlignment: MainAxisAlignment
//                                                                 .start,
//                                                             children: [
//                                                               Icon(
//                                                                 Icons
//                                                                     .share_outlined,
//                                                                 size: 20,
//                                                               ),
//                                                               Text(
//                                                                 ' Share Via',
//                                                                 style: TextStyle(
//                                                                   fontSize: 16.0,
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   color: Color(
//                                                                       0xff6B7280),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           Icon(
//                                                             Icons
//                                                                 .arrow_forward_ios_outlined,
//                                                             size: 20,
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.all(
//                                                     8.0),
//                                                 child: InkWell(
//                                                   onTap: () {
//                                                     selectedJob.isSaved.remove(
//                                                         hsc.jl.data![index].id
//                                                             .toString());
//                                                     Get.back();
//                                                     selectedJob.update();
//
//                                                   },
//                                                   child: Container(
//                                                     decoration: BoxDecoration(
//                                                       border: Border.all(
//                                                         color: Colors.grey,
//                                                         width: 2,
//                                                       ),
//                                                       borderRadius: BorderRadius
//                                                           .circular(50),
//                                                     ),
//                                                     child: const Padding(
//                                                       padding: EdgeInsets.all(
//                                                           15.0),
//                                                       child: Row(
//                                                         mainAxisAlignment: MainAxisAlignment
//                                                             .spaceBetween,
//                                                         children: [
//                                                           Row(
//                                                             mainAxisAlignment: MainAxisAlignment
//                                                                 .start,
//                                                             children: [
//                                                               Icon(
//                                                                 Icons
//                                                                     .bookmark_border_outlined,
//                                                                 size: 20,
//                                                               ),
//                                                               SizedBox(
//                                                                 width: 10,
//                                                               ),
//                                                               Text(
//                                                                 'Cansel Save',
//                                                                 style: TextStyle(
//                                                                   fontSize: 16.0,
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   color: Color(
//                                                                       0xff6B7280),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           Icon(
//                                                             Icons
//                                                                 .arrow_forward_ios_outlined,
//                                                             size: 20,
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             const Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Posted 2 days ago ',
//                                   style: TextStyle(
//                                     fontSize: 12.0,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xff6B7280),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Icon(
//                                       Icons.schedule,
//                                       color: Colors.lightGreen,
//                                       size: 20,
//
//                                     ),
//                                     Text(
//                                       ' Be an early applicant',
//                                       style: TextStyle(
//                                         fontSize: 12.0,
//                                         fontWeight: FontWeight.bold,
//                                         color: Color(0xff6B7280),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             index != selectedJob.isSaved.length - 1
//                                 ? const Divider(
//                               color: Colors.grey,
//                               thickness: 1,
//                             )
//                                 : const SizedBox(),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 )
//                         :Center(
//                           child: Container(
//                             child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             children: [
//                                               SizedBox(
//                                                 height: 0.2 * h,
//                                               ),
//                                               Image.asset(
//                                                 Assets.randomPicsNoSavedJobs,
//                                                 height: 0.2 * h,
//                                               ),
//                                               SizedBox(
//                                                 height: 0.05 * h,
//                                               ),
//                                               Text(
//                                                 'Nothing has been saved yet',
//                                                 style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 24),
//                                               ),
//                                               SizedBox(
//                                                 height: 0.02 * h,
//                                               ),
//                                               Text(
//                                                 'Press the star icon on the job you want to save.',
//                                                 style: TextStyle(
//                             fontWeight: FontWeight.w300, fontSize: 16),
//                                               ),
//
//                                             ],
//                                           ),
//                           ),
//                         ),
//
//               )
//
//             ),
//
//
//         ],
//       ),
//     );
//   }
// }
