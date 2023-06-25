import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class EmergencyNumbersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> emergencyNumbers = [
    {'name': 'الشرطة', 'number': '122'},
    {'name': 'الإسعاف', 'number': '123'},
    {'name': 'الدفاع المدني', 'number': '180'},
    {'name': 'الشرطة السياحية', 'number': '126'},
    {'name': 'الشرطة المرورية', 'number': '128'},
    {'name': 'طوارئ الكهرباء', 'number': '121'},
    {'name': 'طوارئ الغاز', 'number': '129'},
    {'name': 'طوارئ المياه', 'number': '125'},
  ];

   EmergencyNumbersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("أرقام الطوارئ"),
      ),
      body: FadeIn(
        child: ListView.builder(itemBuilder: (context,index){

          return EmergencyNumberCard(emergencyNumber: emergencyNumbers[index]);

        },
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          itemCount: emergencyNumbers.length,

        ),
      ),
    );
  }
}


class EmergencyNumberCard extends StatelessWidget {
  const EmergencyNumberCard({Key? key, required this.emergencyNumber})
      : super(key: key);

  final Map<String, dynamic> emergencyNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String phoneNumber = 'tel:${emergencyNumber['number']}';
        launchUrl(Uri.parse(phoneNumber));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                emergencyNumber['name'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                emergencyNumber['number'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

