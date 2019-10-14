import 'package:flutter/material.dart';



class ProfilePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProfilePage > {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildHeader(),
                  SizedBox(height: 25.0,),
                  _buildUserInfo(),
                  SizedBox(height: 40.0,),
                  _buildFollowUser(),
                  SizedBox(height: 10.0,),
                  _buildTabs(),
                  SizedBox(height: 10.0,),
                  _buildGrid(),
                  SizedBox(height: 40.0,),
                ],
              ),
            ),
        ),
      ),
    );
  }


  Widget _buildHeader(){
    return Padding(
      padding: const EdgeInsets.only(top:15.0,left: 10.0,right: 10.0),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black.withOpacity(0.9),
            ),
          ),
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.black.withOpacity(0.9)
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.edit,
              color: Colors.black.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildUserInfo(){
    return Column(
      children: <Widget>[
         Container(
           decoration: BoxDecoration(
             boxShadow: [
               BoxShadow(
                 color: Colors.grey.withOpacity(0.3),
                 offset: Offset(10,10),
                 blurRadius: 20,
                 spreadRadius: 5
               )
             ]
           ),
           child: Stack(
             children: <Widget>[
               CircleAvatar(
                 radius: 45.0,
                 backgroundColor: Colors.grey.withOpacity(0.5),
                 backgroundImage: AssetImage('assets/woman.jpg'),
               ),
               Positioned(
                 bottom: 0.0,
                 right: 0.0,
                 child: Container(
                    height: 29.0,
                    width: 29.0,
                    child: Icon(Icons.fastfood,color: Colors.pink,size: 18.0,),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                 ),
               )
             ],
           ),
         ),
         SizedBox(height: 25.0,),
         Text(
           'Chloé Hannouille',
           style: TextStyle(
             color: Colors.blueGrey,
             fontSize: 25.0
           ),
         ),
         SizedBox(height: 10.0,),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Icon(Icons.edit_location,color: Colors.grey,),
             Text(
               'Madrid-Spain',
               style: TextStyle(
                 color: Colors.grey
               ),
             )
           ],
         )
      ],
    );
  }


  Widget _buildFollowUser(){
    return Material(
      elevation: 0.5,
      child: Container(
        height: 100.0,
        width: double.infinity,
        color: Colors.grey.withOpacity(0.06),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
             _buildColumnFollow('121K','Followers'),
            _buildColumnFollow('152','Following'),
            _buildColumnFollow('455','Taste Maker'),
          ],
        ),
      ),
    );
  }


  Widget _buildColumnFollow(String number, String text){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          number,
          style: TextStyle(
            color: Colors.pink,
            fontSize: 17.0,
            fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(height: 5,),
        Text(
          text,
          style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0
          ),
        ),
      ],
    );
  }


  Widget _buildTabs(){
    return TabBar(
      labelStyle: TextStyle(
         fontWeight: FontWeight.bold,
          fontSize: 18.0
      ),
      unselectedLabelStyle: TextStyle(
         fontWeight: FontWeight.normal,
         fontSize: 17.0
      ),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.transparent,
      tabs: [
        Tab(child: Text('My Restaurants'),),
        Tab(child: Text('My Wishlit'),),
      ],
    );
  }


  Widget _buildGrid(){
      return Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
        child: GridView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 30.0
          ),
          children: <Widget>[
            _buildItem('assets/berries.jpg','Tropical fruits',4),
            _buildItem('assets/almonds.jpg','Orange fruits',3),
            _buildItem('assets/oranges.jpg','Breakfast Dine',5),
            _buildItem('assets/tropic.jpg','Springfield',5),
            _buildItem('assets/almonds.jpg','Almonds fruits',4),
            _buildItem('assets/berries.jpg','Tropical fruits',2),
          ],
        ),
      );
  }


  Widget _buildItem(String pathImage, String title, int rating){
     return Container(
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(5.0),
             boxShadow: [
               BoxShadow(
                   color: Colors.grey.withOpacity(0.1),
                   offset: Offset(1,5),
                   blurRadius: 8,
                   spreadRadius: 3
               ),
             ]
         ),
         padding: EdgeInsets.only(left:10.0,right: 10.0,top: 15.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Stack(
               children: <Widget>[
                 Container(
                   height: 110,
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(5.0),
                     child: Image.asset(
                       pathImage,
                       fit: BoxFit.cover,
                     ),
                   ),
                 ),
                 Positioned(
                   right: 5.0,
                   bottom: 8.0,
                   child: Container(
                     padding: EdgeInsets.all(8.0),
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       shape: BoxShape.circle,
                     ),
                     child: Row(
                       children: <Widget>[
                         Text('${rating.toString()}',style: TextStyle(color: Colors.pink,fontSize: 10.5),),
                         Icon(Icons.star,color: Colors.pink,size: 11.0,)
                       ],
                     ),
                   ),
                 )
               ],
             ),
             SizedBox(height: 15.0,),
             Text(
               title,
               style: TextStyle(
                 fontWeight: FontWeight.w700,
                 fontSize: 16.0
               ),
             ),
             SizedBox(height: 8.0,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                   Text(
                     'Greyish day',
                     style: TextStyle(
                       fontSize: 12.0,
                       color: Colors.grey
                     ),
                   ),
                   Text(
                     '20-05-18',
                     style: TextStyle(
                       fontSize: 12.0,
                       color: Colors.grey
                   ),)
                ],
             )
           ],
         ),
     );
  }
}
