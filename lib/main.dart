import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

Color mainColor = Colors.grey[200]!;
Color secondColor = Colors.green;
Color thirdColor = invert(mainColor);
String MainSelected = "ابيض";
String SecondSelected = "احمر";

List pages = [
  Paid(),
  Broast(),
  Burger(),
  Finger(),
  Shawrma(),
  Appetizer(),
  Rezo(),
  Drinks(),
  Weast(),
  Pizza(),
  Family()
];

List BroastList = [
  Food("3 قطع بروستد", 5000),
  Food("5 قطع بروستد", 9000),
  Food("10 قطع بروستد", 17000),
  Food("14 قطعة بروستد", 26000),
];

List BurgerList = [
  Food("برغر لحم كلاسيك", 3000),
  Food("برغر دجاج كلاسيك", 2500),
  Food("برغر لحم بالجبن", 3500),
  Food("برغر دجاج بالجبن", 3000),
  Food("دبل برغر لحم", 5000),
  Food("دبل برغر دجاج", 3500),
  Food("برغر مكس", 4000),
  Food("برغر بالمشروم", 3500),
];

List FingerList = [
  Food("فنكر كلاسيك", 1000),
  Food("فنكر متبل", 1500),
  Food("فنكر بالجبن", 2500),
  Food("فنكر كبير كلاسيك", 2000),
  Food("فنكر كبير بالجبن", 4000),
];

List ShawrmaList = [
  Food("L شاورما دجاج", 2000),
  Food("XL شاورما دجاج", 3000),
  Food("L صاج", 2000),
  Food("XL صاج", 3000),
  Food("وجبة شاورما عربي", 4000),
  Food("L شاورما لحم", 3000),
  Food("XL شاورما لحم", 4000),
  Food("L صاج لحم", 3000),
  Food("XL صاج لحم", 4000),
  Food("وجبة شاورما لحم عربي", 5000),
];

List AppetizerList = [
  Food("مقبلات صغير", 2000),
  Food("مقبلات وسط", 3000),
  Food("مقبلات كبير", 4000),
  Food("مقبلات عائلي", 5000),
];

List RezoList = [
  Food("ريزو مقرمش", 4000),
  Food("ريزو كلاسيك دجاج", 4000),
  Food("ريزو كلاسيك لحم", 7000),
  Food("ريزو سبايسي", 4500),
  Food("ريزو جبن", 5000),
];

List DrinksList = [
  Food("ببسي", 500),
  Food("لتر ببسي", 1000),
  Food("سفن اب", 500),
  Food("ميرندا", 500),
  Food("عصير", 500),
  Food("لبن", 500),
];

List WeastList = [
  Food("كرسبي", 3000),
  Food("زنجر", 3000),
  Food("فاهيتا لحم", 4000),
  Food("فاهيتا دجاج", 3000),
  Food("مكسيكانو سبايسي", 3000),
  Food("صاج ايطالي لحم", 5000),
  Food("صاج ايطالي دجاج", 4000),
];

List PizzaList = [
  Food("بيتزا لحم وسط", 8000),
  Food("بيتزا لحم كبير", 10000),
  Food("بيتزا دجاج وسط", 6000),
  Food("بيتزا دجاج كبير", 8000),
  Food("بيتزا مرغريتا وسط", 6000),
  Food("بيتزا مرغريتا كبير", 8000),
  Food("بيتزا انجلو وسط", 6000),
  Food("بيتزا انجلو كبير", 8000),
  Food("بيتزا روستيكا وسط", 6000),
  Food("بيتزا روستيكا كبير", 8000),
  Food("الفصول الاربعة وسط", 7000),
  Food("الفصول الاربعة كبير", 9000),
];

List FamilyList = [
  Food("وجبة شاورما دجاج", 10000),
  Food("وجبة شاورما لحم", 12000),
  Food("وجبة كرسبي عائلي", 10000),
  Food("ريزو مقرمش عائلي", 10000),
  Food("ريزو لحم عائلي", 12000),
];

List foods = [
  BroastList,
  BurgerList,
  FingerList,
  ShawrmaList,
  AppetizerList,
  RezoList,
  DrinksList,
  WeastList,
  PizzaList,
  FamilyList,
];

List order = [];

num fullPrice = 0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class Broast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldMessenger(
        child: Scaffold(
          backgroundColor: mainColor,
          appBar: mainAppBar("كنتاكي", context),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text("الاكلا ت", style: TitleStyle(Colors.white)),
                  decoration: BoxDecoration(
                    color: secondColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    foodElement(food: foods[0][0]),
                    foodElement(food: foods[0][1]),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    foodElement(food: foods[0][2]),
                    foodElement(food: foods[0][3]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Burger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldMessenger(
        child: Scaffold(
          backgroundColor: mainColor,
          appBar: mainAppBar("برغر", context),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text("الاكلا ت", style: TitleStyle(Colors.white)),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[1][0]),
                      foodElement(food: foods[1][1]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[1][2]),
                      foodElement(food: foods[1][3]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[1][3]),
                      foodElement(food: foods[1][4]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[1][5]),
                      foodElement(food: foods[1][6]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  foodElement(food: foods[1][7]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Finger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldMessenger(
        child: Scaffold(
          backgroundColor: mainColor,
          appBar: mainAppBar("فنكر", context),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text("الاكلا ت", style: TitleStyle(Colors.white)),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[2][0]),
                      foodElement(food: foods[2][1]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[2][2]),
                      foodElement(food: foods[2][3]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  foodElement(food: foods[2][4])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Shawrma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldMessenger(
        child: Scaffold(
          backgroundColor: mainColor,
          appBar: mainAppBar("شاورما", context),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text("الاكلا ت", style: TitleStyle(Colors.white)),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[3][0]),
                      foodElement(food: foods[3][1]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[3][2]),
                      foodElement(food: foods[3][3]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[3][4]),
                      foodElement(food: foods[3][5]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[3][6]),
                      foodElement(food: foods[3][7]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Appetizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldMessenger(
        child: Scaffold(
          backgroundColor: mainColor,
          appBar: mainAppBar("مقبلات", context),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text("مقبلا ت", style: TitleStyle(Colors.white)),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[4][0]),
                      foodElement(food: foods[4][1]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[4][2]),
                      foodElement(food: foods[4][3]),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Rezo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldMessenger(
        child: Scaffold(
          backgroundColor: mainColor,
          appBar: mainAppBar("ريزو", context),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text("اكلا ت", style: TitleStyle(Colors.white)),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[5][0]),
                      foodElement(food: foods[5][1]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[5][2]),
                      foodElement(food: foods[5][3]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  foodElement(food: foods[5][4]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Drinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldMessenger(
        child: Scaffold(
          backgroundColor: mainColor,
          appBar: mainAppBar("المشروبات", context),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text("المشروبا ت", style: TitleStyle(Colors.white)),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[6][0]),
                      foodElement(food: foods[6][1]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[6][2]),
                      foodElement(food: foods[6][3]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[6][4]),
                      foodElement(food: foods[6][5]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Weast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldMessenger(
        child: Scaffold(
          backgroundColor: mainColor,
          appBar: mainAppBar("اكلات غربية", context),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text("الاكلا ت", style: TitleStyle(Colors.white)),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[7][0]),
                      foodElement(food: foods[7][1]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[7][2]),
                      foodElement(food: foods[7][3]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[7][4]),
                      foodElement(food: foods[7][5]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  foodElement(food: foods[7][6]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Pizza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldMessenger(
        child: Scaffold(
          backgroundColor: mainColor,
          appBar: mainAppBar("بيتزا", context),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text("اكلا ت", style: TitleStyle(Colors.white)),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[8][0]),
                      foodElement(food: foods[8][1]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[8][2]),
                      foodElement(food: foods[8][3]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[8][4]),
                      foodElement(food: foods[8][5]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[8][6]),
                      foodElement(food: foods[8][7]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[8][8]),
                      foodElement(food: foods[8][9]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[8][10]),
                      foodElement(food: foods[8][11]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Family extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldMessenger(
        child: Scaffold(
          backgroundColor: mainColor,
          appBar: mainAppBar("وجبات عائلية", context),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text("اكلا ت", style: TitleStyle(Colors.white)),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[9][0]),
                      foodElement(food: foods[9][1]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodElement(food: foods[9][2]),
                      foodElement(food: foods[9][3]),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  foodElement(food: foods[9][4]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List MainColors = [
  Colors.grey[200],
  Color(0xff28282B),
];

List<String> MainColorTitles = [
  "ابيض",
  "اسود",
];

List<String> SecondColorsTitles = [
  "ازرق",
  "احمر",
  "اصفر غامق",
  "اصفر",
  "بنفسجي",
  "وردي",
  "اخضر"
];

List SecondColors = [
  Colors.blue,
  Colors.red,
  Colors.amber,
  Colors.yellow,
  Colors.purple,
  Colors.pink,
  Colors.green,
];

mainAppBar(String s, context) {
  return AppBar(
    centerTitle: true,
    title: Text(s),
    backgroundColor: secondColor,
    actions: [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back))
    ],
  );
}

List Images = [
  "assets/images/paidSec.png",
  "assets/images/brostSec.webp",
  "assets/images/burgerSec.webp",
  "assets/images/fingerSec.png",
  "assets/images/shawarmaSec.webp",
  "assets/images/appetizersSec.png",
  "assets/images/rezoSec.png",
  "assets/images/drinksSec.png",
  "assets/images/westernSec.png",
  "assets/images/pizzaSec.png",
  "assets/images/familySec.png"
];
List Titles = [
  "سلة الاطعمة",
  "بروستد كنتاكي",
  "البرغر",
  "الفنكر",
  "شاورما",
  "مقبلات",
  "ريزو",
  "مشروبات غازية",
  "اكلات غربية",
  "بيتزا",
  "وجبات عائلية"
];

PagesFunction(childs) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: childs,
  );
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List Pages = [
    PagesFunction([foodSection(index: 0), foodSection(index: 1)]),
    PagesFunction([foodSection(index: 2), foodSection(index: 3)]),
    PagesFunction([foodSection(index: 4), foodSection(index: 5)]),
    PagesFunction([foodSection(index: 6), foodSection(index: 7)]),
    PagesFunction([foodSection(index: 8), foodSection(index: 9)]),
    PagesFunction([foodSection(index: 10)]),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: MyDrawer(),
        backgroundColor: mainColor,
        appBar: AppBar(
          backgroundColor: secondColor,
          title: Text("Syrian Kitchen"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text("Menu", style: TitleStyle(Colors.white)),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 400,
                  height: 600,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: Pages.length,
                    itemBuilder: (context, index) {
                      return Pages[index];
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color invert(Color color) {
  final r = 255 - color.red;
  final g = 255 - color.green;
  final b = 255 - color.blue;

  return Color.fromARGB((color.opacity * 255).round(), r, g, b);
}

class MyDrawer extends StatefulWidget {
  MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: mainColor,
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DrawerHeader(
            child: Text(
              "Syrian Kitchen",
              style: SecTitle(thirdColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("اللون الاساسي",
                      style: GoogleFonts.cairo(color: thirdColor)),
                  DropdownButton<String>(
                    dropdownColor: invert(thirdColor),
                    value: MainSelected,
                    items: MainColorTitles.map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: GoogleFonts.cairo(
                              color: thirdColor,
                            ),
                          ),
                        )).toList(),
                    onChanged: (value) {
                      setState(
                        () {
                          MainSelected = value!;
                          mainColor =
                              MainColors[MainColorTitles.indexOf(MainSelected)];
                          thirdColor = invert(mainColor);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MainApp()));
                        },
                      );
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  Text("اللون الثانوي",
                      style: GoogleFonts.cairo(color: thirdColor)),
                  DropdownButton<String>(
                    dropdownColor: invert(thirdColor),
                    value: SecondSelected,
                    items: SecondColorsTitles.map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e,
                              style: GoogleFonts.cairo(
                                color: thirdColor,
                              )),
                        )).toList(),
                    onChanged: (value) {
                      setState(
                        () {
                          SecondSelected = value!;
                          secondColor = SecondColors[
                              SecondColorsTitles.indexOf(SecondSelected)];
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MainApp()));
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("حساباتنا", style: SecTitle(thirdColor)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Icon(
                        FontAwesomeIcons.tiktok,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    "@syr_kit",
                    style: GoogleFonts.cairo(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text("®صنع بواسطة ابراهيم مزهر", style: SecTitle(thirdColor))
        ],
      ),
    );
  }
}

SecTitle([color = Colors.white]) {
  return GoogleFonts.cairo(color: color, fontSize: 16, height: 3);
}

TitleStyle(color) {
  return GoogleFonts.cairo(
    fontWeight: FontWeight.w900,
    fontSize: 35,
    height: 1.5,
    color: color,
  );
}

class foodSection extends StatelessWidget {
  int index;
  String? imageSource;
  String? secTitle;

  foodSection({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    secTitle = Titles[index];
    imageSource = Images[index];
    return Container(
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pages[index]),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(mainColor),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: secondColor,
              borderRadius: BorderRadius.circular(16),
            ),
            width: 130,
            height: 150,
            child: Center(
              child: Column(
                children: [
                  Image(
                    image: AssetImage(imageSource!),
                    width: 100,
                    height: 60,
                  ),
                  Text(
                    secTitle!,
                    style: SecTitle(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Food {
  int price = 0;
  String Name = "";

  Food(Name, price) {
    this.Name = Name;
    this.price = price;
  }
}

List order2 = [];

class foodElement extends StatelessWidget {
  var food;
  foodElement({
    super.key,
    required Food this.food,
  });
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: secondColor,
            borderRadius: BorderRadius.circular(16),
          ),
          width: 170,
          height: 200,
          child: Center(
            child: Column(
              children: [
                Text(
                  food.Name,
                  style: SecTitle(),
                ),
                Text("السعر : ${food.price} دينار",
                    style: TextStyle(
                      color: mainColor,
                    )),
                SizedBox(height: 25),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      icon: Icon(Icons.plus_one),
                      onPressed: () {
                        order.add(this.food);

                        order2.add(this.food.Name);
                        order2.add(this.food.price);

                        fullPrice += this.food.price;
                        final mySnackBar = MySnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
                        print(order);
                      },
                      color: thirdColor,
                    ),
                    color: invert(thirdColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

SnackBar MySnackBar() {
  return SnackBar(
    content: Text("تمت الاضافة السلة"),
    duration: Duration(seconds: 1),
    backgroundColor: Colors.black,
    action: SnackBarAction(
      label: "الغاء",
      textColor: Colors.red,
      onPressed: () {
        fullPrice -= order.last.price;
        order.removeLast();
      },
    ),
  );
}

SnackBar MyDelSnackBar(text) {
  return SnackBar(
    content: Text(text),
    duration: Duration(seconds: 1),
    backgroundColor: Colors.black,
  );
}

class Paid extends StatefulWidget {
  const Paid({super.key});

  @override
  State<Paid> createState() => _PaidState();
}

class _PaidState extends State<Paid> {
  Future getPosition() async {
    while (true) {
      if (await Geolocator.checkPermission() == LocationPermission.denied) {
        await Geolocator.requestPermission();
      } else {
        break;
      }
    }
    return await Geolocator.getCurrentPosition().then((value) => value);
  }

  late Position cl;

  final _firestore = FirebaseFirestore.instance;
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: mainAppBar("سلة الطلبات", context),
        backgroundColor: mainColor,
        body: ModalProgressHUD(
          inAsyncCall: loading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 400,
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: order.length,
                    itemBuilder: (context, index) {
                      return deleFoodEle(
                        index: index,
                        food: order[index],
                        onPress: () {
                          setState(
                            () {
                              fullPrice -= order[index].price;
                              order.removeAt(index);
                              final mySnackBar =
                                  MyDelSnackBar("تم الحذف بنجاح");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(mySnackBar);
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.green),
                  child: Center(
                    child: Text(
                      "السعر الاجمالي $fullPrice دينار",
                      style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InputWidget(Hint: "الاسم", controller: name),
                SizedBox(height: 10),
                InputWidget(Hint: "رقم الهاتف", controller: phoneNumber),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        cl = await getPosition();
                        String fullLocation = "${cl.latitude}, ${cl.longitude}";
                        if (check()) {
                          _firestore.collection("info").add({
                            'Name': name.value.text,
                            'Number': phoneNumber.value.text,
                            'order': order2,
                            'location': fullLocation,
                          }).then((_) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Acounts(),
                              ),
                            );
                            order = [];
                            fullPrice = 0;
                            order2 = [];
                            setState(() {
                              loading = false;
                            });
                          });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    insetPadding: EdgeInsets.all(16),
                                    title: Text("Erorr!"),
                                    content: Text(
                                        "حدث خطأ! الرجاء اعادة المحاولة لاحقا"),
                                    actions: [
                                      TextButton(
                                        child: Text("حسناً"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ));
                          setState(() {
                            loading = false;
                          });
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color?>(Colors.amber[600]),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 90, vertical: 16)),
                      ),
                      child: Text(
                        "!اطلب الان",
                        style: GoogleFonts.cairo(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool check() {
    return !(name.value.text.isEmpty) &&
        !(phoneNumber.value.text.isEmpty) &&
        order2.length > 0;
  }
}

class InputWidget extends StatelessWidget {
  final String Hint;
  final TextEditingController controller;
  const InputWidget({
    super.key,
    required this.Hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            controller: this.controller,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixText: this.controller.text,
              hintText: this.Hint,
            ),
          ),
        ),
      ),
    );
  }
}

class deleFoodEle extends StatelessWidget {
  var food;
  var index;
  dynamic onPress;
  deleFoodEle({
    super.key,
    required this.food,
    required this.onPress,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 5,
        ),
        Container(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.circular(16),
              ),
              width: 170,
              height: 200,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      this.food.Name,
                      style: SecTitle(),
                    ),
                    Text("السعر ${this.food.price} دينار",
                        style: TextStyle(
                          color: mainColor,
                        )),
                    SizedBox(height: 25),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: (mainColor),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.exposure_minus_1),
                          onPressed: onPress,
                          color: invert(mainColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }
}

class Acounts extends StatelessWidget {
  Acounts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: mainColor,
        appBar: mainAppBar("!شكرا لك على اختيارنا", context),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "...لقد تم استلام طلبك وسيتم ارساله الى عنوانك قريبا",
                  style: GoogleFonts.cairo(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              child: Icon(
                                FontAwesomeIcons.tiktok,
                                size: 50,
                              ),
                            ),
                          ),
                          Text(
                            "@syr_kit",
                            style: GoogleFonts.cairo(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
