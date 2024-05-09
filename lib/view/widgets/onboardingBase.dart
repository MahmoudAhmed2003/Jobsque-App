import 'package:flutter/cupertino.dart';

import '../../generated/assets.dart';


class OnboardingItem extends StatelessWidget {

  final Map<String, String> data;
  OnboardingItem({required this.data});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              data['image'] ?? '',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: h * 0.02),
            data['title'] == "title1"
                ? Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: RichText(
                textAlign: TextAlign.left,
                text: const TextSpan(
                  text: 'Find a job, and ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Color(0xff111827),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'start building ',
                      style: TextStyle(
                        fontSize: 32,
                        color: Color(0xff3366FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'your career from now on',
                      style: TextStyle(
                        fontSize: 32,
                        color: Color(0xff111827),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
            //  Hundreds of jobs are waiting for you to join together
                : data['title'] == "title2"
                ? Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: RichText(
                textAlign: TextAlign.left,
                text: const TextSpan(
                  text: 'Hundreds of jobs are waiting for you to',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Color(0xff111827),
                  ),
                  children: [
                    TextSpan(
                      text: ' join together',
                      style: TextStyle(
                        fontSize: 32,
                        color: Color(0xff3366FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
            // Get the best choice for the job you've always dreamed of
                : data['title'] == "title3"
                ? Padding(
              padding:
              const EdgeInsets.only(left: 30.0, right: 30.0),
              child: RichText(
                textAlign: TextAlign.left,
                text: const TextSpan(
                  text: 'Get the best ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Color(0xff111827),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'choice for the job ',
                      style: TextStyle(
                        fontSize: 32,
                        color: Color(0xff3366FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "you've always dreamed of",
                      style: TextStyle(
                        fontSize: 32,
                        color: Color(0xff111827),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
                : const Text(''),
            SizedBox(height: h * 0.02),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Text(
                data['description'] ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff6B7280),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
