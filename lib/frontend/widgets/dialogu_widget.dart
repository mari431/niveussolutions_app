import 'package:flutter/material.dart';

Widget _buildColumn(String title, dynamic value) {
  return Column(
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
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}