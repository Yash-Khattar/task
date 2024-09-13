import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String experience;
  final String location;
  final List<String> skills;

  const JobCard({
    super.key,
    required this.title,
    required this.experience,
    required this.location,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Icon(Icons.calendar_today_outlined, size: 14),
                const SizedBox(width: 4),
                Text(experience,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.8)))),
                const SizedBox(width: 8),
                Icon(Icons.circle,
                    size: 10, color: Colors.black.withOpacity(0.2)),
                const SizedBox(width: 8),
                const Icon(Icons.location_on_outlined, size: 14),
                const SizedBox(width: 4),
                Text(location,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.8)))),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: skills
                  .map((skill) => Chip(
                        backgroundColor: Colors.grey.shade100,
                        labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        label: Text(skill),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.transparent),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 8),
            Divider(
              height: 0.5,
              color: Colors.black.withOpacity(0.1),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'View Job',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: FaIcon(
                    FontAwesomeIcons.bookmark,
                    size: 18,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
