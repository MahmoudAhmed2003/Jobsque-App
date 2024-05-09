import 'package:final_project_ii/controller/homeScreenController.dart';
import 'package:final_project_ii/model/searchResultModel.dart';
import 'package:final_project_ii/root/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../generated/assets.dart';
import '../../controller/dataCrossPages.dart';
import '/view/widgets/homeScreenBase.dart';

import '../../controller/searchController.dart';
import '../../controller/searchResultController.dart';
import '../widgets/searchResultBase.dart';

class SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchTxtController = TextEditingController();
    TextEditingController nameTxtController = TextEditingController();
    TextEditingController locationTxtController = TextEditingController();
    SearchScreenController SearchController = Get.put(SearchScreenController());
    SearchResultController searchResultController =
        Get.put(SearchResultController());
    DataCrossPages selectedJob = Get.put(DataCrossPages());
    final double h = Get.height;
    final String argu = Get.arguments['searchTxt'] ?? '';
    searchTxtController.text = argu;
    searchResultController.getSearchResult(argu);
    List<String> items = [
      '5K - 10K',
      '10K - 15K',
      '15K - 20K',
      '20K - 25K',
    ];
    dynamic dropdownValue = 'select salary';

    return GetBuilder<SearchResultController>(
      builder: (searchResultController) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: searchResultController.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.arrow_back)),
                          Expanded(
                            child: TextField(
                              controller: searchTxtController,
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                              onEditingComplete: () {
                                SearchController.addRecentSearch(
                                    searchTxtController.text);
                                searchResultController
                                    .getSearchResult(searchTxtController.text);
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    searchTxtController.clear();
                                  },
                                  icon: Icon(
                                    Icons.highlight_remove_outlined,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                hintText: "Type something... ",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.bottomSheet(
                                    isScrollControlled: true,
                                    barrierColor: Colors.black.withOpacity(0.5),
                                    backgroundColor: Colors.white,
                                    Container(
                                      height: h * 0.8,
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 40, right: 40, top: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      icon: Icon(
                                                          Icons.arrow_back)),
                                                  const Text(
                                                    "Set Filter",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: const Text(
                                                      "Reset",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Job Title",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              TextField(
                                                controller: nameTxtController,
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(
                                                    Icons.shopping_bag_outlined,
                                                    color: Colors.black,
                                                  ),
                                                  hintText: "jop Title... ",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Location",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              TextField(
                                                controller:
                                                    locationTxtController,
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.black,
                                                  ),
                                                  hintText: "Location... ",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                "Salary",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              DropdownButtonFormField<String>(
                                                items: const [
                                                  DropdownMenuItem(
                                                    child: Text('5K - 10K'),
                                                    value: '5K - 10K',
                                                  ),
                                                  DropdownMenuItem(
                                                    child: Text('10K - 15K'),
                                                    value: '10K - 15K',
                                                  ),
                                                  DropdownMenuItem(
                                                    child: Text('15K - 20K'),
                                                    value: '15K - 20K',
                                                  ),
                                                  DropdownMenuItem(
                                                    child: Text('20K - 25K'),
                                                    value: '20K - 25K',
                                                  ),
                                                ],
                                                onChanged: (String? value) {
                                                  dropdownValue = value;
                                                },
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons
                                                      .monetization_on_outlined),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          width: 10)),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                "Job Type",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              GetBuilder<
                                                      SearchResultController>(
                                                  builder: (controller) =>
                                                      GridView.builder(
                                                        gridDelegate:
                                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 3,
                                                          crossAxisSpacing: 8,
                                                          mainAxisSpacing: 8,
                                                          childAspectRatio: 2,
                                                        ),
                                                        shrinkWrap: true,
                                                        itemCount: controller
                                                            .jobTypeFilterList
                                                            .length,
                                                        itemBuilder: (context,
                                                                index) =>
                                                            FilterChipsJobFilter(
                                                                text: controller
                                                                        .jobTypeFilterList[
                                                                    index],
                                                                index: index),
                                                      )),
                                              SizedBox(
                                                height: 100,
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xff3366FF),
                                                  minimumSize:
                                                      Size(double.infinity, 50),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Get.back();

                                                  searchResultController
                                                      .getJobFilter(
                                                          name:
                                                              nameTxtController
                                                                  .text,
                                                          location:
                                                              locationTxtController
                                                                  .text);
                                                },
                                                child: Text(
                                                  "Show Result",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                              },
                              icon: Icon(Icons.tune)),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChipsJobFilter(
                                text:
                                    searchResultController.jobTypeFilterList[0],
                                index: 0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChipsJobFilter(
                                text:
                                    searchResultController.jobTypeFilterList[1],
                                index: 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChipsJobFilter(
                                text:
                                    searchResultController.jobTypeFilterList[2],
                                index: 2),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChipsJobFilter(
                                text:
                                    searchResultController.jobTypeFilterList[3],
                                index: 3),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChipsJobFilter(
                                text:
                                    searchResultController.jobTypeFilterList[4],
                                index: 4),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChipsJobFilter(
                                text:
                                    searchResultController.jobTypeFilterList[5],
                                index: 5),
                          ),
                        ],
                      ),
                    ),
                    searchResultController.sr.data!.length != 0
                        ? SizedBox(
                            height: 20,
                          )
                        : Container(),
                    searchResultController.sr.data!.length != 0
                        ? Container(
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Featuring 120+ jobs",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff6B7280),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 10,
                    ),
                    searchResultController.sr.data!.length != 0
                        ? ListView.builder(
                            itemCount: searchResultController.sr.data!.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) =>
                                Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                      myRoutes.jobDetails,
                                    );
                                    selectedJob.job =
                                        searchResultController.sr.data![index];
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(children: [
                                                  Row(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        child: Image.network(
                                                          searchResultController
                                                              .sr
                                                              .data![index]
                                                              .image!,
                                                          height: 70,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Container(
                                                          width: 200,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                searchResultController
                                                                    .sr
                                                                    .data![
                                                                        index]
                                                                    .name!,

                                                                // textAlign: TextAlign.center,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              Text(
                                                                searchResultController
                                                                    .sr
                                                                    .data![
                                                                        index]
                                                                    .compName!,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  color: Color(
                                                                      0xff374151),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ]),
                                                GetBuilder<DataCrossPages>(
                                                  builder: (dataCrossPages) =>
                                                      IconButton(
                                                    icon: Icon(
                                                      selectedJob.isSaved
                                                              .contains(
                                                                  selectedJob
                                                                      .job.id
                                                                      .toString())
                                                          ? Icons.bookmarks
                                                          : Icons
                                                              .bookmarks_outlined,
                                                      color: Color(0xff3366FF),
                                                    ),
                                                    onPressed: () {
                                                      selectedJob
                                                              .isSaved
                                                              .contains(
                                                                  selectedJob
                                                                      .job.id
                                                                      .toString())
                                                          ? selectedJob.isSaved
                                                              .remove(selectedJob
                                                                  .job.id
                                                                  .toString())
                                                          : selectedJob.isSaved
                                                              .add(selectedJob
                                                                  .job.id
                                                                  .toString());
                                                      dataCrossPages.update();
                                                    },
                                                  ),
                                                ),
                                              ]),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              FilterChipWidget2(
                                                  searchResultController
                                                      .sr
                                                      .data![index]
                                                      .jobTimeType!),
                                              FilterChipWidget2(index % 2 == 0
                                                  ? 'Remote'
                                                  : 'On Set'),
                                              FilterChipWidget2(
                                                  searchResultController.sr
                                                      .data![index].jobType!),
                                              RichText(
                                                text: TextSpan(
                                                    text:
                                                        "${searchResultController.sr.data![index].salary!.substring(0, searchResultController.sr.data![index].salary!.length - 3)}K EGP",
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff2E8E18),
                                                    ),
                                                    children: const [
                                                      TextSpan(
                                                        text: "/Month",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xff6B7280),
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                index !=
                                        searchResultController.sr.data!.length -
                                            1
                                    ? const Divider(
                                        color: Color(0xffc4c4c4),
                                        height: 2,
                                        thickness: 2,
                                        indent: 5,
                                        endIndent: 5,
                                      )
                                    : const SizedBox(
                                        height: 10,
                                      ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 0.2 * h,
                              ),
                              Image.asset(
                                Assets.randomPicsNoJobFound,
                                height: 0.2 * h,
                              ),
                              SizedBox(
                                height: 0.05 * h,
                              ),
                              Text(
                                'Search not found',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              SizedBox(
                                height: 0.02 * h,
                              ),
                              Text(
                                'Try searching with different keywords so',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 16),
                              ),
                              Text(
                                ' we can show you',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 16),
                              )
                            ],
                          ),
                  ],
                ),
              ),
      ),
    );
  }
}
