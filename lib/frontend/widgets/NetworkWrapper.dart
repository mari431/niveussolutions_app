import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/network_controller.dart';


class NetworkWrapper extends StatelessWidget {
  final Widget child;

  const NetworkWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final networkController = Get.find<NetworkController>();

    return Obx(
          () => Stack(
        children: [
          child,

          if (!networkController.isConnected.value)
            Positioned.fill(
              child: Container(
                color: Colors.black54,
                child: const Center(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.wifi_off,
                            size: 60,
                            color: Colors.red,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "No Internet Connection",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}