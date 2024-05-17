import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/repo_details.controller.dart';

class RepoDetailsScreen extends GetView<RepoDetailsController> {
  const RepoDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RepoDetailsScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RepoDetailsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
