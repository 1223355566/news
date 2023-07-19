import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/news_search/newsSearch.dart';
import 'package:news/screens/tabs/news_tab.dart';

import '../../model/category_dm.dart';
import '../tabs/categories/categories_tab.dart';
import '../tabs/settings/settings.dart';

class Home extends StatefulWidget {
  static String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CategoryDM? selsctedCategory=null;
  late Widget selectedtab;

  initState(){
    super.initState();
    selectedtab=CategorisesTab(setSelectedCategory);
  }
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () {

        if(selectedtab is CategorisesTab){
        return Future.value(true);
        }
        else
        {
          selectedtab=CategorisesTab(setSelectedCategory);
          setState(() {
            
          });
          return Future.value(false);

        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(actions: [IconButton(onPressed: ()=>showSearch(context: context,
              delegate: NewsSearch())
              ,
              icon: Icon(Icons.search,size: 30,))],
              centerTitle: true,
              title: const Text(
                "News",
                style: TextStyle(fontSize: 22),
              ),
              backgroundColor: const Color.fromRGBO(57, 165, 82, 100),
              toolbarHeight: MediaQuery.of(context).size.height * 0.1,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)))),
          body:selectedtab,
          drawer: buildDrawer(context)),
    );
  }



  Widget buildDrawer(BuildContext context) {
    return Container(color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(color: Color.fromRGBO(57, 165, 82, 100),
              height: MediaQuery.of(context).size.height*0.2,
              child: const Center(child: Text("News App!",
                style: TextStyle(color:Colors.white ,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)
                ,))),
          SizedBox(height: 15,),

          InkWell(onTap: (){
            selsctedCategory=null;
            selectedtab=CategorisesTab(setSelectedCategory);
            setState(() {
            });
          },child: buildDrawerRow("Categories", Icons.menu)),
          const SizedBox(
            height: 20,
          ),

          InkWell(onTap: (){
            selectedtab=SettingsTab();
            setState(() {
            });
          },child: buildDrawerRow("Settings",  Icons.settings,)),
        ],
      ),
    );
  }

  void setSelectedCategory(CategoryDM category){
    selsctedCategory=category;
    selectedtab=NewsTab( selsctedCategory!);
    setState(() {
    });
    print("changed the selected Category to ${selsctedCategory?.title}");
  }

  Widget buildDrawerRow(String text,IconData icon){
    return  Row(
      children: [
        Icon(icon),
        SizedBox(width: 15,),
        Text(text,style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
      ],
    );
  }
}
