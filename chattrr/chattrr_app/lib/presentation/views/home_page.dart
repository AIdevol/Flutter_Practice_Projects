import 'package:chattrr_app/helper_widgets/colors/colors.dart';
import 'package:chattrr_app/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});
  final HomeController controller = Get.put(HomeController());
  final formGlobalKeyEdit = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: chatscreencolor,
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: MyAppColor.primaryColor.withOpacity(0.5),
              pinned: true,
              floating: true,
              snap: true,
              title: Text(
                "Chattrr",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    print("QR scanner button tapped.............");
                  },
                  icon: const Icon(
                    Icons.qr_code_scanner_outlined,
                    color: MyAppColor.blackcolor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print("camera button tapped.............");
                  },
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: MyAppColor.blackcolor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print("more option button tapped.............");
                  },
                  icon: const Icon(
                    Icons.more_vert_rounded,
                    color: MyAppColor.blackcolor,
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: _mainbody(context),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return contacts(context, index);
                },
                childCount: controller.filteredContacts.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          height: 80,
          decoration:
              BoxDecoration(color: MyAppColor.primaryColor.withOpacity(0.5)),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.update),
                label: 'Updates',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline),
                label: 'Communities',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.call_sharp),
              //   label: 'Calls',
              // ),
            ],
            currentIndex: controller.selectedIndex.value,
            onTap: (index) {
              controller.updateSelectedIndex(index);
              print("tapped.....$index");
            },
          ),
        ),
      ),
    );
  }

  Widget _mainbody(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: MyAppColor.greyhard.withOpacity(0.5),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.search_rounded,
                    color: MyAppColor.blackcolor,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: controller.filterContacts,
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        isCollapsed: true,
                        contentPadding: EdgeInsets.only(left: 8.0),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget contacts(BuildContext context, int index) {
    final contact = controller.filteredContacts[index];
    return AnimatedContainer(
      duration: Duration(milliseconds: 5000),
      curve: Curves.easeInOut,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        gradient: chatvisibility,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(contact['avatar']!),
          ),
          title: Text(
            contact['name']!,
            style: const TextStyle(
              fontFamily: 'sans',
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: MyAppColor.blackcolor,
            ),
          ),
          subtitle: Text(
            contact['message']!,
            style: TextStyle(fontSize: 15, color: MyAppColor.greyhard),
          ),
          onTap: () {
            // Add onTap functionality here
            print("Chat tapped...");
          },
        ),
      ),
    );
  }
}
