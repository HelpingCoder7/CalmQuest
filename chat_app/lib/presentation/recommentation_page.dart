import 'package:flutter/material.dart';

class Recommendation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Depression Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minimal Depression Management'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DepressionCard(
              title: 'Diet',
              description:
                  'Focus on a balanced diet rich in fruits, vegetables, whole grains, lean proteins, and healthy fats. Incorporate foods high in omega-3 fatty acids, such as salmon, walnuts, and flaxseeds, which may help improve mood.',
              icon: Icons.restaurant,
            ),
            SizedBox(height: 20),
            DepressionCard(
              title: 'Exercise',
              description:
                  'Engage in regular physical activity, such as brisk walking, jogging, cycling, or yoga, for at least 30 minutes most days of the week. Exercise releases endorphins, which can help alleviate symptoms of depression.',
              icon: Icons.directions_run,
            ),
            SizedBox(height: 20),
            DepressionCard(
              title: 'Sleep Schedule',
              description:
                  'Maintain a consistent sleep schedule by going to bed and waking up at the same time each day. Practice relaxation techniques, such as deep breathing or meditation, before bedtime to promote restful sleep.',
              icon: Icons.bedtime,
            ),
          ],
        ),
      ),
    );
  }
}

class DepressionCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const DepressionCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
    );
  }
}
