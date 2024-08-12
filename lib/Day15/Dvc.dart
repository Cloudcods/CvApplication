import 'dart:convert';

import 'package:application/Day15/cv%20page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';


class mydvcapp extends StatefulWidget {
  const mydvcapp({super.key});

  @override
  State<mydvcapp> createState() => _mydvcappState();
}

class _mydvcappState extends State<mydvcapp> {
  final _ControllerFirstname = TextEditingController();
  final _ControllerLastname = TextEditingController();
  final _ControllerDesignation = TextEditingController();
  final _ControllerAddress = TextEditingController();
  final _ControllerCity = TextEditingController();
  final _ControllerEmail = TextEditingController();
  final _ControllerMobileNumber = TextEditingController();
  final _ControllerSummary = TextEditingController();
  final _ControllerSocialLink = TextEditingController();
  final _ControllerSchoolName = TextEditingController();
  final _ControllerDegree = TextEditingController();
  final _ControllerEducationCity = TextEditingController();
  final _ControllerStartDate = TextEditingController();
  final _ControllerGraduationDate = TextEditingController();
  
  bool _isCurrentlyStudying = false;
  final _ControllerJobTitle = TextEditingController();
  final _ControllerEmployer = TextEditingController();
  final _ControllerExperienceCity = TextEditingController();
  final _ControllerExperienceStartDate = TextEditingController();
  final _ControllerExperienceEndDate = TextEditingController();
  final _ControllerDescription = TextEditingController();
  final _ControllerProject = TextEditingController();
  final _ControllerProjectDescription = TextEditingController();
  final _ControllerGitHubLink = TextEditingController();
  final _ControllerSkill = TextEditingController();
  final _ControllerSkillDescription = TextEditingController();
  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
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

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  void _saveFormData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? imageBase64;
  if (_imageFile != null) {
    // Read the image as bytes
    File imageFile = File(_imageFile!.path);
    final imageBytes = imageFile.readAsBytesSync();
    
    // Encode image to base64
    imageBase64 = base64Encode(imageBytes);
  }

    List<String> newData = [
      _ControllerFirstname.text,
      _ControllerLastname.text,
      _ControllerDesignation.text,
      _ControllerAddress.text,
      _ControllerCity.text,
      _ControllerEmail.text,
      _ControllerMobileNumber.text,
      _ControllerSummary.text,
      _ControllerSocialLink.text,
      _ControllerSchoolName.text,
      _ControllerDegree.text,
      _ControllerEducationCity.text,
      _ControllerStartDate.text,
      _ControllerGraduationDate.text,
      
       _isCurrentlyStudying.toString(),
      _ControllerJobTitle.text,
      _ControllerEmployer.text,
      _ControllerExperienceCity.text,
      _ControllerExperienceStartDate.text,
      _ControllerExperienceEndDate.text,
      _ControllerDescription.text,
      _ControllerProject.text,
      _ControllerProjectDescription.text,
      _ControllerGitHubLink.text,
      _ControllerSkill.text,
      _ControllerSkillDescription.text,
      imageBase64 ?? '',
      
    ];
 

    
    // Retrieve existing submissions
    List<String> existingData = prefs.getStringList('formData') ?? [];

    // Add new submission to the list
    existingData.add(newData.join('||'));

    // Save the updated list
    await prefs.setStringList('formData', existingData);
  }




@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your CV Application"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 64, 132, 241),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Personal Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Fill out your primary information.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _ControllerFirstname,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        labelText: 'First Name',
                        hintText: 'Enter First Name',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _ControllerLastname,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        labelText: 'Last Name',
                        hintText: 'Enter Last Name',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ControllerDesignation,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.work),
                  border: OutlineInputBorder(),
                  labelText: 'Designation',
                  hintText: 'Your Designation',
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.upload_file, color: Colors.grey),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _imageFile == null
                              ? 'Upload Passport SizeImg'
                              : ' Img Selected: ${_imageFile!.name}',
                          style: const TextStyle(fontSize: 16),
                           ),
                      ),
                    ],
                  ),
                ),
              ),
                      
                   
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _ControllerAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.place),
                        border: OutlineInputBorder(),
                        labelText: 'Address',
                        hintText: 'Your Address',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _ControllerCity,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.location_city),
                        border: OutlineInputBorder(),
                        labelText: 'City',
                        hintText: 'Your City',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _ControllerEmail,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_sharp),
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Your Email',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(


child: TextFormField(
                      controller: _ControllerMobileNumber,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(),
                        labelText: 'Mobile Number',
                        hintText: 'Your Number',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ControllerSummary,
                maxLines: 3,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(),
                  labelText: 'Summary',
                  hintText: 'Enter a brief summary about yourself',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _ControllerSocialLink,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.link),
                  border: OutlineInputBorder(),
                  labelText: 'Social Media Link',
                  hintText: 'Enter your social media profile link',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Education Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Give a detailed look into your academic history.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ControllerSchoolName,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.school),
                  border: OutlineInputBorder(),
                  labelText: 'School Name',
                  hintText: 'Enter School Name',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ControllerDegree,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.school),
                  border: OutlineInputBorder(),
                  labelText: 'Degree',
                  hintText: 'Enter Degree',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ControllerEducationCity,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_city),
                  border: OutlineInputBorder(),
                  labelText: 'City',
                  hintText: 'City',
                ),
              ),
              const SizedBox(height: 10),
               TextFormField(
                  controller: _ControllerStartDate,
                  readOnly: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                    labelText: 'Start Date',
                  ),
                  onTap: () => _selectDate(context, _ControllerStartDate),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select the start date';
                    }
                    return null;
                  },
                ),
               SizedBox(height: 20),
             // Updated code for the Graduation Date field
Row(
  children: [
    Checkbox(
      value: _isCurrentlyStudying,
      onChanged: (value) {
        setState(() {
          _isCurrentlyStudying = value!;
          if (_isCurrentlyStudying) {
            _ControllerGraduationDate.text = "Present";
          } else {
            _ControllerGraduationDate.clear();
          }
        });
      },
    ),
    const Text("I currently study here"),
  ],
),
const SizedBox(height: 10),
GestureDetector(
  onTap: !_isCurrentlyStudying
      ? () => _selectDate(context, _ControllerGraduationDate)
      : null,
  child: AbsorbPointer(
    absorbing: _isCurrentlyStudying,
    child: TextFormField(
      controller: _ControllerGraduationDate,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.date_range),
        border: const OutlineInputBorder(),
        labelText: 'Graduation Date',
        hintText: _isCurrentlyStudying ? 'Present' : 'Enter Graduation Date',
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

              const SizedBox(height: 10),
              const Text(
                'Experience',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Include your work experience.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ControllerJobTitle,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.work),
                  border: OutlineInputBorder(),
                  labelText: 'Job Title',
                  hintText: 'Job Title',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ControllerEmployer,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.business),
                  border: OutlineInputBorder(),
                  labelText: 'Employer',
                  hintText: 'Employer',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ControllerExperienceCity,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_city),
                  border: OutlineInputBorder(),
                  labelText: 'City',
                  hintText: 'City',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                  controller: _ControllerExperienceStartDate,
                  readOnly: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                    labelText: 'Start Date',
                  ),
                  onTap: () => _selectDate(context, _ControllerExperienceStartDate),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select the start date';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _ControllerExperienceEndDate,
                  readOnly: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                    labelText: 'End Date',
                  ),
                  onTap: () => _selectDate(context, _ControllerExperienceEndDate),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select the end date';
                    }
                    return null;
                  },
                ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ControllerDescription,
                maxLines: 3,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  hintText: 'Describe your responsibilities and achievements',
                ),
              ),
              const SizedBox(height: 20),


const Text(
                'Projects',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Highlight the projects you have worked on.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ControllerProject,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.build),
                  border: OutlineInputBorder(),
                  labelText: 'Project',
                  hintText: 'Project',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ControllerProjectDescription,
                maxLines: 3,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  hintText: 'Describe the project',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ControllerGitHubLink,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.link),
                  border: OutlineInputBorder(),
                  labelText: 'GitHub Link',
                  hintText: 'GitHub Link',
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Skills',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Showcase your skill set.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ControllerSkill,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.star),
                  border: OutlineInputBorder(),
                  labelText: 'Skill',
                  hintText: 'Skill',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ControllerSkillDescription,
                maxLines: 3,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  hintText: 'Describe your proficiency',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _saveFormData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MultiPage(),
                      ),
                    );
                  });
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  
