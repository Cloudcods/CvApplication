import 'package:application/day12/Expericience.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  final _formKey = GlobalKey<FormState>();
  final _schoolNameController = TextEditingController();
  final _degreeController = TextEditingController();
  final _cityController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _graduationDateController = TextEditingController();
  bool _isCurrentlyStudying = false;

  @override
  void initState() {
    super.initState();
    _loadFormData();
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _saveFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('School/UniversityName', _schoolNameController.text);
    await prefs.setString('Degree', _degreeController.text);
    await prefs.setString('City', _cityController.text);
    await prefs.setString('StartDate', _startDateController.text);
    await prefs.setString('GraduationDate', _graduationDateController.text);
    await prefs.setBool('CurrentlyStudying', _isCurrentlyStudying);
  }

  Future<void> _loadFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _schoolNameController.text = prefs.getString('School/UniversityName') ?? '';
      _degreeController.text = prefs.getString('Degree') ?? '';
      _cityController.text = prefs.getString('City') ?? '';
      _startDateController.text = prefs.getString('StartDate') ?? '';
      _graduationDateController.text = prefs.getString('GraduationDate') ?? '';
      _isCurrentlyStudying = prefs.getBool('CurrentlyStudying') ?? false;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your CV Application"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 64, 132, 241),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Education',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Give a detailed look into your academic history.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _schoolNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.school),
                    border: OutlineInputBorder(),
                    labelText: 'School/University Name',
                    hintText: 'Enter your School or University',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your School or University';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _degreeController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.rotate_90_degrees_ccw),
                          border: OutlineInputBorder(),
                          labelText: 'Degree',
                          hintText: 'Enter your Degree',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Degree';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_city),
                          border: OutlineInputBorder(),
                          labelText: 'City',
                          hintText: 'Enter city',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your city';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _selectDate(context, _startDateController, true),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: _startDateController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(),
                        labelText: 'Start Date',
                        hintText: 'Select Start Date',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a start date';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _isCurrentlyStudying,
                      onChanged: (value) {
                        setState(() {
                          _isCurrentlyStudying = value!;
                          if (_isCurrentlyStudying) {
                            _graduationDateController.text = "Present";
                          } else {
                            _graduationDateController.clear();
                          }
                        });
                      },
                    ),
                    Text("I currently study here"),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: !_isCurrentlyStudying
                      ? () => _selectDate(context, _graduationDateController, false)
                      : null,
                  child: AbsorbPointer(
                    absorbing: _isCurrentlyStudying,
                    child: TextFormField(
                      controller: _graduationDateController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(),
                        labelText: 'Graduation Date',
                        hintText: _isCurrentlyStudying ? 'Present' : 'enter the Date',
                      ),
                      validator: (value) {
                        if (!_isCurrentlyStudying && (value == null || value.isEmpty)) {
                          return 'Please select a graduation date';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _saveFormData().then((_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ExperiencePage()),
                        );
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 64, 132, 241),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Continue to Experience',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_ios),
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
