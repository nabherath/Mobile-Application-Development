import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/otherpages/thankyou.dart';

class TechnologicalPage extends StatelessWidget {
  const TechnologicalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Technical Equipment Donation'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 166, 197, 232),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12.0),
                // Choose your desired color
                child: const Text(
                  'Donate Technical Equipment',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/technological.jpeg',
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12.0),
                color: const Color.fromARGB(255, 166, 197, 232),
                child: const Text(
                  'Your donation of technical equipment such as tablet devices and telemedicine equipment can greatly enhance the healthcare experience for cancer patients. These resources enable remote consultations, access to medical information, and communication with healthcare providers.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 20),
              DonationForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class DonationForm extends StatefulWidget {
  const DonationForm({Key? key}) : super(key: key);

  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _itemControllr = TextEditingController();

  String _name = '';
  String _email = '';
  String _phoneNumber = '';
  String _equipmentType = '';
  String _donationAmount = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            onSaved: (value) {
              _name = value!;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            onSaved: (value) {
              _email = value!;
            },
          ),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: 'Phone Number'),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
            onSaved: (value) {
              _phoneNumber = value!;
            },
          ),
          TextFormField(
            controller: _itemControllr,
            decoration: const InputDecoration(labelText: 'Equipment Type'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the equipment type';
              }
              return null;
            },
            onSaved: (value) {
              _equipmentType = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Donation Amount'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter donation amount';
              }
              return null;
            },
            onSaved: (value) {
              _donationAmount = value!;
            },
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              addTec(
                _nameController.text.trim(),
                _emailController.text.trim(),
                _phoneController.text.trim(),
                _itemControllr.text.trim(),
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (e) => ThankYouPage(),
                ),
              );

              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Perform donation action with collected data
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 166, 197, 232),
              shape: RoundedRectangleBorder(),
              padding: const EdgeInsets.all(16.0),
            ),
            child: const Text(
              'Donate',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

Future addTec(String name, dynamic email, dynamic phone, dynamic tec) async {
  await FirebaseFirestore.instance.collection('technology').add({
    'name': name,
    'email': email,
    'phone': phone,
    'itemType': tec,
  });
}
