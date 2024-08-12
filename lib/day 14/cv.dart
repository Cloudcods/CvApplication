

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  String _Firstname = '';
  String _Lastname = '';
  String _Designation = '';
  String _Address = '';
  String _City = ''; // Renamed for contact information city
  String _Email = '';
  String _MobileNumber = '';
  String _Summary = '';
  String _SocialLink = '';
  
  // For education
  String _SchoolName = '';
  String _Degree = '';
  String _EducationCity = ''; // Renamed for education city
  String _StartDate = ''; // Renamed for education start date
  String _GraduationDate = '';
  bool _isCurrentlyStudying = false;
  
  // For experience
  String _JobTitle = '';
  String _Employer = '';
  String _ExperienceCity = ''; // Renamed for experience city
  String _ExperienceStartDate = ''; // Renamed for experience start date
  String _EndDate = '';
  String _Description = '';

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
      _Firstname = prefs.getString('Firstname') ?? '';
      _Lastname = prefs.getString('Lastname') ?? '';
      _Designation = prefs.getString('Designation') ?? '';
      _Address = prefs.getString('Address') ?? '';
      _City = prefs.getString('City') ?? ''; 
      _Email = prefs.getString('Email') ?? '';
      _MobileNumber = prefs.getString('MobileNumber') ?? '';
      _Summary = prefs.getString('Summary') ?? ''; 
      _SocialLink = prefs.getString('SocialLink') ?? '';
      
      _SchoolName = prefs.getString('School/UniversityName') ?? '';
      _Degree = prefs.getString('Degree') ?? '';
      _EducationCity = prefs.getString('City') ?? '';
      _StartDate = prefs.getString('StartDate') ?? '';
      _GraduationDate = prefs.getString('GraduationDate') ?? '';
      _isCurrentlyStudying = prefs.getBool('CurrentlyStudying') ?? false;
      
      _JobTitle = prefs.getString('ExperienceJobTitle') ?? '';
      _Employer = prefs.getString('ExperienceEmployer') ?? '';
      _ExperienceCity = prefs.getString('ExperienceCity') ?? '';
      _ExperienceStartDate = prefs.getString('ExperienceStartDate') ?? '';
      _EndDate = prefs.getString('ExperienceEndDate') ?? '';
      _Description = prefs.getString('ExperienceDescription') ?? '';

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
                  '$_Firstname $_Lastname',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  _Designation,
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
                        Text(_MobileNumber),
                        Text(_Email),
                        Text('$_Address, $_City'), // Display contact city with address
                        Text('LinkedIn: ' + _SocialLink), // Add social link
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
                          _Summary,
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
                          _Degree.isNotEmpty && _SchoolName.isNotEmpty
                              ? '$_Degree from $_SchoolName'
                              : 'No education data available',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '$_EducationCity / $_StartDate - ${_isCurrentlyStudying ? "Present" : _GraduationDate}',
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
                          _JobTitle.isNotEmpty && _Employer.isNotEmpty
                              ? '$_JobTitle at $_Employer'
                              : 'No experience data available',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '$_ExperienceCity / $_ExperienceStartDate - $_EndDate',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          _Description.isNotEmpty ? _Description : 'No description available',
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

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ResumePage extends StatefulWidget {
//   const ResumePage({super.key});

//   @override
//   State<ResumePage> createState() => _ResumePageState();
// }

// class _ResumePageState extends State<ResumePage> {
//   String _firstName = '';
//   String _lastName = '';
//   String _designation = '';
//   String _address = '';
//   String _contactCity = ''; // Renamed for contact information city
//   String _email = '';
//   String _mobileNumber = '';
//   String _summary = '';
//   String _socialLink = '';
  
//   // For education
//   String _schoolName = '';
//   String _degree = '';
//   String _educationCity = ''; // Renamed for education city
//   String _educationStartDate = ''; // Renamed for education start date
//   String _graduationDate = '';
//   bool _isCurrentlyStudying = false;
  
//   // For experience
//   String _jobTitle = '';
//   String _employer = '';
//   String _experienceCity = ''; // Renamed for experience city
//   String _experienceStartDate = ''; // Renamed for experience start date
//   String _endDate = '';
//   String _description = '';

//   // for project and skill..
//    String _Project = '';
//   String _ProjectDescription = '';
//   String _GitHubLink='';
//   // for skill

//   String _Skill='';
//   String _SkillDescription='';


//   @override
//   void initState() {
//     super.initState();
//     _loadFormData();
//   }

//   Future<void> _loadFormData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _firstName = prefs.getString('Firstname') ?? '';
//       _lastName = prefs.getString('Lastname') ?? '';
//       _designation = prefs.getString('Designation') ?? '';
//       _address = prefs.getString('Address') ?? '';
//       _contactCity = prefs.getString('City') ?? ''; 
//       _email = prefs.getString('Email') ?? '';
//       _mobileNumber = prefs.getString('MobileNumber') ?? '';
//       _summary = prefs.getString('Summary') ?? ''; 
//       _socialLink = prefs.getString('SocialLink') ?? '';
      
//       _schoolName = prefs.getString('School/UniversityName') ?? '';
//       _degree = prefs.getString('Degree') ?? '';
//       _educationCity = prefs.getString('City') ?? '';
//       _educationStartDate = prefs.getString('StartDate') ?? '';
//       _graduationDate = prefs.getString('GraduationDate') ?? '';
//       _isCurrentlyStudying = prefs.getBool('CurrentlyStudying') ?? false;
      
//       _jobTitle = prefs.getString('ExperienceJobTitle') ?? '';
//       _employer = prefs.getString('ExperienceEmployer') ?? '';
//       _experienceCity = prefs.getString('ExperienceCity') ?? '';
//       _experienceStartDate = prefs.getString('ExperienceStartDate') ?? '';
//       _endDate = prefs.getString('ExperienceEndDate') ?? '';
//       _description = prefs.getString('ExperienceDescription') ?? '';

//       _Project = prefs.getString('Project') ?? '';
//      _ProjectDescription = prefs.getString('ProjectDescription') ?? '';
//      _GitHubLink = prefs.getString('GitHubLink') ?? '';

//      _Skill= prefs.getString('Skill') ?? '';
//      _SkillDescription= prefs.getString('SkillDescription') ?? '';

    
    
      

    
//   });
// }


    

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Resume"),
//         centerTitle: true,
//         backgroundColor: Color.fromARGB(255, 64, 132, 241),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Top section with name, designation, and horizontal line
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '$_firstName $_lastName',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   _designation,
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.grey[700],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   width: double.infinity,
//                   height: 2,
//                   color: Colors.black,
//                 ),
//                 SizedBox(height: 20), // Space after the top section
//               ],
//             ),
//             // Main content with contact, summary, and skills
//             Expanded(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Content on the left with contact information
//                   Expanded(
//                     flex: 1,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Contact information
//                         Text(
//                           'Contact Information',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text(_mobileNumber),
//                         Text(_email),
//                         Text('$_address, $_contactCity'), // Display contact city with address
//                         Text('LinkedIn: ' + _socialLink), // Add social link
//                         SizedBox(height: 20),
//                         // Other sections as needed...

//                           SizedBox(height: 10),

//                         // Skills
//                         Text(
//                           'Skills',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                                       SizedBox(height: 10),
//                        Text(
//   _Skill.isNotEmpty
//       ? '$_Skill'
//       : 'No project data available',
//   style: TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.bold,
//   ),
// ),

//    Text(
//                           _SkillDescription.isNotEmpty ? _SkillDescription : 'No description available',
//                           style: TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),

                      
//                       ],
//                     ),
//                   ),
                        
                      
            
//                   // Vertical line separator
//                   Container(
//                     width: 2,
//                     height: double.infinity,
//                     color: Colors.grey[400],
//                     margin: EdgeInsets.symmetric(horizontal: 20),
//                   ),
//                   // Content on the right with summary
//                   Expanded(
//                     flex: 3,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Summary',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
                        
//                         SizedBox(height: 10),
//                         Text(
//                           _summary,
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         SizedBox(height: 20),
//                         Container(
//                           width: double.infinity,
//                           height: 2,
//                           color: Colors.black,
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           'Education',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           _degree.isNotEmpty && _schoolName.isNotEmpty
//                               ? '$_degree from $_schoolName'
//                               : 'No education data available',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           '$_educationCity / $_educationStartDate - ${_isCurrentlyStudying ? "Present" : _graduationDate}',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Container(
//                           width: double.infinity,
//                           height: 2,
//                           color: Colors.black,
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           'Experience',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           _jobTitle.isNotEmpty && _employer.isNotEmpty
//                               ? '$_jobTitle at $_employer'
//                               : 'No experience data available',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           '$_experienceCity / $_experienceStartDate - $_endDate',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           _description.isNotEmpty ? _description : 'No description available',
//                           style: TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Container(
//                           width: double.infinity,
//                           height: 2,
//                           color: Colors.black,
//                         ),
//                       SizedBox(height: 10),
//                         Text(
//                           'Project',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       SizedBox(height: 10),
//                        Text(
//   _Project.isNotEmpty
//       ? '$_Project'
//       : 'No project data available',
//   style: TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.bold,
//   ),
// ),
//                        Text(
//                           _ProjectDescription.isNotEmpty ? _ProjectDescription : 'No description available',
//                           style: TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                                                 SizedBox(height: 10),
//                                               Text('GitHubLink: ' + _GitHubLink), // Add social link


//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// // 
// // import 'package:shared_preferences/shared_preferences.dart';

// // class ResumePage extends StatefulWidget {
// //   const ResumePage({super.key});

// //   @override
// //   State<ResumePage> createState() => _ResumePageState();
// // }

// // class _ResumePageState extends State<ResumePage> {
// //   List<String> _formData = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadFormData();
// //   }

// //   void _loadFormData() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();

// //     // Retrieve all submissions
// //     List<String> storedData = prefs.getStringList('formData') ?? [];

// //     setState(() {
// //       _formData = storedData;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: _formData.isEmpty
// //           ? const Center(child: Text('No data available'))
// //           : ListView.builder(
// //               itemCount: _formData.length,
// //               itemBuilder: (context, index) {
// //                 final currentData = _formData[index].split('||');

// //                 // Ensure that currentData has all required elements before using them
// //                 if (currentData.length < 15) {
// //                   return const Text('Data is incomplete');
// //                 }

// //                 String _firstName = currentData[0];
// //                 String _lastName = currentData[1];
// //                 String _designation = currentData[2];
// //                 String _mobileNumber = currentData[3];
// //                 String _email = currentData[4];
// //                 String _address = currentData[5];
// //                 String _contactCity = currentData[6];
// //                 String _socialLink = currentData[7];
// //                 String _summary = currentData[8];
// //                 String _Skill = currentData[9];
// //                 String _SkillDescription = currentData[10];
// //                 String _degree = currentData[11];
// //                 String _schoolName = currentData[12];
// //                 String _educationCity = currentData[13];
// //                 String _educationStartDate = currentData[14];
// //                 String _graduationDate = currentData.length > 15 ? currentData[15] : '';
// //                 bool _isCurrentlyStudying = currentData.length > 16 ? currentData[16] == 'true' : false;
// //                 String _jobTitle = currentData.length > 17 ? currentData[17] : '';
// //                 String _employer = currentData.length > 18 ? currentData[18] : '';
// //                 String _experienceCity = currentData.length > 19 ? currentData[19] : '';
// //                 String _experienceStartDate = currentData.length > 20 ? currentData[20] : '';
// //                 String _endDate = currentData.length > 21 ? currentData[21] : '';
// //                 String _description = currentData.length > 22 ? currentData[22] : '';
// //                 String _Project = currentData.length > 23 ? currentData[23] : '';
// //                 String _ProjectDescription = currentData.length > 24 ? currentData[24] : '';
// //                 String _GitHubLink = currentData.length > 25 ? currentData[25] : '';

// //                 return Padding(
// //                   padding: const EdgeInsets.all(20.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       Text(
// //                         'Resume',
// //                         style: TextStyle(
// //                           fontSize: 30,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             '$_firstName $_lastName',
// //                             style: TextStyle(
// //                               fontSize: 32,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                           SizedBox(height: 10),
// //                           Text(
// //                             _designation,
// //                             style: TextStyle(
// //                               fontSize: 20,
// //                               color: Colors.grey[700],
// //                             ),
// //                           ),
// //                           SizedBox(height: 20),
// //                           Container(
// //                             width: double.infinity,
// //                             height: 2,
// //                             color: Colors.black,
// //                           ),
// //                           SizedBox(height: 20),
// //                         ],
// //                       ),
// //                       Expanded(
// //                         child: Row(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Expanded(
// //                               flex: 1,
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Text(
// //                                     'Contact Information',
// //                                     style: TextStyle(
// //                                       fontSize: 18,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(_mobileNumber),
// //                                   Text(_email),
// //                                   Text('$_address, $_contactCity'),
// //                                   Text('LinkedIn: ' + _socialLink),
// //                                   SizedBox(height: 20),
// //                                   Text(
// //                                     'Skills',
// //                                     style: TextStyle(
// //                                       fontSize: 18,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     _Skill.isNotEmpty ? _Skill : 'No skills data available',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   Text(
// //                                     _SkillDescription.isNotEmpty ? _SkillDescription : 'No description available',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                             Container(
// //                               width: 2,
// //                               height: double.infinity,
// //                               color: Colors.grey[400],
// //                               margin: EdgeInsets.symmetric(horizontal: 20),
// //                             ),
// //                             Expanded(
// //                               flex: 3,
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Text(
// //                                     'Summary',
// //                                     style: TextStyle(
// //                                       fontSize: 18,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     _summary,
// //                                     style: TextStyle(fontSize: 16),
// //                                   ),
// //                                   SizedBox(height: 20),
// //                                   Container(
// //                                     width: double.infinity,
// //                                     height: 2,
// //                                     color: Colors.black,
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     'Education',
// //                                     style: TextStyle(
// //                                       fontSize: 18,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     _degree.isNotEmpty && _schoolName.isNotEmpty
// //                                         ? '$_degree from $_schoolName'
// //                                         : 'No education data available',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 5),
// //                                   Text(
// //                                     '$_educationCity / $_educationStartDate - ${_isCurrentlyStudying ? "Present" : _graduationDate}',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                       color: Colors.grey[700],
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 20),
// //                                   Container(
// //                                     width: double.infinity,
// //                                     height: 2,
// //                                     color: Colors.black,
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     'Experience',
// //                                     style: TextStyle(
// //                                       fontSize: 18,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     _jobTitle.isNotEmpty && _employer.isNotEmpty
// //                                         ? '$_jobTitle at $_employer'
// //                                         : 'No experience data available',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 5),
// //                                   Text(
// //                                     '$_experienceCity / $_experienceStartDate - $_endDate',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                       color: Colors.grey[700],
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 5),
// //                                   Text(
// //                                     _description.isNotEmpty ? _description : 'No description available',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 20),
// //                                   Container(
// //                                     width: double.infinity,
// //                                     height: 2,
// //                                     color: Colors.black,
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     'Project',
// //                                     style: TextStyle(
// //                                       fontSize: 18,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     _Project.isNotEmpty ? _Project : 'No project data available',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   Text(
// //                                     _ProjectDescription.isNotEmpty ? _ProjectDescription : 'No description available',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text('GitHubLink: ' + _GitHubLink),
// //                                 ],
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //               },
// //             ),
// //     );
// //   }
// // }
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class ResumePage extends StatefulWidget {
// //   const ResumePage({super.key});

// //   @override
// //   State<ResumePage> createState() => _ResumePageState();
// // }

// // class _ResumePageState extends State<ResumePage> {
// //   List<String> _formData = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadFormData();
// //   }

// //   void _loadFormData() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     // Retrieve all submissions
// //     List<String> storedData = prefs.getStringList('formData') ?? [];

// //     setState(() {
// //       _formData = storedData;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: _formData.isEmpty
// //           ? const Center(child: Text('No data available'))
// //           : ListView.builder(
// //               itemCount: _formData.length,
// //               itemBuilder: (context, index) {
// //                 final currentData = _formData[index].split('||');

// //                 // Ensure that currentData has all required elements before using them
// //                 if (currentData.length < 15) {
// //                   return const Padding(
// //                     padding: EdgeInsets.all(20.0),
// //                     child: Text('Data is incomplete'),
// //                   );
// //                 }

// //                 String _Firstname = currentData[0];
// //                 String _Lastname = currentData[1];
// //                 String _Designation = currentData[2];
// //                 String _MobileNumber = currentData[3];
// //                 String _Email = currentData[4];
// //                 String _Address = currentData[5];
// //                 String _ContactCity = currentData[6];
// //                 String _SocialLink = currentData[7];
// //                 String _Summary = currentData[8];
// //                 String _Skill = currentData[9];
// //                 String _SkillDescription = currentData[10];
// //                 String _Degree = currentData[11];
// //                 String _SchoolName = currentData[12];
// //                 String _EducationCity = currentData[13];
// //                 String _EducationStartDate = currentData[14];
// //                 String _GraduationDate = currentData.length > 15 ? currentData[15] : '';
// //                 bool _isCurrentlyStudying = currentData.length > 16 ? currentData[16] == 'true' : false;
// //                 String _JobTitle = currentData.length > 17 ? currentData[17] : '';
// //                 String _Employer = currentData.length > 18 ? currentData[18] : '';
// //                 String _ExperienceCity = currentData.length > 19 ? currentData[19] : '';
// //                 String _ExperienceStartDate = currentData.length > 20 ? currentData[20] : '';
// //                 String _EndDate = currentData.length > 21 ? currentData[21] : '';
// //                 String _Description = currentData.length > 22 ? currentData[22] : '';
// //                 String _Project = currentData.length > 23 ? currentData[23] : '';
// //                 String _ProjectDescription = currentData.length > 24 ? currentData[24] : '';
// //                 String _GitHubLink = currentData.length > 25 ? currentData[25] : '';

// //                 return Padding(
// //                   padding: const EdgeInsets.all(20.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       Text(
// //                         'Resume',
// //                         style: TextStyle(
// //                           fontSize: 30,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             '$_Firstname $_Lastname',
// //                             style: TextStyle(
// //                               fontSize: 32,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                           SizedBox(height: 10),
// //                           Text(
// //                             _Designation,
// //                             style: TextStyle(
// //                               fontSize: 20,
// //                               color: Colors.grey[700],
// //                             ),
// //                           ),
// //                           SizedBox(height: 20),
// //                           Container(
// //                             width: double.infinity,
// //                             height: 2,
// //                             color: Colors.black,
// //                           ),
// //                           SizedBox(height: 20),
// //                         ],
// //                       ),
// //                       Expanded(
// //                         child: Row(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Expanded(
// //                               flex: 1,
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Text(
// //                                     'Contact Information',
// //                                     style: TextStyle(
// //                                       fontSize: 18,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(_MobileNumber),
// //                                   Text(_Email),
// //                                   Text('$_Address, $_ContactCity'),
// //                                   Text('LinkedIn: ' + _SocialLink),
// //                                   SizedBox(height: 20),
// //                                   Text(
// //                                     'Skills',
// //                                     style: TextStyle(
// //                                       fontSize: 18,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     _Skill.isNotEmpty ? _Skill : 'No skills data available',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   Text(
// //                                     _SkillDescription.isNotEmpty ? _SkillDescription : 'No description available',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                             Container(
// //                               width: 2,
// //                               height: double.infinity,
// //                               color: Colors.grey[400],
// //                               margin: EdgeInsets.symmetric(horizontal: 20),
// //                             ),
// //                             Expanded(
// //                               flex: 3,
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Text(
// //                                     'Summary',
// //                                     style: TextStyle(
// //                                       fontSize: 18,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     _Summary,
// //                                     style: TextStyle(fontSize: 16),
// //                                   ),
// //                                   SizedBox(height: 20),
// //                                   Container(
// //                                     width: double.infinity,
// //                                     height: 2,
// //                                     color: Colors.black,
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     'Education',
// //                                     style: TextStyle(
// //                                       fontSize: 18,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     _Degree.isNotEmpty && _SchoolName.isNotEmpty
// //                                         ? '$_Degree from $_SchoolName'
// //                                         : 'No education data available',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 5),
// //                                   Text(
// //                                     '$_EducationCity / $_EducationStartDate - ${_isCurrentlyStudying ? "Present" : _GraduationDate}',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                       color: Colors.grey[700],
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 20),
// //                                   Container(
// //                                     width: double.infinity,
// //                                     height: 2,
// //                                     color: Colors.black,
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     'Experience',
// //                                     style: TextStyle(
// //                                       fontSize: 18,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     _JobTitle.isNotEmpty && _Employer.isNotEmpty
// //                                         ? '$_JobTitle at $_Employer'
// //                                         : 'No experience data available',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 5),
// //                                   Text(
// //                                     '$_ExperienceCity / $_ExperienceStartDate - $_EndDate',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                       color: Colors.grey[700],
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 5),
// //                                   Text(
// //                                     _Description.isNotEmpty ? _Description : 'No description available',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 20),
// //                                   Container(
// //                                     width: double.infinity,
// //                                     height: 2,
// //                                     color: Colors.black,
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     'Project',
// //                                     style: TextStyle(
// //                                       fontSize: 18,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text(
// //                                     _Project.isNotEmpty ? _Project : 'No project data available',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   Text(
// //                                     _ProjectDescription.isNotEmpty ? _ProjectDescription : 'No description available',
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 10),
// //                                   Text('GitHubLink: ' + _GitHubLink),
// //                                 ],
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //               },
// //             ),
// //     );
// //   }
// // }
