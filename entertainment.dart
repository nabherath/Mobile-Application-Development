import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/otherpages/thankyou.dart';

void main() {
  runApp(const MaterialApp(
    home: EntertainmentPage(),
  ));
}

class EntertainmentPage extends StatelessWidget {
  const EntertainmentPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entertainment Items Donation'),
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
                'Donate Entertainment Items',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/entertainment.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12.0),
                color: const Color.fromARGB(255, 166, 197, 232),
                child: Text(
                  'Your donation of entertainment items such as books, DVDs, and electronic games can provide much-needed distraction and enjoyment for cancer patients during their treatment. Your generosity helps improve their overall well-being and quality of life.',
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
  final _entertainControllr = TextEditingController();

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
            controller: _entertainControllr,
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
              addEntertain(
                _nameController.text.trim(),
                _emailController.text.trim(),
                _phoneController.text.trim(),
                _entertainControllr.text.trim(),
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
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

Future addEntertain(
    String name, dynamic email, dynamic phone, dynamic item) async {
  await FirebaseFirestore.instance.collection('entertain').add({
    'name': name,
    'email': email,
    'phone': phone,
    'itemType': item,
  });
}
