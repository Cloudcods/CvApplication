import 'package:application/Day15/Card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key});

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  final _formKey = GlobalKey<FormState>();
  final _ProjectNameController=TextEditingController();
  final _ProjectDescriptionController=TextEditingController();
  final _GitHubLinkController=TextEditingController();
  // for skill
  final _SkillController=TextEditingController();
  final _SkillDescriptionController=TextEditingController();



  @override
  void initState() {
    super.initState();
    _loadFormData();
  }

  // Saving the data
  Future<void> _saveFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setString('Project', _ProjectNameController.text);
     await prefs.setString('ProjectDescription', _ProjectDescriptionController.text);
     await prefs.setString('GitHubLink', _GitHubLinkController.text);
     await prefs.setString('Skill', _SkillController.text);
     await prefs.setString('SkillDescription', _SkillDescriptionController.text);
    
  }
  Future<void> _loadFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
                _ProjectNameController.text = prefs.getString('Project') ?? '';
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
                // Project Section
                Text(
                  'Project',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'List your most recent projects.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _ProjectNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.integration_instructions),
                    border: OutlineInputBorder(),
                    labelText: 'Project',
                    hintText: 'Your Project',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your project';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _ProjectDescriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    hintText: 'Describe the project',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20), // Space before the GitHub Link field
                TextFormField(
                  controller: _GitHubLinkController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.link),
                    border: OutlineInputBorder(),
                    labelText: 'GitHub Link',
                    hintText: 'Enter your GitHub profile link',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a GitHub link';
                    }
                    if (!Uri.parse(value).isAbsolute) {
                      return 'Please enter a valid URL';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Skill Section
                Text(
                  'Skill',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'List your skills with a brief description.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _SkillController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.build),
                    border: OutlineInputBorder(),
                    labelText: 'Skill',
                    hintText: 'Your Skill',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your skill';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _SkillDescriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    hintText: 'Describe your skill',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                  SizedBox(height: 10),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

