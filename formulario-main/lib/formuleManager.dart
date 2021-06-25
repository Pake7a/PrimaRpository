import 'package:flutter/material.dart';
import 'formulaData.dart';
import 'formulaWidget.dart';

// ignore: must_be_immutable
class FormuleManager extends StatelessWidget {
  List<FormulaData> formule;
  FormuleManager({this.formule});

  @override
  Widget build(BuildContext context) {
    List<FormulaWidget> formuleWidgets = [];
    for (FormulaData formula in formule) {
      formuleWidgets.add(FormulaWidget(formula));
    }
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: formuleWidgets.length,
      itemBuilder: (context, index) {
        return formuleWidgets[index];
      },
    );
  }
}
