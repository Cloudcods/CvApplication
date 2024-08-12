import 'package:application/Day15/cv%20page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final _ControllerFirstname = TextEditingController();
  final _ControllerLastname = TextEditingController();
  final _ControllerDesignation = TextEditingController();
  final _ControllerSummary = TextEditingController();

  List<List<String>> _formDataList = [];

  @override
  void initState() {
    super.initState();
    _loadFormData();
  }

  Future<void> _loadFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> existingData = prefs.getStringList('formData') ?? [];
    setState(() {
      _formDataList = existingData
          .map((entry) => entry.split('||'))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyCV List"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 64, 132, 241),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildCardList(),
      ),
    );
  }

  Widget _buildCardList() {
    if (_formDataList.isEmpty) {
      return Center(child: Text('No data available.'));
    } else {
      return ListView.builder(
        itemCount: _formDataList.length,
        itemBuilder: (context, index) {
          final data = _formDataList[index];
          return _buildCard(data[0], data[1], data[2], data[3]);
        },
      );
    }
  }

  Widget _buildCard(String firstName, String lastName, String designation, String summary) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$firstName $lastName',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              designation,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              summary,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to ResumePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MultiPage(),
                    ),
                  );
                },
                child: Text("See More"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
