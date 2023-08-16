import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myapptest/model/info_model.dart';
import 'package:myapptest/services/info_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController carouselController = CarouselController();
  InfoService infoService=InfoService();
  List<Insert>? insertData;
  @override
  void initState() {
    // TODO: implement initState
    fetchAllProducts();
    super.initState();
  }

  fetchAllProducts() async {
    insertData = await infoService.getData( context);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyApp"),
        centerTitle: true,
        elevation: 0,
      ),
      body:  insertData==null? Text("data"):



    ListView.builder(
        itemCount: insertData!.length ,
        itemBuilder: (context,index){

        final  data=insertData![index];


      return Column(
        children: [
          Text("${data.name}"),
          SizedBox(height: 10,),
          
          Image.network("${data.imageUrl}"),

          CarouselSlider(
            items: insertData!
                .map(
                  (item) => Image.network(
                item.imageUrl.toString(),
                fit: BoxFit.cover,
                height: 144,

              ),
            )
                .toList(),
            carouselController: carouselController,
            options: CarouselOptions(
              height: 144,

              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              aspectRatio: 2,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  // currentIndex = index;
                });
              },
            ),
          ),



        ],
      );
    })
    );
  }
}
