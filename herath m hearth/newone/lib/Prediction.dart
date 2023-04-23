import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newone/profile_setting.dart';

import 'form.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _bpController = TextEditingController();
  final _alController = TextEditingController();
  final _suController = TextEditingController();
  final _rbcController = TextEditingController();
  final _pcController = TextEditingController();
  final _pccController = TextEditingController();
  final _baController = TextEditingController();
  final _bgrController = TextEditingController();
  final _buController = TextEditingController();
  final _scController = TextEditingController();
  final _potController = TextEditingController();
  final _wcController = TextEditingController();
  final _htnController = TextEditingController();
  final _dmController = TextEditingController();
  final _cadController = TextEditingController();
  final _peController = TextEditingController();
  final _aneController = TextEditingController();

  String _predictedClass = '';

  @override
  void dispose() {
    _ageController.dispose();
    _bpController.dispose();

    _alController.dispose();
    _suController.dispose();
    _rbcController.dispose();
    _pcController.dispose();
    _pccController.dispose();
    _baController.dispose();
    _bgrController.dispose();
    _buController.dispose();
    _scController.dispose();
    _potController.dispose();
    _wcController.dispose();
    _htnController.dispose();
    _dmController.dispose();
    _cadController.dispose();
    _peController.dispose();
    _aneController.dispose();

    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Encode the input features as JSON
      Map<String, dynamic> inputFeatures = {
        'age': int.parse(_ageController.text),
        'bp': int.parse(_bpController.text),
        'al': int.parse(_alController.text),
        'su': int.parse(_suController.text),
        'rbc': _rbcController.text.toString(),
        'pc': _pcController.text.toString(),
        'pcc': _pccController.text.toString(),
        'ba': _baController.text.toString(),
        'bgr': int.parse(_bgrController.text),
        'bu': int.parse(_buController.text),
        'sc': double.parse(_scController.text),
        'pot': double.parse(_scController.text),
        'wc': int.parse(_wcController.text),
        'htn': _htnController.text.toString(),
        'dm': _dmController.text.toString(),
        'cad': _cadController.text.toString(),
        'pe': _peController.text.toString(),
        'ane': _aneController.text.toString(),
      };
      String inputJson = json.encode(inputFeatures);

      // Make a POST request to the Flask endpoint
      var response = await http.post(
        Uri.parse('http://localhost:5000/predict_kidney_disease'),
        headers: {'Content-Type': 'application/json'},
        body: inputJson,
      );

      // Decode the JSON response into a Map
      Map<String, dynamic> prediction = json.decode(response.body);

      // Update the state with the predicted class
      setState(() {
        _predictedClass = prediction['predicted_class'].toString();
      });
    }
  }

  @override
  
  
  
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    var currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Age'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _bpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Blood Pressure'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your blood pressure';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _alController,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Albumin level in the urine'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Albumin level in the urine';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _suController,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Sugar level in the urine'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Sugar level in the urine';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _rbcController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Presence of red blood cells in the urine'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Presence of red blood cells in the urine';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _pcController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Appearance of cells in the urine'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Appearance of cells in the urine';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _pccController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Presence of pus cells in the urine'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Presence of pus cells in the urine';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _baController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Presence of bacteria in the urine'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Presence of bacteria in the urine';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _bgrController,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Blood glucose level '),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Blood glucose level ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _buController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Blood urea level '),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Blood urea level ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _scController,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Serum creatinine level '),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Serum creatinine level';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _potController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Potassium level in the blood'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Potassium level in the blood';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _wcController,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'White blood cell count'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your White blood cell count';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _htnController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText:
                          'Whether the patient has hypertension (high blood pressure)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your high blood pressure';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _dmController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'diabetes mellitus'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your diabetes mellitus';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _cadController,
                  keyboardType: TextInputType.text,
                  decoration:
                      InputDecoration(labelText: 'coronary  artery disease'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your coronary artery disease';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _peController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'presence of excess protein in the urine'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your presence of excess protein in the urine';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _aneController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: ' patient has anemia'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your  patient has anemia';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
                SizedBox(height: 16.0),
                _predictedClass.isNotEmpty
                    ? Text(
                        'Prediction: ${_predictedClass == 0 ? "You have CKD" : "You do not have CKD"}',
                        style: TextStyle(fontSize: 18.0),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
        bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 74, 200, 234),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .17),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
             if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(title: '',),
                    ),
                  );
                }
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => profilesetting(),
                    ),
                  );
                }
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                // AnimatedContainer(
                //   duration: Duration(seconds: 1),
                //   curve: Curves.fastLinearToSlowEaseIn,
                //   width: index == currentIndex
                //       ? displayWidth * .32
                //       : displayWidth * .40,
                //   alignment: Alignment.center,
                //   child: AnimatedContainer(
                //     duration: Duration(seconds: 1),
                //     curve: Curves.fastLinearToSlowEaseIn,
                //     height: index == currentIndex ? displayWidth * .12 : 0,
                //     width: index == currentIndex ? displayWidth * .32 : 0,
                //     decoration: BoxDecoration(
                //         color: index == currentIndex
                //             ? Color.fromARGB(255, 232, 245, 245).withOpacity(.2)
                //             : Colors.transparent,
                //         borderRadius: BorderRadius.circular(50)),
                //   ),
                // ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .31
                      : displayWidth * .35,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .13 : 0,
                          ),
                         
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .03 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == currentIndex
                                ? Colors.black
                                : Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}