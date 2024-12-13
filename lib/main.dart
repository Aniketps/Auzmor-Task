import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFilter = false;
  @override
  Widget build(BuildContext context) {
    final List<String> banners = [
      "https://www.shutterstock.com/image-photo/kpi-dashboard-graph-presentation-classroom-600nw-2466399827.jpg",
      "https://img.freepik.com/free-photo/diverse-group-students-taking-online-tests_74855-1805.jpg",
      "https://img.freepik.com/free-photo/instructor-helping-students-computer-class_74855-2020.jpg",
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Trainings",
          style: TextStyle(
            fontSize: 25,
            fontFamily: "Times New Roman", // Specify your font family
            fontWeight: FontWeight.bold, // Make the text bold
            letterSpacing: 1.5, // Add a small space between characters
          ),
        ),
        backgroundColor: Colors.red,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Navigate to Home
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Trainings'),
              onTap: () {
                // Navigate to Trainings
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Navigate to Profile
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                  height: 260,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.red,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: const Text(
                                "Highlights",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isFilter = true;
                                });
                              },
                              child: Container(
                                width:
                                    80, // Increased width for better alignment
                                height:
                                    33, // Standard height for better proportion
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      10), // Smoother rounded corners
                                  border: Border.all(
                                    color: Colors.green, // Border color
                                    width:
                                        1, // Slightly thinner border for a subtler look
                                  ),
                                  color: Colors.white, // Background color
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, // Space between elements
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(
                                          8.0), // Padding for the icon
                                      child: Icon(
                                        Icons
                                            .menu_rounded, // Three-line menu icon
                                        color: Colors.green, // Icon color
                                        size:
                                            15, // Set a consistent size for the icon
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right:
                                              8.0), // Padding to align text properly
                                      child: Text(
                                        "Filter", // Filter name
                                        style: TextStyle(
                                          fontSize: 12, // Consistent font size
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CarouselSlider(
                                  items: banners.map((banner) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                5), // Rounded corners
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width, // Set width directly in Container
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      banner), // Corrected to use NetworkImage
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  // Black overlay with opacity
                                                  Container(
                                                    color: Colors.black.withOpacity(
                                                        0.4), // 0.4 is the opacity level, adjust as needed
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(
                                                        8.0), // Optional padding for content
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.end,// Align text to the left
                                                      children: [
                                                        // "Safe Scrum Master" starting from a good position
                                                        Container(
                                                          child: Text(
                                                            "Safe Scrum Master",
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                2), // Space between title and date
                                                        Text(
                                                          "West Des Moines IA - 30 Oct - 30 Oct",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                2), // Space between date and row
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start, // Align row elements to the start
                                                          children: [
                                                            // Price $975 with line-through style and smaller font
                                                            Text(
                                                              "\$975",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    Colors.red,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough, // Crossed out
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width:
                                                                    2), // 2px gap between prices
                                                            // Price $825
                                                            Text(
                                                              "\$825",
                                                              style: TextStyle(
                                                                fontSize:
                                                                    14, // Slightly larger size for $825
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            ),
                                                            Spacer(), // This will push "View Details" to the right
                                                            // "View Details" button and the arrow icon on the right side
                                                            Text(
                                                              "View Details",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color:
                                                                    Colors.white,
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons.arrow_forward,
                                                              color: Colors
                                                                  .white, // Color for the arrow icon
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ));
                                      },
                                    );
                                  }).toList(),
                                  options: CarouselOptions(
                                    height: 150.0,
                                    autoPlay: true, // Auto-scroll banners
                                    enlargeCenterPage: true,
                                    aspectRatio: 16 / 9,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enableInfiniteScroll: true,
                                    autoPlayAnimationDuration:
                                        const Duration(seconds: 2),
                                    viewportFraction: 0.9,
                                  ),
                                ),
                              ),
                              Positioned(
                                left:
                                    2, // Adjust the position of the left button
                                child: Container(
                                  height: 80,
                                  width: 30,
                                  color: Colors.black26,
                                  child: Center(
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_back_ios,
                                          size: 30, color: Colors.black),
                                      onPressed: () {
                                        // Your action for the left button
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right:
                                    2, // Adjust the position of the left button
                                child: Container(
                                  height: 80,
                                  width: 30,
                                  color: Colors.black26,
                                  child: Center(
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_forward_ios,
                                          size: 30, color: Colors.black),
                                      onPressed: () {
                                        // Your action for the left button
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                height: 400,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 1)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  0.35, // 30% of the screen width
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "Oct 11 - 13, 2019",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text("08:30 am - 12:30 pm",
                                        style: TextStyle(fontSize: 8)),
                                  ),
                                  Text("Convention Hall Greater Des Moines",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9)),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              width: 1,
                              color: Colors.grey,
                              thickness: 2,
                              indent: 10,
                              endIndent: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Filling Fast",
                                      style: TextStyle(fontSize: 8)),
                                  Text(
                                    "Safe Scrum  Master (4.6)",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://t3.ftcdn.net/jpg/06/99/46/60/360_F_699466075_DaPTBNlNQTOwwjkOiFEoOvzDV0ByXR9E.jpg"),
                                                fit: BoxFit
                                                    .cover, // Ensures the image fits within the container
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Keynote Speaker",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 9)),
                                            Text("Helen Gribble",
                                                style: TextStyle(fontSize: 8))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Your onPressed logic here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.red, // Background color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              2), // Border radius
                                        ),
                                        minimumSize: Size(120, 32),
                                      ),
                                      child: Text(
                                        "Enrol Now",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 1)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  0.35, // 30% of the screen width
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "Oct 11 - 13, 2019",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text("08:30 am - 12:30 pm",
                                        style: TextStyle(fontSize: 8)),
                                  ),
                                  Text("Convention Hall Greater Des Moines",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9)),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              width: 1,
                              color: Colors.grey,
                              thickness: 2,
                              indent: 10,
                              endIndent: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Filling Fast",
                                      style: TextStyle(fontSize: 8)),
                                  Text(
                                    "Safe Scrum  Master (4.6)",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://t3.ftcdn.net/jpg/06/99/46/60/360_F_699466075_DaPTBNlNQTOwwjkOiFEoOvzDV0ByXR9E.jpg"),
                                                fit: BoxFit
                                                    .cover, // Ensures the image fits within the container
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Keynote Speaker",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 9)),
                                            Text("Helen Gribble",
                                                style: TextStyle(fontSize: 8))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Your onPressed logic here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.red, // Background color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              2), // Border radius
                                        ),
                                        minimumSize: Size(120, 32),
                                      ),
                                      child: Text(
                                        "Enrol Now",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 1)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  0.35, // 30% of the screen width
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "Oct 11 - 13, 2019",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text("08:30 am - 12:30 pm",
                                        style: TextStyle(fontSize: 8)),
                                  ),
                                  Text("Convention Hall Greater Des Moines",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9)),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              width: 1,
                              color: Colors.grey,
                              thickness: 2,
                              indent: 10,
                              endIndent: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Filling Fast",
                                      style: TextStyle(fontSize: 8)),
                                  Text(
                                    "Safe Scrum  Master (4.6)",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://t3.ftcdn.net/jpg/06/99/46/60/360_F_699466075_DaPTBNlNQTOwwjkOiFEoOvzDV0ByXR9E.jpg"),
                                                fit: BoxFit
                                                    .cover, // Ensures the image fits within the container
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Keynote Speaker",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 9)),
                                            Text("Helen Gribble",
                                                style: TextStyle(fontSize: 8))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Your onPressed logic here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.red, // Background color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              2), // Border radius
                                        ),
                                        minimumSize: Size(120, 32),
                                      ),
                                      child: Text(
                                        "Enrol Now",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 1)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  0.35, // 30% of the screen width
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "Oct 11 - 13, 2019",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text("08:30 am - 12:30 pm",
                                        style: TextStyle(fontSize: 8)),
                                  ),
                                  Text("Convention Hall Greater Des Moines",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9)),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              width: 1,
                              color: Colors.grey,
                              thickness: 2,
                              indent: 10,
                              endIndent: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Filling Fast",
                                      style: TextStyle(fontSize: 8)),
                                  Text(
                                    "Safe Scrum  Master (4.6)",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://t3.ftcdn.net/jpg/06/99/46/60/360_F_699466075_DaPTBNlNQTOwwjkOiFEoOvzDV0ByXR9E.jpg"),
                                                fit: BoxFit
                                                    .cover, // Ensures the image fits within the container
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Keynote Speaker",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 9)),
                                            Text("Helen Gribble",
                                                style: TextStyle(fontSize: 8))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Your onPressed logic here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.red, // Background color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              2), // Border radius
                                        ),
                                        minimumSize: Size(120, 32),
                                      ),
                                      child: Text(
                                        "Enrol Now",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 1)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  0.35, // 30% of the screen width
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "Oct 11 - 13, 2019",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text("08:30 am - 12:30 pm",
                                        style: TextStyle(fontSize: 8)),
                                  ),
                                  Text("Convention Hall Greater Des Moines",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9)),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              width: 1,
                              color: Colors.grey,
                              thickness: 2,
                              indent: 10,
                              endIndent: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Filling Fast",
                                      style: TextStyle(fontSize: 8)),
                                  Text(
                                    "Safe Scrum  Master (4.6)",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://t3.ftcdn.net/jpg/06/99/46/60/360_F_699466075_DaPTBNlNQTOwwjkOiFEoOvzDV0ByXR9E.jpg"),
                                                fit: BoxFit
                                                    .cover, // Ensures the image fits within the container
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Keynote Speaker",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 9)),
                                            Text("Helen Gribble",
                                                style: TextStyle(fontSize: 8))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Your onPressed logic here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.red, // Background color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              2), // Border radius
                                        ),
                                        minimumSize: Size(120, 32),
                                      ),
                                      child: Text(
                                        "Enrol Now",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 1)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  0.35, // 30% of the screen width
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "Oct 11 - 13, 2019",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text("08:30 am - 12:30 pm",
                                        style: TextStyle(fontSize: 8)),
                                  ),
                                  Text("Convention Hall Greater Des Moines",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9)),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              width: 1,
                              color: Colors.grey,
                              thickness: 2,
                              indent: 10,
                              endIndent: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Filling Fast",
                                      style: TextStyle(fontSize: 8)),
                                  Text(
                                    "Safe Scrum  Master (4.6)",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://t3.ftcdn.net/jpg/06/99/46/60/360_F_699466075_DaPTBNlNQTOwwjkOiFEoOvzDV0ByXR9E.jpg"),
                                                fit: BoxFit
                                                    .cover, // Ensures the image fits within the container
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Keynote Speaker",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 9)),
                                            Text("Helen Gribble",
                                                style: TextStyle(fontSize: 8))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Your onPressed logic here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.red, // Background color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              2), // Border radius
                                        ),
                                        minimumSize: Size(120, 32),
                                      ),
                                      child: Text(
                                        "Enrol Now",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          isFilter
              ? Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: double.infinity, // Fill the available width
                    decoration: BoxDecoration(
                      color: Colors.white, // Corrected color name
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sort and Filters",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      isFilter = false;
                                    });
                                  },
                                  child: Icon(Icons.close))
                            ],
                          ),
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.48,
                                decoration:
                                    BoxDecoration(color: Colors.black12),
                                child: Column(
                                  children: [
                                    Container(
                                        height: 50,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 30, bottom: 15),
                                          child: Text(
                                            "Sort by",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        )),
                                    Container(
                                        height: 50,
                                        width: double.maxFinite,
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 30, bottom: 15),
                                          child: Text(
                                            "Location",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        )),
                                    Container(
                                        height: 50,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 30, bottom: 15),
                                          child: Text(
                                            "Training Name",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        )),
                                    Container(
                                        height: 50,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 30, bottom: 15),
                                          child: Text(
                                            "Trainer",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        )),
                                  ],
                                )),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.50,
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Search Box
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical:
                                                10.0), // Add spacing around the TextField
                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey[
                                                200], // Light grey background
                                            hintText: 'Search...',
                                            hintStyle: TextStyle(
                                              color: Colors.grey[600],
                                              fontStyle: FontStyle.italic,
                                            ),
                                            prefixIcon: Icon(Icons.search,
                                                color: Colors.grey[700]),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      8.0), // Rounded corners
                                              borderSide: BorderSide
                                                  .none, // No visible border
                                            ),
                                          ),
                                        ),
                                      ),
                                      // CheckboxListTile
                                      CheckboxListTile(
                                        title: Text(
                                          "West Des Moines",
                                          style: TextStyle(
                                            fontSize:
                                                12, // Standard readable size
                                            color: Colors
                                                .black, // Black text for better visibility
                                          ),
                                        ),
                                        value: false,
                                        onChanged: (bool? value) {
                                          // Handle state update here
                                        },
                                        activeColor: Colors
                                            .blue, // Customize active checkbox color
                                        controlAffinity: ListTileControlAffinity
                                            .leading, // Checkbox on the left
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 1),
                                        // Minimize padding
                                      ),
                                      CheckboxListTile(
                                        title: Text(
                                          "Chingo, IL",
                                          style: TextStyle(
                                            fontSize:
                                                12, // Standard readable size
                                            color: Colors
                                                .black, // Black text for better visibility
                                          ),
                                        ),
                                        value: false,
                                        onChanged: (bool? value) {
                                          // Handle state update here
                                        },
                                        activeColor: Colors
                                            .blue, // Customize active checkbox color
                                        controlAffinity: ListTileControlAffinity
                                            .leading, // Checkbox on the left
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 1),
                                        // Minimize padding
                                      ),
                                      CheckboxListTile(
                                        title: Text(
                                          "Pheonix, AZ",
                                          style: TextStyle(
                                            fontSize:
                                                12, // Standard readable size
                                            color: Colors
                                                .black, // Black text for better visibility
                                          ),
                                        ),
                                        value: false,
                                        onChanged: (bool? value) {
                                          // Handle state update here
                                        },
                                        activeColor: Colors
                                            .blue, // Customize active checkbox color
                                        controlAffinity: ListTileControlAffinity
                                            .leading, // Checkbox on the left
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 1),
                                        // Minimize padding
                                      ),
                                      CheckboxListTile(
                                        title: Text(
                                          "Dallas, TX",
                                          style: TextStyle(
                                            fontSize:
                                                12, // Standard readable size
                                            color: Colors
                                                .black, // Black text for better visibility
                                          ),
                                        ),
                                        value: false,
                                        onChanged: (bool? value) {
                                          // Handle state update here
                                        },
                                        activeColor: Colors
                                            .blue, // Customize active checkbox color
                                        controlAffinity: ListTileControlAffinity
                                            .leading, // Checkbox on the left
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 1),
                                        // Minimize padding
                                      ),
                                      CheckboxListTile(
                                        title: Text(
                                          "San Diego, CA",
                                          style: TextStyle(
                                            fontSize:
                                                12, // Standard readable size
                                            color: Colors
                                                .black, // Black text for better visibility
                                          ),
                                        ),
                                        value: false,
                                        onChanged: (bool? value) {
                                          // Handle state update here
                                        },
                                        activeColor: Colors
                                            .blue, // Customize active checkbox color
                                        controlAffinity: ListTileControlAffinity
                                            .leading, // Checkbox on the left
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 1),
                                        // Minimize padding
                                      ),
                                      CheckboxListTile(
                                        title: Text(
                                          "San Fransisco, CA",
                                          style: TextStyle(
                                            fontSize:
                                                12, // Standard readable size
                                            color: Colors
                                                .black, // Black text for better visibility
                                          ),
                                        ),
                                        value: false,
                                        onChanged: (bool? value) {
                                          // Handle state update here
                                        },
                                        activeColor: Colors
                                            .blue, // Customize active checkbox color
                                        controlAffinity: ListTileControlAffinity
                                            .leading, // Checkbox on the left
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 1),
                                        // Minimize padding
                                      ),
                                      CheckboxListTile(
                                        title: Text(
                                          "New York, ZK",
                                          style: TextStyle(
                                            fontSize:
                                                12, // Standard readable size
                                            color: Colors
                                                .black, // Black text for better visibility
                                          ),
                                        ),
                                        value: false,
                                        onChanged: (bool? value) {
                                          // Handle state update here
                                        },
                                        activeColor: Colors
                                            .blue, // Customize active checkbox color
                                        controlAffinity: ListTileControlAffinity
                                            .leading, // Checkbox on the left
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 1),
                                        // Minimize padding
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
