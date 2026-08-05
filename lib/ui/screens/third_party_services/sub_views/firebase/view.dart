import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';
import 'package:flutter_developers_guide/ui/navigation/routes.dart';
import 'package:go_router/go_router.dart';

import '../../../../components/section_wrapper.dart';

class FirebaseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Firebase integration',
      markdownPath: 'assets/markdowns/third_party_services/firebase.md',
      preview: _IntegrationTestingImplementation(),
    );
  }
}

class _IntegrationTestingImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Basics',
          content: [
            SizedBox(
              width: double.infinity,
              child: const Text(
                'Firebase is a Backend-as-a-Service (BaaS) platform from Google Firebase that provides ready-made backend services so you can focus on building the app instead of managing servers.',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: const Text(
                'Most Common Firebase Services\n- Firebase Authentication\n- Firebase Firestore\n- Firebase Storage\n- Firebase Analytics\n- and a lot more...',
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Firebase Auth',
          content: [
            SizedBox(
              width: double.infinity,
              child: const Text(
                'Firebase Authentication is Firebase\'s identity management service. It handles user registration, login, logout, password resets, email verification, and authentication through providers such as email/password, Google, Apple, Facebook, GitHub, phone number OTP, and anonymous accounts.',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: const Text(
                'Instead of building your own authentication backend, password storage, hashing system, and session management, Firebase Auth provides these capabilities out of the box and returns a user object that uniquely identifies the signed-in user.',
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => {
                  context.push(RoutePaths.firebaseAuth),
                },
                child: const Text('Firebase Auth demo'),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Firebase Firestore',
          content: [
            SizedBox(
              width: double.infinity,
              child: const Text(
                'Cloud Firestore is Firebase\'s cloud-hosted NoSQL document database designed for storing and synchronizing application data in real time. Data is organized into collections and documents rather than traditional tables and rows.',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: const Text(
                'Firestore automatically synchronizes changes across devices, supports offline persistence, scales automatically, and provides powerful querying capabilities.',
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => {
                  context.push(RoutePaths.firebaseFirestore),
                },
                child: const Text('Firebase Firestore demo'),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Firebase Storage',
          content: [
            SizedBox(
              width: double.infinity,
              child: const Text(
                'Firebase Storage is Firebase\'s file storage service that is optimized for storing and serving large binary files such as images, videos, audio recordings, PDFs, and documents. While Firestore is designed for structured data, Storage is designed for actual files.',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: const Text(
                'A common pattern is to upload a file to Firebase Storage, obtain its download URL, and then store that URL in Firestore',
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => {
                  context.push(RoutePaths.firebaseStorage),
                },
                child: const Text('Firebase Storage demo'),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Firebase Analytics',
          content: [
            SizedBox(
              width: double.infinity,
              child: const Text(
                'Firebase Analytics is Firebase\'s user behavior tracking and analytics platform. It automatically collects information about app usage and allows developers to log custom events that describe user actions.',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: const Text(
                'Analytics helps answer questions such as how many users are actively using the app, which screens are most frequently visited, how long users stay in the application, which features are popular, where users abandon workflows, and how successful a new feature or release has been.',
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => {
                  context.push(RoutePaths.firebaseStorage),
                },
                child: const Text('Firebase Analytics'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
