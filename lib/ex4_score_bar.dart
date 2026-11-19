import 'package:flutter/material.dart';

// EX 4 – Score bar (BONUS, free style: handout page EX 4)
// The design, the widgets and the data are up to you.
class ScoreCard extends StatefulWidget {
  final String title;
  final int initialScore;

  const ScoreCard({
    super.key,
    required this.title,
    this.initialScore = 1,
  });

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late int score;

  @override
  void initState() {
    super.initState();
    score = widget.initialScore;
  }

  void incrementScore() {
    if (score < 10) {
      setState(() {
        score++;
      });
    }
  }

  void decrementScore() {
    if (score > 0) {
      setState(() {
        score--;
      });
    }
  }

  Color get progressColor {
    if (score <= 3) {
      return Colors.green[300]!;
    } else if (score <= 7) {
      return Colors.green[500]!;
    } else {
      return Colors.green[900]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: decrementScore,
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: incrementScore,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 55,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: score / 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: progressColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ScoreCard(title: "My score in Flutter", initialScore: 5),
                SizedBox(height: 20),
                ScoreCard(title: "My score in Dart", initialScore: 3),
                SizedBox(height: 20),
                ScoreCard(title: "My score in React", initialScore: 10),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
