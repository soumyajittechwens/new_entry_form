import 'package:country_picker/country_picker.dart';
import 'package:entry_form/view_entry.dart';
import 'package:flutter/material.dart';

class EntryFormTechwens extends StatefulWidget {
  const EntryFormTechwens({super.key});

  @override
  State<EntryFormTechwens> createState() => _EntryFormTechwensState();
}

class _EntryFormTechwensState extends State<EntryFormTechwens> {
  TextEditingController contactPersonNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list_alt),
            onPressed: () {
              // Handle the press
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FormListPage()));
            },
          ),

        ],
        title: const Text("Entry Form"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 10.0),
              child: Center(
                child: Text(
                  "Your Personal Details",
                  style: TextStyle(
                      color: Colors.blue.withOpacity(0.7), fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF000000).withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: contactPersonNameController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color:
                                const Color(0xFF000000).withOpacity(0.8)),
                            decoration: InputDecoration(
                              hintText: '',
                              prefixIcon: Icon(Icons.person, size: 20),
                              // Reduce icon size
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0), // Reduce vertical padding
                            ),
                          ),
                        ),

                        // SVG image or other elements can go here
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF000000).withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color:
                                const Color(0xFF000000).withOpacity(0.8)),
                            decoration: InputDecoration(
                              hintText: '',
                              prefixIcon: Icon(Icons.email, size: 20),
                              // Reduce icon size
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0), // Reduce vertical padding
                            ),
                          ),
                        ),

                        // SVG image or other elements can go here
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Company Name',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF000000).withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: companyNameController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color:
                                const Color(0xFF000000).withOpacity(0.8)),
                            decoration: InputDecoration(
                              hintText: '',
                              prefixIcon: Icon(Icons.business, size: 20),
                              // Reduce icon size
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0), // Reduce vertical padding
                            ),
                          ),
                        ),

                        // SVG image or other elements can go here
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF000000).withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child:
                          TextFormField(
                            cursorColor: Colors.black,
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color:
                                const Color(0xFF000000).withOpacity(0.8)),
                            decoration: InputDecoration(
                              hintText: '',
                              prefixIcon: Icon(Icons.phone_android, size: 20),
                              // Reduce icon size
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0), // Reduce vertical padding
                            ),
                          ),
                        ),

                        // SVG image or other elements can go here
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Country Name',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF000000).withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
      InkWell(
        onTap: () {
          showCountryPicker(
            context: context,
            showPhoneCode: true,
            onSelect: (Country country) {
              print('Select country: ${country.displayName}');
              countryController.text = country.displayName; // Set the selected country in the text field
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: countryController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: const Color(0xFF000000).withOpacity(0.8)),
                  decoration: InputDecoration(
                    hintText: '',
                    prefixIcon: Icon(Icons.flag, size: 20),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0),
                  ),
                  readOnly: true, // Makes the text field non-editable
                  onTap: () {
                    // Show the country picker dialog when the text field is tapped
                    showCountryPicker(
                      context: context,
                      showPhoneCode: true,
                      onSelect: (Country country) {
                        print('Select country: ${country.displayName}');
                        countryController.text = country.displayName; // Update the controller with the selected country
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )

      ],
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 25.0, vertical: 20.0),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  height: 55,
                  width: 160,
                  child:
                  ElevatedButton(
                    onPressed: () =>
                    {
                      //saveData()
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color(0xFF6869EF),
                        side: BorderSide.none),
                    child: const Text("Submit",
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ), // ElevatedButton
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
