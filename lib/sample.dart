import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Widgets/customButton.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firestore Collection/Subcollection Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onPressed: () async {
                  try {
                    final FirebaseAuth _auth = FirebaseAuth.instance;
                    UserCredential userCredential =
                        await _auth.createUserWithEmailAndPassword(
                      email: "controller@gmail.com",
                      password: "controller@3",
                    );

                    // Extract UID from the userCredential.user object
                    String userId = userCredential.user!.uid;

                    // Gather admin user fields
                    String adminEmail = 'controller.adnEmail.text';
                    // Add other admin fields as needed

                    // Gather fields for subcollection documents
                    String firstName = 'controller.fiName.text';
                    String lastName = 'controller.laName.text';
                    String email = 'controller.ail.text';
                    String password = 'controller.pasord.text';
                    String contactNumber = 'controller.contaNumber.text';
                    String address = 'controller.adess.text';
                    String accountType = 'controller.selectedAccoutype.text';

                    // Call functions to create documents in collection and subcollection
                    await createCollectionAndSubcollection(
                        userId,
                        adminEmail,
                        firstName,
                        lastName,
                        email,
                        password,
                        contactNumber,
                        address,
                        accountType);
                  } catch (e) {
                    print("Error creating user: $e");
                  }
                },
                text: 'Confirm Booking',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String? subcollectionResult = await createSubcollection();
                  print(subcollectionResult);
                },
                child: Text('Create Subcollection'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> createCollectionAndSubcollection(
  String userId,
  String adminEmail,
  String firstName,
  String lastName,
  String email,
  String password,
  String contactNumber,
  String address,
  String accountType,
) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the user's document
    DocumentReference userDocRef =
        firestore.collection('enterprisedummy').doc(userId);

    // Reference to the subcollection 'enterpriseUsers' under the user's document
    CollectionReference enterpriseUsersCollectionRef =
        userDocRef.collection('enterpriseUsers');

    // Data for top-level document
    Map<String, dynamic> adminUserData = {
      'adminEmail': adminEmail,
      // Add other admin fields as needed
    };

    // Data for subcollection document
    Map<String, dynamic> subcollectionUserData = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'contactNumber': contactNumber,
      'address': address,
      'accountType': accountType,
      'createdTime': Timestamp.now(),
    };

    // Add top-level document
    await userDocRef.set(adminUserData);

    // Add document to subcollection
    await enterpriseUsersCollectionRef.add(subcollectionUserData);

    print('Collection and subcollection documents created successfully!');
  } catch (error) {
    print('Error creating documents: $error');
  }
}

Future<String?> createSubcollection() async {
  try {
    String userId = "user123"; // Replace with actual user UID
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the user's document
    DocumentReference userDocRef = firestore.collection('userssss').doc(userId);

    // Reference to the subcollection 'posts' under the user's document
    CollectionReference postsCollectionRef = userDocRef.collection('posts');

    // Data to be saved in the subcollection
    Map<String, dynamic> postData = {
      'title': 'Sample Post Title',
      'content': 'This is a sample post content.',
      'timestamp': Timestamp.now(),
    };

    // Add data to the subcollection
    await postsCollectionRef.add(postData);

    return 'Subcollection created successfully!';
  } catch (error) {
    print('Error creating subcollection: $error');
    return null;
  }
}
