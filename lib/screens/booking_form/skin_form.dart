import 'package:flutter/material.dart';
import 'package:petcarepal/screens/booking_form/components/button.dart';
import 'package:petcarepal/screens/booking_form/components/custom_appbar.dart';
import 'package:petcarepal/screens/booking_form/components/custom_textfield.dart';

class SkinForm extends StatefulWidget {
  @override
  State<SkinForm> createState() => _SkinFormState();
}

class _SkinFormState extends State<SkinForm> {
  TextEditingController locationController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController petController = TextEditingController();
  TextEditingController breedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 247, 251, 1),
      appBar: CustomAppBar(title: 'Da liễu'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                controller: locationController,
                onChanged: (value) {
                  // Xử lý giá trị từ UserInput
                  print('New value: $value');
                },
                label: 'Địa điểm',
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                onChanged: (value) {
                  // Xử lý giá trị từ UserInput
                  print('New value: $value');
                },
                label: 'Công việc',
                controller: jobController,
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                onChanged: (value) {
                  // Xử lý giá trị từ UserInput
                  print('New value: $value');
                },
                label: 'Thú cưng',
                controller: petController,
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                onChanged: (value) {
                  // Xử lý giá trị từ UserInput
                  print('New value: $value');
                },
                label: 'Giống loài',
                controller: breedController,
              ),
              SizedBox(height: 20.0),
              CustomButton(),
            ],
          ),
        ),
      ),
    );
  }
}
