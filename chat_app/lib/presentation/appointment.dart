import 'package:chat_app/presentation/doctordetailpage.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String imageUrl;
  final String doctorName;
  final String availability;
  final String address;
  const DoctorCard({
    super.key,
    required this.imageUrl,
    required this.doctorName,
    required this.availability,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => DoctorDetailPage(
                  doctorImageUrl: '',
                  doctorName: doctorName,
                  doctorAddress: address,
                  availabilityTiming: availability,
                )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    availability,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorList extends StatelessWidget {
  final List<DoctorCard> doctors;

  const DoctorList({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Consultents")),
        ),
        body: ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              return doctors[index];
            }));
  }
}
