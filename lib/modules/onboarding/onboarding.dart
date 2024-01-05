import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teqnia/navigation/navigation.dart';
import 'package:teqnia/reusable_widgets/widgets.dart';
import '../details_screen/main_details.dart';
import 'boarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var boardController = PageController();
   String buttonTitle= 'Next';
  List<boardingModel> boarding = [
    boardingModel(
        imageResId2: 'assets/images/sun.png',
        text2: 'Examples',
        text3: '"Explain quantum computing in simple term"',
        text4: '"Got any creative ideas for a 10year old’s birthday?"',
        text5: '"How do I make an HTTP requestin Javascript?"'
    ),
    boardingModel(
        imageResId2: 'assets/images/cloud.png',
        text2: 'capabilities',
        text3: 'Remembers what user said earlier in the conversation',
        text4: 'Allows user to provide follow-up corrections',
        text5: 'Trained to decline inappropriate requests'
    ),
    boardingModel(
        imageResId2: 'assets/images/question.png',
        text2: 'limitations',
        text3: 'May occasionally generate incorrect information',
        text4: 'May occasionally produce harmful instructions or biased content',
        text5: 'Limited knowledge of world and events after 2021'
    )
  ];

  Widget buildBoardingItem(boardingModel model) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            onBoardingTopColumn(),
            const SizedBox(
              height: 40,
            ),
            Image(image: AssetImage(model.imageResId2)),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${model.text2}',style: TextStyle(fontSize: 16,fontFamily:'Raleway',fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            onboardingContainerText(text: '${model.text3}',
            ),
            const SizedBox(
              height: 15,
            ),
            onboardingContainerText(
                text: model.text4),
            const SizedBox(
              height: 15,
            ),
            onboardingContainerText(text: '${model.text5}')
          ],
        ),
      );

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff343541),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: boardController,
                  onPageChanged: (int index){
                    if(index == boarding.length -1){
                      setState(() {
                        isLast =true;
                        buttonTitle=("Let's chat  ->");
                      });
                    }else {
                      setState(() {
                        isLast = false;
                        buttonTitle ='Next';
                      });
                    }
                  },
                  itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(controller: boardController,
                      effect:const ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          activeDotColor: Color(0xff10A37F),
                          dotHeight: 5,
                          dotWidth: 12,
                          spacing: 0.5

                      ) ,
                      count:boarding.length ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Color(0xff10A37F),
                            borderRadius: BorderRadius.circular(8)),
                        child: TextButton(
                          onPressed: () {
                            if(isLast){
                              navigateAndFinish(context,  MainDetails());
                            } else{
                              boardController.nextPage(duration: Duration(microseconds: 750),
                                  curve: Curves.ease);
                            }
                          },
                          child: Text('${buttonTitle}', style: TextStyle(color:Colors.white,fontSize: 20,fontFamily:'Raleway',fontWeight: FontWeight.bold)),
                        )),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
