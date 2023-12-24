import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:white_board/controller/details_controller.dart';

class DetailsList extends GetView<DetailsController> {
  const DetailsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(builder: (controller) {
      return Scaffold(
        body: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 20),
            itemCount: controller.listDetails.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      controller.deleteDetails(index);
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        height: 50,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.amber),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.listDetails[index].userName,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodySmall
                                        ?.copyWith(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    controller.listDetails[index].userId
                                        .toString(),
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  controller.editDetails(index);
                                },
                                icon: const SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Icon(Icons.arrow_right)))
                          ],
                        )),
                  ),
                  const SizedBox(height: 10)
                ],
              );
            }),
      );
    });
  }
}
