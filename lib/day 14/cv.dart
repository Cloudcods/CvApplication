import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  String _firstName = '';
  String _lastName = '';
  String _designation = '';
  String _address = '';
  String _contactCity = ''; // Renamed for contact information city
  String _email = '';
  String _mobileNumber = '';
  String _summary = '';
  String _socialLink = '';
  
  // For education
  String _schoolName = '';
  String _degree = '';
  String _educationCity = ''; // Renamed for education city
  String _educationStartDate = ''; // Renamed for education start date
  String _graduationDate = '';
  bool _isCurrentlyStudying = false;
  
  // For experience
  String _jobTitle = '';
  String _employer = '';
  String _experienceCity = ''; // Renamed for experience city
  String _experienceStartDate = ''; // Renamed for experience start date
  String _endDate = '';
  String _description = '';

  // for project and skill..
   String _Project = '';
  String _ProjectDescription = '';
  String _GitHubLink='';
  // for skill

  String _Skill='';
  String _SkillDescription='';


  @override
  void initState() {
    super.initState();
    _loadFormData();
  }

  Future<void> _loadFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _firstName = prefs.getString('Firstname') ?? '';
      _lastName = prefs.getString('Lastname') ?? '';
      _designation = prefs.getString('Designation') ?? '';
      _address = prefs.getString('Address') ?? '';
      _contactCity = prefs.getString('City') ?? ''; 
      _email = prefs.getString('Email') ?? '';
      _mobileNumber = prefs.getString('MobileNumber') ?? '';
      _summary = prefs.getString('Summary') ?? ''; 
      _socialLink = prefs.getString('SocialLink') ?? '';
      
      _schoolName = prefs.getString('School/UniversityName') ?? '';
      _degree = prefs.getString('Degree') ?? '';
      _educationCity = prefs.getString('City') ?? '';
      _educationStartDate = prefs.getString('StartDate') ?? '';
      _graduationDate = prefs.getString('GraduationDate') ?? '';
      _isCurrentlyStudying = prefs.getBool('CurrentlyStudying') ?? false;
      
      _jobTitle = prefs.getString('ExperienceJobTitle') ?? '';
      _employer = prefs.getString('ExperienceEmployer') ?? '';
      _experienceCity = prefs.getString('ExperienceCity') ?? '';
      _experienceStartDate = prefs.getString('ExperienceStartDate') ?? '';
      _endDate = prefs.getString('ExperienceEndDate') ?? '';
      _description = prefs.getString('ExperienceDescription') ?? '';

      _Project = prefs.getString('Project') ?? '';
     _ProjectDescription = prefs.getString('ProjectDescription') ?? '';
     _GitHubLink = prefs.getString('GitHubLink') ?? '';

     _Skill= prefs.getString('Skill') ?? '';
     _SkillDescription= prefs.getString('SkillDescription') ?? '';

    
    
      

    
  });
}


    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resume"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 64, 132, 241),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top section with name, designation, and horizontal line
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$_firstName $_lastName',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  _designation,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.black,
                ),
                SizedBox(height: 20), // Space after the top section
              ],
            ),
            // Main content with contact, summary, and skills
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Content on the left with contact information
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Contact information
                        Text(
                          'Contact Information',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(_mobileNumber),
                        Text(_email),
                        Text('$_address, $_contactCity'), // Display contact city with address
                        Text('LinkedIn: ' + _socialLink), // Add social link
                        SizedBox(height: 20),
                        // Other sections as needed...

                          SizedBox(height: 10),

                        // Skills
                        Text(
                          'Skills',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                                      SizedBox(height: 10),
                       Text(
  _Skill.isNotEmpty
      ? '$_Skill'
      : 'No project data available',
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
),

   Text(
                          _SkillDescription.isNotEmpty ? _SkillDescription : 'No description available',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),

                      
                      ],
                    ),
                  ),
                        
                      
            
                  // Vertical line separator
                  Container(
                    width: 2,
                    height: double.infinity,
                    color: Colors.grey[400],
                    margin: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  // Content on the right with summary
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Summary',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                        SizedBox(height: 10),
                        Text(
                          _summary,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Colors.black,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Education',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          _degree.isNotEmpty && _schoolName.isNotEmpty
                              ? '$_degree from $_schoolName'
                              : 'No education data available',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '$_educationCity / $_educationStartDate - ${_isCurrentlyStudying ? "Present" : _graduationDate}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Colors.black,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Experience',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          _jobTitle.isNotEmpty && _employer.isNotEmpty
                              ? '$_jobTitle at $_employer'
                              : 'No experience data available',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '$_experienceCity / $_experienceStartDate - $_endDate',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          _description.isNotEmpty ? _description : 'No description available',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Colors.black,
                        ),
                      SizedBox(height: 10),
                        Text(
                          'Project',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      SizedBox(height: 10),
                       Text(
  _Project.isNotEmpty
      ? '$_Project'
      : 'No project data available',
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
),
                       Text(
                          _ProjectDescription.isNotEmpty ? _ProjectDescription : 'No description available',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                                                SizedBox(height: 10),
                                              Text('GitHubLink: ' + _GitHubLink), // Add social link


                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
