import 'package:flutter/material.dart';

class AddDrug_view extends StatelessWidget {
  static const String routeName = 'add drug';

  const AddDrug_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Drug"),
      ),
    );
  }
}
