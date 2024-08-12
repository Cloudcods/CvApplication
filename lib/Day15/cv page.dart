import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MultiPage extends StatefulWidget {
  const MultiPage({super.key});

  @override
  State<MultiPage> createState() => _MultiPageState();
}

class _MultiPageState extends State<MultiPage> {
  List<String> _formData = [];

  @override
  void initState() {
    super.initState();
    _loadFormData();
  }

  void _loadFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> storedData = prefs.getStringList('formData') ?? [];
    setState(() {
      _formData = storedData;
    });
  }

  String _fixBase64Padding(String base64) {
    int mod = base64.length % 4;
    if (mod > 0) {
      base64 += '=' * (4 - mod);
    }
    return base64;
  }

  String _sanitizeBase64(String base64) {
    return base64.replaceAll(RegExp(r'[^A-Za-z0-9+/=]'), '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume'),
        centerTitle: true,
      ),
       body: _formData.isEmpty
          ? const Center(child: Text('No data available'))
          : ListView.builder(
              itemCount: _formData.length,
              itemBuilder: (context, index) {
                final currentData = _formData[index].split('||');

                // Check if we have enough data to access the image
                bool hasImageData = currentData.length > 26 && currentData[26].isNotEmpty;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${currentData[0]} ${currentData[1]}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                            const SizedBox(height: 10),

          // Row to display the image and additional content
          Row(
            children: [
              ClipOval(
                child: hasImageData
                    ? (() {
                        try {
                          String sanitizedBase64 = _sanitizeBase64(currentData[26]);
                          String fixedBase64 = _fixBase64Padding(sanitizedBase64);
                          Uint8List decodedBytes = base64Decode(fixedBase64);
                          return Image.memory(
                            decodedBytes,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          );
                        } catch (e) {
                          print("Error decoding base64 image: $e");
                          return Image.asset(
                            'assets/images/magic.jpg', // Placeholder image
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          );
                        }
                      }())
                    : Image.asset(
                        'assets/images/magic.jpg', // Placeholder image
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
              ),
            ],
          ),

                          const SizedBox(height: 10),
                          Text(
                            '${currentData[2]}', // Designation
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[700],
                            ),
                          ),
                         
                          const SizedBox(height: 20), // Space after the row
                          // Divider
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 20), // Space after the divider
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Contact Information on the left
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Contact Information',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text('${currentData[3]}'), 
                                    Text('${currentData[4]}'), 
                                    Text('${currentData[5]}'), 
                                    Text('${currentData[6]}'), 
                                    SizedBox(height: 10),
                                    Text('LinkedIn: ${currentData[8]}'),
              
                              // Skills Section
                              SizedBox(height: 10),
                              Text(
                                'Skills',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                currentData[24].isNotEmpty
                                    ? '${currentData[24]}' // Skill
                                    : 'No skills data available',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                currentData[25].isNotEmpty
                                    ? '${currentData[25]}' // Skill Description
                                    : 'No description available',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20), // Space between columns
                        // Summary on the right
                        Expanded(
                          flex: 1,
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
                                currentData[7].isNotEmpty
                                    ? '${currentData[7]}' // Summary
                                    : 'No summary available',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 20), // Space before the education section
                              // Education Section
                              Text(
                                'Education',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                currentData[10].isNotEmpty && currentData[9].isNotEmpty
                                    ? '${currentData[10]} from ${currentData[9]}' // Degree and SchoolName
                                    : 'No education data available',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${currentData[11]} / ${currentData[12]} - ${currentData[13] == "true" ? "Present" : currentData[13]}', // EducationCity / StartDate - GraduationDate
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(height: 20), // Space before experience section
                              // Experience Section
                              Text(
                                'Experience',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                currentData[15].isNotEmpty && currentData[16].isNotEmpty
                                    ? '${currentData[15]} at ${currentData[16]}' // JobTitle and Employer
                                    : 'No experience data available',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${currentData[17]} / ${currentData[18]} - ${currentData[19]}', // ExperienceCity / ExperienceStartDate - EndDate
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                currentData[20].isNotEmpty 
                                    ? '${currentData[20]}' // Description
                                    : 'No description available',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 20),
                              // Project Section
                              Text(
                                'Project',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                currentData[21].isNotEmpty
                                    ? '${currentData[21]}' // Project
                                    : 'No project data available',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                currentData[22].isNotEmpty ? currentData[22] : 'No description available', // ProjectDescription
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text('GitHubLink: ${currentData[23]}'), // GitHubLink
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

