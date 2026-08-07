import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/auth_controller.dart';

class UserDetailsDialog extends StatelessWidget {
  const UserDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return AlertDialog(
      title: const Text("Record Details"),
      content: Obx(() {
        final user = controller.selectedUser.value;

        if (user == null) {
          return const SizedBox();
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _buildColumn("Name","${user.name}"),
            Text("Name : ${user.name}"),
            const SizedBox(height: 3),

            _buildColumn("Language","${user.language}"),
            // Text("Language : ${user.Language}"),
            const SizedBox(height: 3),

            _buildColumn("ID","${user.id}"),
            // Text("ID : ${user.id}"),
            const SizedBox(height: 3),

            _buildColumn("Bio","${user.bio}"),
            // Text("Bio : ${user.bio}"),
            const SizedBox(height: 3),

            _buildColumn("Version","${user.version}"),
            // Text("Version : ${user.version}"),
          ],
        );
      }),
      actions: [
        TextButton(
          onPressed: Get.back,
          child: const Text("Close"),
        )
      ],
    );
  }

  Widget _buildColumn(String title, dynamic value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value?.toString() ?? "-",
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }


}