import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/otherpages/thankyou.dart';

void main() {
  runApp(const MaterialApp(
    home: ComfortPage(),
  ));
}

class ComfortPage extends StatelessWidget {
  const ComfortPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comfort Items Donation'),
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),
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
              Text(
                'Donate Comfort Items',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/comfort.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12.0),
                color: const Color.fromARGB(255, 166, 197, 232),
                child: Text(
                  'Your donation of comfort items such as blankets, pillows, and personal care items can greatly improve the quality of life for cancer patients. Your generosity provides warmth, comfort, and a sense of well-being during difficult times.',
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
  final _comfortControllr = TextEditingController();

  String _name = '';
  String _email = '';
  String _phoneNumber = '';
  String _itemDescription = '';
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
            controller: _comfortControllr,
            decoration: const InputDecoration(labelText: 'Item Description'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the item description';
              }
              return null;
            },
            onSaved: (value) {
              _itemDescription = value!;
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
              addComfort(
                _nameController.text.trim(),
                _emailController.text.trim(),
                _phoneController.text.trim(),
                _comfortControllr.text.trim(),
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (e) => ThankYouPage(),
                ),
              );

              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 166, 197, 232),
              shape: RoundedRectangleBorder(),
              padding: const EdgeInsets.all(16.0),
            ),
            child: const Text(
              'Donate',
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

Future addComfort(
    String name, dynamic email, dynamic phone, dynamic comfort) async {
  await FirebaseFirestore.instance.collection('comfortItem').add({
    'name': name,
    'email': email,
    'phone': phone,
    'itemType': comfort,
  });
}
