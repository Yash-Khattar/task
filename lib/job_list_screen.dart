import 'package:flutter/material.dart';
import 'package:goodspace/job_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JobListScreen extends StatefulWidget {
  const JobListScreen({super.key});

  @override
  JobListScreenState createState() => JobListScreenState();
}

class JobListScreenState extends State<JobListScreen> {
  final List<Map<String, dynamic>> _allJobs = [
    {
      'title': 'Software Engineer',
      'experience': '1-3 yr',
      'location': 'Remote',
      'skills': ['Java', 'Javascript', '+12'],
    },
    {
      'title': 'Back End Developer',
      'experience': '5-10 yr',
      'location': 'Onsite',
      'skills': ['Javascript', 'Mongodb', '+6'],
    },
    {
      'title': 'Software Engineer - Golang',
      'experience': '3-5 yr',
      'location': 'Onsite',
      'skills': ['Golang', 'full cycle software development'],
    },
    {
      'title': 'Software Engineer - Golang',
      'experience': '3-5 yr',
      'location': 'Onsite',
      'skills': ['Golang', 'full cycle software development'],
    },
    {
      'title': 'Software Engineer - Golang',
      'experience': '3-5 yr',
      'location': 'Onsite',
      'skills': ['Golang', 'full cycle software development'],
    },
    {
      'title': 'Software Engineer - Golang',
      'experience': '3-5 yr',
      'location': 'Onsite',
      'skills': ['Golang', 'full cycle software development'],
    },
    {
      'title': 'Software Engineer - Golang',
      'experience': '3-5 yr',
      'location': 'Onsite',
      'skills': ['Golang', 'full cycle software development'],
    },
  ];

  List<Map<String, dynamic>> _foundJobs = [];

  @override
  initState() {
    _foundJobs = _allJobs;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allJobs;
    } else {
      results = _allJobs
          .where((job) =>
              job["title"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundJobs = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue[400],
                child: const Icon(Icons.person, color: Colors.white),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                  child: FaIcon(FontAwesomeIcons.bars,
                      size: 8, color: Colors.blue[400]),
                ),
              ),
            ],
          ),
        ),
        title: RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.black,
            ),
            children: const [
              TextSpan(
                text: "Welcome\n",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              TextSpan(
                text: "Yash Khattar",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, size: 18),
            color: Colors.black,
            onPressed: () {},
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.bell,
                color: Colors.black, size: 18),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue.withOpacity(0.2)),
              ),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.3), fontSize: 14),
                  hintText: "Search job, skills",
                  prefixIcon: const Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _foundJobs.length,
                itemBuilder: (context, index) => JobCard(
                  title: _foundJobs[index]['title'],
                  experience: _foundJobs[index]['experience'],
                  location: _foundJobs[index]['location'],
                  skills: List<String>.from(_foundJobs[index]['skills']),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blue),
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/user.png'),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: 'Work',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Applied',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Social',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline),
            label: 'Premium',
          ),
        ],
      ),
    );
  }
}
