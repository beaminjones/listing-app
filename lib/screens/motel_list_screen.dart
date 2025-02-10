import 'package:flutter/material.dart';
import 'package:motel_listing_app/widgets/motel_card.dart';
import 'package:motel_listing_app/widgets/motel_item.dart';
import 'package:provider/provider.dart';
import '../providers/motel_provider.dart';

class MotelListScreen extends StatefulWidget {
  const MotelListScreen({super.key});

  @override
  MotelListScreenState createState() => MotelListScreenState();
}

class MotelListScreenState extends State<MotelListScreen> {
  @override
  Widget build(BuildContext context) {
    final motelProvider = Provider.of<MotelProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
              color: Colors.white,
            ),
            Row(
              children: [
                Container(
                  height: 26,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black26
                        .withValues(alpha: (0.3 * 255).toDouble()),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 135,
                        top: 0,
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.transparent,
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month,
                                  color: Colors.white, size: 18),
                              SizedBox(width: 5),
                              Text(
                                'ir outro dia',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.flash_on, color: Colors.red, size: 18),
                              SizedBox(width: 5),
                              Text(
                                'ir agora',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6),
            color: Colors.red,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'grande sp',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: motelProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.red,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.34,
                          child: ListView.builder(
                            itemCount: motelProvider.motels.length,
                            itemBuilder: (ctx, index) {
                              final motel = motelProvider.motels[index];
                              return MotelCard(motel: motel);
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.90,
                          child: ListView.builder(
                            itemCount: motelProvider.motels.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, index) {
                              final motel = motelProvider.motels[index];
                              return MotelItem(motel: motel);
                            },
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
}
