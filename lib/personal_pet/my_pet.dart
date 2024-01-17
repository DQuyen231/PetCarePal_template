import 'package:flutter/material.dart';
import 'package:petcarepal/personal_pet/components/add_pet.dart';
import 'package:petcarepal/personal_pet/components/header.dart';
import 'package:petcarepal/personal_pet/components/pet_container.dart';



class MyPet extends StatelessWidget {
  const MyPet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(248,247,251,255),
      body: Column(
        children: [
          Header(),
          PetContainer(),
          AddPet()
        ],
      ),

    );
       
  }
}