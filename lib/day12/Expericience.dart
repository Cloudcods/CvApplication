import 'package:application/day13/projects.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  final _formKey = GlobalKey<FormState>();
  final _jobTitleController = TextEditingController();
  final _employerController = TextEditingController();
  final _cityController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime? _startDate;  // 
  DateTime? _endDate;    // 

  final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          _startDateController.text = _dateFormatter.format(picked);
        } else {
          _endDate = picked;
          _endDateController.text = _dateFormatter.format(picked);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadFormData();
  }

  // Saving the data
  Future<void> _saveFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('ExperienceJobTitle', _jobTitleController.text);
    await prefs.setString('ExperienceEmployer', _employerController.text);
    await prefs.setString('ExperienceCity', _cityController.text);
    await prefs.setString('ExperienceStartDate', _startDateController.text);
    await prefs.setString('ExperienceEndDate', _endDateController.text);
    await prefs.setString('ExperienceDescription', _descriptionController.text);
  }

  // Loading the saved data
  Future<void> _loadFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _jobTitleController.text = prefs.getString('ExperienceJobTitle') ?? '';
      _employerController.text = prefs.getString('ExperienceEmployer') ?? '';
      _cityController.text = prefs.getString('ExperienceCity') ?? '';
      _startDateController.text = prefs.getString('ExperienceStartDate') ?? '';
      _endDateController.text = prefs.getString('ExperienceEndDate') ?? '';
      _descriptionController.text = prefs.getString('ExperienceDescription') ?? '';
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
                  'Experience',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Include your career history. Give a brief insight into the role you played and the responsibilities you carried out at each workplace.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _jobTitleController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.work),
                    border: OutlineInputBorder(),
                    labelText: 'Job Title',
                    hintText: 'Your Job',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your job title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _employerController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.workspace_premium),
                          border: OutlineInputBorder(),
                          labelText: 'Employer/Organization',
                          hintText: 'Enter your Organization',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your organization';
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
                          prefixIcon: Icon(Icons.place),
                          border: OutlineInputBorder(),
                          labelText: 'City',
                          hintText: 'City',
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
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _selectDate(context, true),
                        child: Text(
                          _startDateController.text.isEmpty
                              ? 'Select Start Date'
                              : 'Start Date: ${_startDateController.text}',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _selectDate(context, false),
                        child: Text(
                          _endDateController.text.isEmpty
                              ? 'Select End Date'
                              : 'End Date: ${_endDateController.text}',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    hintText: 'Describe your role and responsibilities',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _saveFormData().then((_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyProjects()),
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
                        'Continue to Projects',
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
