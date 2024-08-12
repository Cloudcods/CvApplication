import 'package:application/Day15/Card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MycvApp extends StatefulWidget {
  const MycvApp({super.key});

  @override
  State<MycvApp> createState() => _MycvAppState();
}

class _MycvAppState extends State<MycvApp> {
  final _formKey = GlobalKey<FormState>();

  // Personal Details
  final _FirstnameController = TextEditingController();
  final _LastnameController = TextEditingController();
  final _DesignationController = TextEditingController();
  final _AddressController = TextEditingController();
  final _CityController = TextEditingController();
  final _EmailController = TextEditingController();
  final _MobileNumberController = TextEditingController();
  final _SummaryController = TextEditingController();
  final _SocialLinkController = TextEditingController();

  // Education Details
  final _SchoolNameController = TextEditingController();
  final _DegreeController = TextEditingController();
  final _EducationCityController = TextEditingController();
  final _StartDateController = TextEditingController();
  final _GraduationDateController = TextEditingController();
  bool _isCurrentlyStudying = false;

  // Experience Details
  final _JobTitleController = TextEditingController();
  final _EmployerController = TextEditingController();
  final _ExperienceCityController = TextEditingController();
  final _ExperienceStartDateController = TextEditingController();
  final _ExperienceEndDateController = TextEditingController();
  final _DescriptionController = TextEditingController();

  // Project Details
  final _ProjectController = TextEditingController();
  final _ProjectDescriptionController = TextEditingController();
  final _GitHubLinkController= TextEditingController();

  // Skill Details
  final _SkillController = TextEditingController();
  final _SkillDescriptionController = TextEditingController();

  // Select Date
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
//   @override
// void initState() {
//   super.initState();
//   // Load data when the widget is initialized
// }


//   // Save Form Data
//   void _saveFormData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     List<String> newData = [
//       _ControllerFirstname.text,
//       _ControllerLastname.text,
//       _ControllerDesignation.text,
//       _ControllerAddress.text,
//       _ControllerCity.text,
//       _ControllerEmail.text,
//       _ControllerMobileNumber.text,
//       _ControllerSummary.text,
//       _ControllerSocialLink.text,
//       // Education
//       _ControllerSchoolName.text,
//       _ControllerDegree.text,
//       _ControllerEducationCity.text,
//       _ControllerStartDate.text,
//       _ControllerGraduationDate.text,
//       // Experience
//       _ControllerJobTitle.text,
//       _ControllerEmployer.text,
//       _ControllerExperienceCity.text,
//       _ControllerExperienceStartDate.text,
//       _ControllerExperienceEndDate.text,
//       _ControllerDescription.text,
//       // Project
//       _CntrollerProject.text,
//       _ControllerProjectDescription.text,
//       _ControllerGitHubLink.text,
//       // Skill
//       _ControllerSkill.text,
//       _ControllerSkillDescription.text,
//     ];
//     void _loadFormData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   List<String> savedData = prefs.getStringList('formData') ?? [];
  
//   if (savedData.isNotEmpty) {
//     List<String> latestData = savedData.last.split('||');

//     setState(() {
//       _ControllerFirstname.text = latestData[0];
//       _ControllerLastname.text = latestData[1];
//       _ControllerDesignation.text = latestData[2];
//       _ControllerAddress.text = latestData[3];
//       _ControllerCity.text = latestData[4];
//       _ControllerEmail.text = latestData[5];
//       _ControllerMobileNumber.text = latestData[6];
//       _ControllerSummary.text = latestData[7];
//       _ControllerSocialLink.text = latestData[8];

//       _ControllerSchoolName.text = latestData[9];
//       _ControllerDegree.text = latestData[10];
//       _ControllerEducationCity.text = latestData[11];
//       _ControllerStartDate.text = latestData[12];
//       _ControllerGraduationDate.text = latestData[13];

//       _ControllerJobTitle.text = latestData[14];
//       _ControllerEmployer.text = latestData[15];
//       _ControllerExperienceCity.text = latestData[16];
//       _ControllerExperienceStartDate.text = latestData[17];
//       _ControllerExperienceEndDate.text = latestData[18];
//       _ControllerDescription.text = latestData[19];

//       _CntrollerProject.text = latestData[20];
//       _ControllerProjectDescription.text = latestData[21];
//       _ControllerGitHubLink.text = latestData[22];

//       _ControllerSkill.text = latestData[23];
//       _ControllerSkillDescription.text = latestData[24];
//     });
//   }
// }


//     // Retrieve existing submissions
//     List<String> existingData = prefs.getStringList('formData') ?? [];

//     // Add new submission to the list
//     existingData.add(newData.join('||'));

//     // Save the updated list
//     await prefs.setStringList('formData', existingData);
//   }
 @override
  void initState() {
    super.initState();
    _loadFormData();
  }

  Future<void> _saveFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Firstname',_FirstnameController.text);
    await prefs.setString('Lastname', _LastnameController.text);
    await prefs.setString('Designation', _DesignationController.text);
    await prefs.setString('Address', _AddressController.text);
    await prefs.setString('City', _CityController.text);
    await prefs.setString('Email', _EmailController.text);
    await prefs.setString('MobileNumber', _MobileNumberController.text);
    await prefs.setString('Summary', _SummaryController.text); // Store as String
    await prefs.setString('SocialLink', _SocialLinkController.text); // Store as String
//for education
    await prefs.setString('School/UniversityName', _SchoolNameController.text);
    await prefs.setString('Degree', _DegreeController.text);
    await prefs.setString('City', _EducationCityController.text);
    await prefs.setString('StartDate', _StartDateController.text);
    await prefs.setString('GraduationDate', _GraduationDateController.text);
    await prefs.setBool('CurrentlyStudying', _isCurrentlyStudying);
    //for expeerience
    await prefs.setString('ExperienceJobTitle', _JobTitleController.text);
    await prefs.setString('ExperienceEmployer', _EmployerController.text);
    await prefs.setString('ExperienceCity', _ExperienceCityController.text);
    await prefs.setString('ExperienceStartDate', _ExperienceStartDateController.text);
    await prefs.setString('ExperienceEndDate', _ExperienceEndDateController.text);
    await prefs.setString('ExperienceDescription', _DescriptionController.text);
    //for skills and project
    await prefs.setString('Project', _ProjectController.text);
     await prefs.setString('ProjectDescription', _ProjectDescriptionController.text);
     await prefs.setString('GitHubLink', _GitHubLinkController.text);
     await prefs.setString('Skill', _SkillController.text);
     await prefs.setString('SkillDescription', _SkillDescriptionController.text);

  }
 Future<void> _loadFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
       _FirstnameController.text = prefs.getString('Firstname') ?? '';
      _LastnameController.text = prefs.getString('Lastname') ?? '';
      _DesignationController.text = prefs.getString('Designation') ?? '';
      _AddressController.text = prefs.getString('Address') ?? '';
      _CityController.text = prefs.getString('City') ?? '';
      _EmailController.text = prefs.getString('Email') ?? '';
      _MobileNumberController.text = prefs.getString('MobileNumber') ?? '';
      _SummaryController.text = prefs.getString('Summary') ?? '';
      _SocialLinkController.text = prefs.getString('SocialLink') ?? '';
      _SchoolNameController.text = prefs.getString('School/UniversityName') ?? '';
      _DegreeController.text = prefs.getString('Degree') ?? '';
      _EducationCityController.text = prefs.getString('City') ?? '';
      _StartDateController.text = prefs.getString('StartDate') ?? '';
      _GraduationDateController.text = prefs.getString('GraduationDate') ?? '';
      _isCurrentlyStudying = prefs.getBool('CurrentlyStudying') ?? false;
       _JobTitleController.text = prefs.getString('ExperienceJobTitle') ?? '';
      _EmployerController.text = prefs.getString('ExperienceEmployer') ?? '';
      _ExperienceCityController.text = prefs.getString('ExperienceCity') ?? '';
      _ExperienceStartDateController.text = prefs.getString('ExperienceStartDate') ?? '';
      _ExperienceEndDateController.text = prefs.getString('ExperienceEndDate') ?? '';
      _DescriptionController.text = prefs.getString('ExperienceDescription') ?? '';
      _ProjectController.text = prefs.getString('Project') ?? '';
      _ProjectDescriptionController.text = prefs.getString('ProjectDescription') ?? '';
      _GitHubLinkController.text = prefs.getString('GitHubLink') ?? '';
      _SkillController.text = prefs.getString('Skill') ?? '';
      _SkillDescriptionController.text = prefs.getString('SkillDescription') ?? '';

    });
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
          child: Form(
            key: _formKey,
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
                        controller: _FirstnameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          labelText: 'First Name',
                          hintText: 'Enter First Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _LastnameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          labelText: 'Last Name',
                          hintText: 'Enter Last Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _DesignationController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.work),
                    border: OutlineInputBorder(),
                    labelText: 'Designation',
                    hintText: 'Your Designation',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Designation';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _AddressController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.place),
                          border: OutlineInputBorder(),
                          labelText: 'Address',
                          hintText: 'Your Address',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _CityController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.location_city),
                          border: OutlineInputBorder(),
                          labelText: 'City',
                          hintText: 'Your City',
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
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _EmailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_sharp),
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Your Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _MobileNumberController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                          labelText: 'Mobile Number',
                          hintText: 'Your Number',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Mobile Number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _SummaryController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                    labelText: 'Summary',
                    hintText: 'Enter a brief summary about yourself',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a summary';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _SocialLinkController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.link),
                    border: OutlineInputBorder(),
                    labelText: 'Social Media Link',
                    hintText: 'Enter your social media profile link',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a social media link';
                    }
                    if (!Uri.parse(value).isAbsolute) {
                      return 'Please enter a valid URL';
                    }
                    return null;
                  },
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
                  controller: _SchoolNameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.school),
                    border: OutlineInputBorder(),
                    labelText: 'School Name',
                    hintText: 'Enter School Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your school name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _DegreeController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.school),
                    border: OutlineInputBorder(),
                    labelText: 'Degree',
                    hintText: 'Enter Degree',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your degree';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _EducationCityController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                    labelText: 'City',
                    hintText: 'Enter Education City',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _StartDateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                    labelText: 'Start Date',
                  ),
                  onTap: () => _selectDate(context, _StartDateController),
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
            _GraduationDateController.text = "Present";
          } else {
            _GraduationDateController.clear();
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
      ? () => _selectDate(context, _GraduationDateController)
      : null,
  child: AbsorbPointer(
    absorbing: _isCurrentlyStudying,
    child: TextFormField(
      controller: _GraduationDateController,
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
                  'EXperience',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                const Text(
                  'Provide details of your work experience.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _JobTitleController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.work),
                    border: OutlineInputBorder(),
                    labelText: 'Job Title',
                    hintText: 'Enter Job Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your job title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _EmployerController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.business),
                    border: OutlineInputBorder(),
                    labelText: 'Employer',
                    hintText: 'Enter Employer',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your employer';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _ExperienceCityController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                    labelText: 'City',
                    hintText: 'Enter City of Employment',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the city where you worked';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _ExperienceStartDateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                    labelText: 'Start Date',
                  ),
                  onTap: () => _selectDate(context, _ExperienceStartDateController),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select the start date';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _ExperienceEndDateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                    labelText: 'End Date',
                  ),
                  onTap: () => _selectDate(context, _ExperienceEndDateController),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select the end date';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _DescriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    hintText: 'Describe your responsibilities and achievements',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description of your experience';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Project Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'List your projects with descriptions and GitHub links.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _ProjectController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.work),
                    border: OutlineInputBorder(),
                    labelText: 'Project Name',
                    hintText: 'Enter Project Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the project name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _ProjectDescriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                    labelText: 'Project Description',
                    hintText: 'Enter a brief description of the project',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description of the project';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _GitHubLinkController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.link),
                    border: OutlineInputBorder(),
                    labelText: 'GitHub Link',
                    hintText: 'Enter GitHub Repository Link',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the GitHub link';
                    }
                    if (!Uri.parse(value).isAbsolute) {
                      return 'Please enter a valid URL';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Skill Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'List your skills with a brief description.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _SkillController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.star),
                    border: OutlineInputBorder(),
                    labelText: 'Skill',
                    hintText: 'Enter a Skill',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a skill';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _SkillDescriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                    labelText: 'Skill Description',
                    hintText: 'Enter a brief description of the skill',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description of the skill';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                  
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _saveFormData().then((_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>CardPage()),
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
                        'Generate CV',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.file_copy),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

