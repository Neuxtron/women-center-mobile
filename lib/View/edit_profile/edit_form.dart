import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';

class FormWidgetProfile extends StatefulWidget {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  DateTime _tanggalController = DateTime.now(); // Use DateTime type for the date

  FormWidgetProfile({
    required TextEditingController usernameController,
    required TextEditingController firstnameController,
    required TextEditingController lastnameController,
    required DateTime tanggalController,
  })  : _usernameController = usernameController,
        _firstnameController = firstnameController,
        _lastnameController = lastnameController,
        _tanggalController = tanggalController;

  @override
  _FormWidgetProfileState createState() => _FormWidgetProfileState();
}

class _FormWidgetProfileState extends State<FormWidgetProfile> {
  final Dio dio = Dio();
  bool isLoading = false;

  Future<void> _fetchProfileData() async {
    try {
      setState(() {
        isLoading = true;
      });

      // Replace this with your actual API endpoint
      final response =
          await dio.get('https://api-ferminacare.tech/api/v1/users/profile');

      if (response.statusCode == 200) {
        // Parse the response data and set it to the respective controllers
        final Map<String, dynamic> data = response.data;

        widget._usernameController.text = data['username'];
        widget._firstnameController.text = data['firstname'];
        widget._lastnameController.text = data['lastname'];
        // Assuming the date format is 'yyyy-MM-dd' on the API
        widget._tanggalController = DateTime.parse(data['birthday']);
      } else {
        // Handle error
        print('Failed to fetch profile data');
      }
    } catch (e) {
      // Handle exception
      print('Exception: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    DateTime currentDate = widget._tanggalController;
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != currentDate) {
      return picked;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _fetchProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator() // You can replace this with a loading indicator
        : Column(
            children: [
              TextFormField(
                controller: widget._usernameController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: widget._firstnameController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: widget._lastnameController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: TextEditingController(
                    text: DateFormat('yyyy-MM-dd')
                        .format(widget._tanggalController)),
                readOnly: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      // Function to show date picker
                      DateTime? picked = await _selectDate(context);
                      if (picked != null) {
                        // Set the selected date to the text field
                        setState(() {
                          widget._tanggalController = picked;
                        });
                      }
                    },
                    child: Icon(Icons.date_range, color: Colors.pink),
                  ),
                ),
              ),
            ],
          );
  }
}
