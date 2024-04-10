import 'package:flutter/material.dart';
import 'medicine.dart';
import 'comfort.dart';
import 'entertainment.dart';
import 'nutritional.dart';
import 'patient_care.dart';
import 'support.dart';
import 'technological.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Support cancer patients!"),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 166, 197, 232),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset(
                  'assets/support.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _buildDonationCategory(
                      category: 'Medicine',
                      description:
                          'Donate chemotherapy drugs and medical supplies.',
                      onPressed: () {
                        _onMedicinePressed(context);
                      },
                    ),
                    _buildDonationCategory(
                      category: 'Comfort Items',
                      description:
                          'Donate blankets, pillows, and personal care items.',
                      onPressed: () {
                        _onComfortPressed(context);
                      },
                    ),
                    _buildDonationCategory(
                      category: 'Entertainment Items',
                      description: 'Donate books, DVDs, and electronic games.',
                      onPressed: () {
                        _onEntertainmentPressed(context);
                      },
                    ),
                    _buildDonationCategory(
                      category: 'Nutritional Items',
                      description:
                          'Donate nutritional supplements and healthy snacks.',
                      onPressed: () {
                        _onNutritionalPressed(context);
                      },
                    ),
                    _buildDonationCategory(
                      category: 'Patient Care Services and money donation',
                      description:
                          'Donate transportation vouchers, meal vouchers and money.',
                      onPressed: () {
                        _onPatientCarePressed(context);
                      },
                    ),
                    _buildDonationCategory(
                      category: 'Support Programs & Resources',
                      description:
                          'Donate counseling resources and educational materials.',
                      onPressed: () {
                        _onSupportPressed(context);
                      },
                    ),
                    _buildDonationCategory(
                      category: 'Technological Equipment',
                      description:
                          'Donate tablet devices and telemedicine equipment.',
                      onPressed: () {
                        _onTechnologicalPressed(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onMedicinePressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MedicinePage()),
    );
  }

  void _onComfortPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ComfortPage()),
    );
  }

  void _onEntertainmentPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EntertainmentPage()),
    );
  }

  void _onNutritionalPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NutritionalPage()),
    );
  }

  void _onPatientCarePressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PatientCarePage()),
    );
  }

  void _onSupportPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SupportPage()),
    );
  }

  void _onTechnologicalPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TechnologicalPage()),
    );
  }

  Widget _buildDonationCategory({
    required String category,
    required String description,
    VoidCallback? onPressed,
  }) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        color: const Color.fromARGB(255, 166, 197, 232),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                category,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 215, 155, 225),
                  shape: const RoundedRectangleBorder(),
                  padding: const EdgeInsets.all(16.0),
                ),
                child: const Text(
                  'Donate Now',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
