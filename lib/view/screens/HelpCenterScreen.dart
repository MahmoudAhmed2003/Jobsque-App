import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          'Help Center',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.05 * width),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  width: double.infinity,
                  height: 0.07 * height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(width: 1, color: const Color(0xffD1D5DB)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        Text(
                          'What can we help?',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.03 * height,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: const Color(0xff6B7280),
                            )),
                        child: const ExpansionTile(
                          title: Text(
                            "Lorem ipsum dolor sit amet",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.",
                                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xff6B7280)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.01 * height,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
