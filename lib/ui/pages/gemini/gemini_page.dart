import 'package:app/controllers/home/gemini_controller.dart';
import 'package:app/service/gemini_service.dart';
import 'package:app/ui/components/styled_card.dart';
import 'package:app/ui/components/styled_text.dart';
import 'package:app/ui/pages/common_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeminiPage extends GetView<GeminiController> {
  final geminiService = Get.find<GeminiService>();
  GeminiPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('apikey: ${geminiService.hasApiKey()}');
    return CommonPage(
      child: Obx(
        () => geminiService.hasApiKey()
            ? Column(
                children: [
                  Obx(() => DropdownButton<String>(
                        value: geminiService.selectedChatTemplate.value,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          controller.setSelectedChatTemplate(value);
                        },
                        items: geminiService.chatSelectTemplates
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: controller.messageHistory
                          .map(
                            (m) => Row(
                              mainAxisAlignment: m.fromUser
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: StyledCard(
                                      name: m.text ?? '',
                                      color: m.fromUser
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(color: Colors.white)),
                                )
                              ],
                            ),
                          )
                          .toList()
                          .cast<Widget>(),
                    ),
                  )),
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        textAlign: TextAlign.left,
                        controller: controller.searchController,
                        decoration: InputDecoration(hintText: "Search"),
                      )),
                      IconButton(
                          icon: Icon(Icons.done),
                          onPressed: () {
                            controller.search();
                          }),
                    ],
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StyledText.labelLarge("Set gemini api key: "),
                  Expanded(
                      child: TextFormField(
                    controller: controller.apiKeyController,
                    decoration: InputDecoration(hintText: "Enter a task"),
                  )),
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        controller.setApiKey();
                      }),
                ],
              ),
      ),
    );
  }
}
