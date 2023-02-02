// ignore_for_file: depend_on_referenced_packages, empty_catches

import 'dart:io';
import 'package:dashboardlive/profile/profile_view_modal.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:path/path.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModal>.reactive(
      viewModelBuilder: () => ProfileViewModal(),
      builder: (context, viewModel, child) => SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color(0xff21A2FF),
                Color(0xff31414D),
              ],
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              actions: const [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(Icons.notifications_outlined),
                )
              ],
              toolbarHeight: 60,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            drawer: Drawer(
              backgroundColor: const Color(0xff21A2FF),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff21A2FF),
                      Color(0xff31414D),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const DrawerHeader(
                      child: Image(
                        image: AssetImage('assets/images/logo.png'),
                        height: 100,
                        width: 100,
                      ),
                    ),
                    listTileinDrawer("Home"),
                    listTileinDrawer("Leaves"),
                    listTileinDrawer("IT Helpdesk"),
                    listTileinDrawer("Holidays"),
                    Expanded(child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Light Mode",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Switch(
                          value: viewModel.light,
                          activeColor: const Color(0xff21A2FF),
                          onChanged: (bool value) {
                            setState(
                              () {
                                viewModel.light = value;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipOval(
                          child: CircleAvatar(
                            radius: 20,
                            child: 
                            image != null
                                  ? Image.file(
                                      image!,
                                      fit: BoxFit.cover,
                                    )
                                  : const Image(
                                      image: AssetImage(
                                        'assets/images/avocada.jpg',
                                      ),
                                      fit:  BoxFit.cover ,
                                    ),
                          ),
                        ),
                       const Text(
                          "Dhruv Swami",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                       IconButton(onPressed: (){}, icon: const Icon(Icons.logout,color: Colors.white,))
                      ],
                    )
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 15),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff56a9e5),
                                Color(0xff287ebd),
                              ],
                            ),
                            border: Border.all(color: Colors.white, width: .1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 9,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: "Dhruv Swami\n",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        letterSpacing: .5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text: "UX/Ui Designer\n",
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                              fontSize: 10.5),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: const [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(255, 35, 146, 229),
                                          blurStyle: BlurStyle.outer,
                                          offset: Offset(-8, 0),
                                        ),
                                      ],
                                    ),
                                    child: const CircleAvatar(
                                      backgroundColor: Color(0xff1ea0ff),
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 2.5,
                                color: Colors.white.withOpacity(0.4),
                                thickness: 1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    detailsinHome("\nAvailable", '\n7 Days'),
                                    VerticalDivider(
                                      color: Colors.white.withOpacity(0.2),
                                      indent: 10,
                                      endIndent: 5,
                                      thickness: 1,
                                    ),
                                    detailsinHome("\nAll", '\n26 Days'),
                                    VerticalDivider(
                                      color: Colors.white.withOpacity(0.2),
                                      indent: 10,
                                      endIndent: 5,
                                      thickness: 1,
                                    ),
                                    detailsinHome("\nUsed", '\n19 Days')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 18,
                        ),
                        listHeaderinHome("Recent Leave Requests"),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 55,
                        ),
                        SizedBox(
                          height: 385,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: leaveBox(
                                    context,
                                    'Sick Leave',
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.printing and ',
                                    'Accepted',
                                    const Color(0xffbfffd0),
                                    Colors.green),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                       listHeaderinHome("My Desk Tickets"),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 60,
                        ),
                        SizedBox(
                          height: 222,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: ticketBox(
                                  context,
                                  " ID : 3",
                                  "Login issue",
                                  "In Progress",
                                  "Assigned to",
                                  "Jhon Doe",
                                  const Color(0xfffff9bf),
                                  const Color(0xffd6bd34),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Holidays",
                              style: TextStyle(
                                  fontSize: 22,
                                  wordSpacing: 1,
                                  letterSpacing: .5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                            itemExtent: 85,
                            itemCount: 5,
                            itemBuilder: (context, i) {
                              return holidays(context, "   24 Mar", "Holi");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          bottomSheet(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.white.withOpacity(0.2), width: 7),
                          ),
                          child: ClipOval(
                            child: CircleAvatar(
                              radius: 57,
                              backgroundColor: Colors.transparent,
                              child: image != null
                                  ? Image.file(
                                      image!,
                                      fit: BoxFit.cover,
                                    )
                                  : const Image(
                                      image: AssetImage(
                                        'assets/images/avocada.jpg',
                                      ),
                                      fit:  BoxFit.cover ,
                                    ),
                            ),
                          ),
                        ),
                      ),
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

 leaveBox(context, String headText, String descText, String condition,
      Color cndclr, Color textcolor) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: .1),
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  headText,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: cndclr,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(
                        condition,
                        style: TextStyle(
                            fontSize: 9.5,
                            color: textcolor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              descText,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  letterSpacing: .7,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      "  January 23, 2023",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget ticketBox(context, String id, String issue, String condition,
      String assignedTo, String name, Color cndclr, Color textcolor) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: .1),
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.key,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  id,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      letterSpacing: .5,
                      wordSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  issue,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      wordSpacing: 1,
                      letterSpacing: .5,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: cndclr,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(
                        condition,
                        style: TextStyle(
                            fontSize: 9.5,
                            color: textcolor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  assignedTo,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      letterSpacing: .7,
                      fontWeight: FontWeight.w500),
                ),
                const Text(
                  "~",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      letterSpacing: .4,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  detailsinHome(String head, String days) {
    return Column(
      children: [
        Text(
          head,
          style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 10,
              letterSpacing: .5,
              fontWeight: FontWeight.bold),
        ),
        Text(
          days,
          style: const TextStyle(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  holidays(context, String date, String holidayName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          date,
          style: const TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.6,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/images/holi.jpg"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          height: MediaQuery.of(context).size.height / 12.2,
          child: Center(
            child: Text(
              holidayName,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  void bottomSheet(context) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff287ebd),
                Color.fromARGB(255, 69, 168, 238),
                Color.fromARGB(255, 69, 168, 238),
                Color(0xff287ebd),
              ],
            ),
          ),
          height: 175,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Profile photo",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            pickImage(ImageSource.camera, context);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: .2),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "\nCamera",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            pickImage(ImageSource.gallery, context);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: .2),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.image,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "\nGallery",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final picker = ImagePicker();

  File? image;

  Future pickImage(ImageSource source, context) async {
    try {
      final image = await picker.getImage(source: source);
      if (image == null) {
        return;
      }
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imagePermanent;
      });
    } on Exception {}
    Navigator.pop(context);
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  listTileinDrawer(String pageName) {
    return ListTile(
      leading: const Icon(
        Icons.home_outlined,
        color: Colors.white,
      ),
      title: Text(
        pageName,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  listHeaderinHome(String headerName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerName,
          style: const TextStyle(
              fontSize: 23,
              wordSpacing: 1,
              letterSpacing: .5,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: Color(0xff2484ca),
                blurStyle: BlurStyle.outer,
                offset: Offset(-8, 0),
              ),
            ],
          ),
          child: const CircleAvatar(
            backgroundColor: Color(0xff1ea0ff),
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
