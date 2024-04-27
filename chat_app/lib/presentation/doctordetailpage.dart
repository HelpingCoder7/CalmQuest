import 'package:flutter/material.dart';

class DoctorDetailPage extends StatelessWidget {
  final String doctorImageUrl;
  final String doctorName;
  final String doctorAddress;
  final String availabilityTiming;

  const DoctorDetailPage({
    super.key,
    required this.doctorImageUrl,
    required this.doctorName,
    required this.doctorAddress,
    required this.availabilityTiming,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctorName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Doctor image
            CircleAvatar(
              radius: 80.0,
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2024/03/29/03/30/ai-generated-8662131_960_720.png'),
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(height: 16.0),

            // Doctor name and address
            Row(
              children: [
                Expanded(
                  child: Text(
                    doctorName,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16.0),
                const SizedBox(width: 4.0),
                Text(doctorAddress),
              ],
            ),
            const SizedBox(height: 16.0),

            // Availability timing
            Row(
              children: [
                const Text(
                  'Availability:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(availabilityTiming),
              ],
            ),
            const Spacer(),

            // Book appointment button
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Handle book appointment action
                  // You can navigate to another screen or perform any action here
                  print('Book appointment clicked!');
                },
                child: const Text('Book Appointment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
