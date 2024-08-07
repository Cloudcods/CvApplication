import 'package:application/day11/education.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MycvApp extends StatefulWidget {
  const MycvApp({super.key});

  @override
  State<MycvApp> createState() => _MycvAppState();
}

class _MycvAppState extends State<MycvApp> {  
  final _formKey = GlobalKey<FormState>();
  final _FirstnameController = TextEditingController();
  final _LastnameController = TextEditingController();
  final _DesignationController = TextEditingController();
  final _Addresscontroller=TextEditingController();
  final _Citycontroller= TextEditingController();
  final _Emailcontroller=TextEditingController();
  final _MobileNumbercontroller=TextEditingController();
  final _SummaryController=TextEditingController();
  final _SocialLinkController=TextEditingController();

 @override
  void initState() {
    super.initState();
    _loadFormData();
  }

// for  saving the data...
   Future<void> _saveFormData() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Firstname',_FirstnameController.text);
    await prefs.setString('Lastname', _LastnameController.text);
    await prefs.setString('Designation', _DesignationController.text);
    await prefs.setString('Address', _Addresscontroller.text);
    await prefs.setString('City', _Citycontroller.text);
    await prefs.setString('Email', _Emailcontroller.text);
    await prefs.setString('MobileNumber', _MobileNumbercontroller.text);
    await prefs.setString('Summary', _SummaryController.text); // Store as String
    await prefs.setString('SocialLink', _SocialLinkController.text); // Store as String
  }

Future<void> _loadFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _FirstnameController.text = prefs.getString('Firstname') ?? '';
      _LastnameController.text = prefs.getString('Lastname') ?? '';
      _DesignationController.text = prefs.getString('Designation') ?? '';
      _Addresscontroller.text = prefs.getString('Address') ?? '';
      _Citycontroller.text = prefs.getString('City') ?? '';
      _Emailcontroller.text = prefs.getString('Email') ?? '';
      _MobileNumbercontroller.text = prefs.getString('MobileNumber') ?? '';
      _SummaryController.text = prefs.getString('Summary') ?? '';
      _SocialLinkController.text = prefs.getString('SocialLink') ?? '';
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cv Application"),
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
                // Bold text for "Personal Details"
                Text(
                  'Personal Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Fill out your primary information.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                
                 // Add some space between the label and the form fields

                // Row to contain First Name and Last Name fields
                Row(
                  children: [
                    // First Name field
                    Expanded(
                      child: TextFormField(
                        controller: _FirstnameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person), // Place the icon inside the field
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
                    SizedBox(width: 10), // Add space between the fields

                    // Last Name field
                    Expanded(
                      child: TextFormField(
                        controller: _LastnameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person), // Place the icon inside the field
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
                SizedBox(height: 10), // Add some space below the row

                // for designation
                TextFormField(
                  controller: _DesignationController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.work), // Place the icon inside the field
                    border: OutlineInputBorder(),
                    labelText: 'Designation',
                    hintText: 'Your Designation',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' enter your Designation';
                    }
                    return null;
                  }
                ),
                SizedBox(height: 10),
                 Row(
                  children: [
                    // address
                    Expanded(
                      child: TextFormField(
                        controller:_Addresscontroller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.place), // Place the icon inside the field
                          border: OutlineInputBorder(),
                          labelText: 'Address',
                          hintText: 'your address',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ' enter your address';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10), // Add space between the fields

                    // for city 
                    Expanded(
                      child: TextFormField(
                        controller: _Citycontroller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_city), // Place the icon inside the field
                          border: OutlineInputBorder(),
                          labelText: 'City',
                          hintText: 'Your city', 
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ' enter your city';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                // for email
                 SizedBox(height: 10),
                 Row(
                  children: [
                    // address
                    Expanded(
                      child: TextFormField(
                        controller:_Emailcontroller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_sharp), // Place the icon inside the field
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'your Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ' enter your Email';
                          }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10), // Add space between the fields

                    // for mobile number
                    Expanded(
                      child: TextFormField(
                        controller: _MobileNumbercontroller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone), // Place the icon inside the field
                          border: OutlineInputBorder(),
                          labelText: 'MobileNumber',
                          hintText: 'Your Number', 
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ' enter your MobileNumber';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10), // Add some space before the summary field

                // Summary field
                TextFormField(
                  controller: _SummaryController,
                  maxLines: 3, // Allows for a larger input area
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.description), // Place the icon inside the field
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
             SizedBox(height: 20), // Add some space before the social media link field

                // Social Media Link field
                TextFormField(
                  controller: _SocialLinkController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.link), // Place the icon inside the field
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

                 SizedBox(height: 20), // Add space before the button

                // Continue to Education button
               ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                        _saveFormData().then((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EducationPage()),
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
                      Text('Continue to Education',
                    style: TextStyle(color: Colors.black),
                      
                      
                      ),
                      
                      SizedBox(width: 10), // Space between text and icon
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



