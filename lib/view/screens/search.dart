import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/dataCrossPages.dart';
import '../widgets/searchScreenBase.dart';
import '../../controller/searchController.dart';
import '../../root/routs.dart';


class SearchScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    TextEditingController searchTxtController = TextEditingController();
    SearchScreenController controller =Get.put(SearchScreenController());
    double w = Get.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child:Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(10),
              child: Row(
                children: [
                  IconButton(onPressed: (){
                  }, icon: Icon(Icons.arrow_back)),
                  Expanded(
                    child: TextField(
                      controller: searchTxtController,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                      autofocus: true,
                      onEditingComplete: (){
                        controller.addRecentSearch(searchTxtController.text);
                        Get.toNamed(myRoutes.searchResult , arguments:{'searchTxt':searchTxtController.text});
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search , color: Colors.black,),
                        hintText: "Type something... " ,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ),
            const SizedBox(height: 10.0,),

            Container(

              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Recent searches" , style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6B7280),
                ),),
              ),
              width: double.infinity,
            ),
            const SizedBox(height: 10.0,),

          GetBuilder<SearchScreenController>(
            init: SearchScreenController(),
            builder:(controller)=>  ListView.builder(
              reverse: true,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: SearchScreenBase.recentJobs.length,
              itemBuilder: (context , index){
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.history ),
                          SizedBox(width: 10.0,),
                         TextButton(onPressed: (){

                            controller.addRecentSearch(SearchScreenBase.recentJobs[index]);
                            Get.toNamed(myRoutes.searchResult , arguments:{'searchTxt':SearchScreenBase.recentJobs[index]});

                          },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                            ),
                            child: Container(
                              width:w*0.58,
                              child: Text(SearchScreenBase.recentJobs[index] , style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,

                                                        ),),
                            ),)
                        ],
                      ),
                      IconButton(onPressed: (){
                        controller.removeRecentSearch(index);
                      }, icon: Icon(Icons.highlight_remove , color: Colors.red,)),
                    ],
                  ),
                );
              },
            ),
          ),


            SizedBox(height: 10.0,),

            Container(

              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Popular searches" , style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6B7280),
                ),),
              ),
              width: double.infinity,
            ),
            SizedBox(height: 10.0,),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: SearchScreenBase.popularJobs.length,
              itemBuilder: (context , index){
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.manage_search ),
                          SizedBox(width: 10.0,),
                         TextButton(onPressed: (){
                            Get.toNamed(myRoutes.searchResult , arguments:{'searchTxt':SearchScreenBase.popularJobs[index]});
                         },
                             child:  Container(
                               width: w*0.58,
                               child: Text(SearchScreenBase.popularJobs[index] , style: TextStyle(
                                 fontSize: 16.0,
                                 fontWeight: FontWeight.w400,

                               ),),
                             ),)
                        ],
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_right_outlined , color: Colors.blue,)),
                    ],
                  ),
                );
              },
            ),


          ],
        ) ,
        
      )
    );
  }
}

