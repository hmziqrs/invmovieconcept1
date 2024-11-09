import 'package:flutter/material.dart';

class Contact {
  final String platform;
  final String label;
  final IconData icon;
  final String? url;

  Contact({
    required this.platform,
    required this.label,
    required this.icon,
    this.url,
  });
}
