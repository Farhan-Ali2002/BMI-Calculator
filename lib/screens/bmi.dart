import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../widgets/usefulfunctions.dart';
import '../constants/constants.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = "";
  var emptyError = "";
  var bgColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "BMI CALCULATOR",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 350,
                height: 400,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: wtcontroller,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.line_weight),
                              label: Text("Enter weight in KGs")),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: ftcontroller,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.height),
                              label: Text("Enter height in feets")),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: incontroller,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.height),
                              label: Text("Enter height in inches")),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              var wt = wtcontroller.text.toString();
                              var ft = ftcontroller.text.toString();
                              var inch = incontroller.text.toString();
                              var dialogtype = DialogType.noHeader;

                              if (wt != "" && ft != "" && inch != "") {
                                var iwt = int.parse(wt);
                                var ift = int.parse(ft);
                                var iinch = int.parse(inch);

                                var totalInch = (ift * 12) + iinch;
                                var tCm = totalInch * 2.54;
                                var tmtr = tCm / 100;
                                var bmi = iwt / (tmtr * tmtr);
                                var msg = "";
                                if (bmi > 25) {
                                  msg = "You are overweight";
                                  dialogtype = DialogType.warning;
                                  bgColor = orange;
                                } else if (bmi < 18) {
                                  msg = "You are underweight";
                                  bgColor = red;
                                  dialogtype = DialogType.warning;
                                } else {
                                  msg = "You are alright";
                                  bgColor = green;
                                  dialogtype = DialogType.success;
                                }

                                setState(() {
                                  result =
                                      "$msg--\nYour BMI is ${bmi.toStringAsFixed(4)}";
                                  emptyError = "";
                                });
                                dialog1(context, result, dialogtype, bgColor);
                                wtcontroller.clear();
                                ftcontroller.clear();
                                incontroller.clear();
                              } else {
                                setState(() {
                                  emptyError =
                                      "Please fill all the required blanks!!";
                                });
                              }
                            },
                            child: const Text("Calculate")),
                        Text(emptyError,
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
