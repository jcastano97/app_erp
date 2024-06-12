import 'package:app/controllers/smoke/smoke_controller.dart';
import 'package:app/language/language_global_var.dart';
import 'package:app/ui/components/common/box_scroll.dart';
import 'package:app/ui/components/common/styled_card.dart';
import 'package:app/ui/components/common/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmokePage extends GetView<SmokeController> {
  const SmokePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(scaffoldBackgroundColor: Colors.black),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText.displayLarge('You are clean for'),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Obx(() => StyledCard(
                            name: controller.dayCounter.value.toString(),
                          )),
                      StyledText.labelLarge('Days')
                    ],
                  ),
                  Column(
                    children: [
                      Obx(() => StyledCard(
                            name: controller.hourCounter.value.toString(),
                          )),
                      StyledText.labelLarge('Hours')
                    ],
                  ),
                  Column(
                    children: [
                      Obx(() => StyledCard(
                            name: controller.minuteCounter.value.toString(),
                          )),
                      StyledText.labelLarge('Minutes')
                    ],
                  ),
                  Column(
                    children: [
                      Obx(() => StyledCard(
                            name: controller.secondCounter.value.toString(),
                          )),
                      StyledText.labelLarge('Seconds')
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              StyledText.headlineLarge(
                'have you smoked lately?',
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.yes();
                    },
                    child: Text(LanguageGlobalVar.yes.tr),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.no();
                    },
                    child: Text(LanguageGlobalVar.no.tr),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              controller.data.isNotEmpty
                  ? Obx(() => StyledText.labelLarge(
                        'Your last reply was ${controller.data.last.createdAt}',
                      ))
                  : Container(),
              SizedBox(
                height: 20,
              ),
              BoxScroll(
                child: Obx(
                  () => Column(
                    children: controller.data
                        .map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StyledText.labelLarge(e.value
                                    ? LanguageGlobalVar.yes.tr
                                    : LanguageGlobalVar.no.tr),
                                SizedBox(
                                  width: 10,
                                ),
                                StyledText.labelLarge(e.createdAt.toString()),
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
StyledText.displayLarge('You are clean for'),
SizedBox(
height: 20,
),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Column(
children: [
Obx(() => StyledCard(
name: controller.dayCounter.value.toString(),
)),
StyledText.labelLarge('Days')
],
),
Column(
children: [
Obx(() => StyledCard(
name: controller.hourCounter.value.toString(),
)),
StyledText.labelLarge('Hours')
],
),
Column(
children: [
Obx(() => StyledCard(
name: controller.minuteCounter.value.toString(),
)),
StyledText.labelLarge('Minutes')
],
),
Column(
children: [
Obx(() => StyledCard(
name: controller.secondCounter.value.toString(),
)),
StyledText.labelLarge('Seconds')
],
),
],
),
SizedBox(
height: 20,
),
StyledText.headlineLarge(
'have you smoked lately?',
),
SizedBox(
height: 20,
),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
ElevatedButton(
onPressed: () {
controller.yes();
},
child: Text(LanguageGlobalVar.yes.tr),
),
SizedBox(
width: 10,
),
ElevatedButton(
onPressed: () {
controller.no();
},
child: Text(LanguageGlobalVar.no.tr),
),
],
),
SizedBox(
height: 20,
),
controller.data.isNotEmpty
? Obx(() => StyledText.labelLarge(
'Your last reply was ${controller.data.last.createdAt}',
))
    : Container(),
SizedBox(
height: 20,
),
BoxScroll(
child: Obx(
() => Column(
children: controller.data
    .map((e) => Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
StyledText.labelLarge(e.value
? LanguageGlobalVar.yes.tr
    : LanguageGlobalVar.no.tr),
SizedBox(
width: 10,
),
StyledText.labelLarge(e.createdAt.toString()),
],
))
    .toList(),
),
),
),
],
),
),
