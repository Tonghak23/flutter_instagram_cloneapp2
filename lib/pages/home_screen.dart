import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_cloneapp2/models/Post.dart';

  class HomeScreen extends StatefulWidget {
    @override
    _HomeScreenState createState() => _HomeScreenState();
  }
  class _HomeScreenState extends State<HomeScreen> {
    @override
    Widget build(BuildContext context) {
      return CustomScrollView(
        slivers: [
          _buildAppbar(),
          // _buildStoryList(),
          _buildStory(),
          _buildSliverList(),
        ],
      );
    }
    _buildAppbar() {
      return SliverAppBar(
        backgroundColor: Color.fromRGBO(203, 73, 101, 1.0),
        elevation: 5,
        leading: Icon(Icons.camera_alt_rounded),
        title: Text("Instagram",style: TextStyle(fontFamily: 'Ubuntu-Medium'),),
        actions: [
          IconButton(icon: Icon(Icons.live_tv),onPressed: (){},),
          IconButton(icon: Icon(Icons.near_me_outlined),onPressed: (){},),
        ],
      );
    }
    // _buildStoryList() {
    //     return SliverList(
    //       delegate: SliverChildBuilderDelegate((context,index){
    //         return _buildStoryItem(postList[index]);
    //     },childCount: postList.length),);
    // }
    _buildStory() {
      return SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                        return _buildStoryItem(postList[index]);
                    }
                ),
              ),
      );
    }
    _buildStoryItem(Post item) {
        return Container(
          height: 120,
          width: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCircleImage(item.img),
              SizedBox(height: 4,),
              Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 20,
                  child: Text(item.id,overflow: TextOverflow.fade,style: TextStyle(fontFamily: 'Ubuntu-Medium'),)
              ),
            ],
          ),
        );
    }
    _buildCircleImage(String img) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 78,
              width: 78,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                            Colors.pink,
                            Colors.white70],
                  ),
              ),
            ),
            Container(
              width: 70,
              height: 70,
                child: Container(
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                  image: CachedNetworkImageProvider(img),
                  fit: BoxFit.cover
              ),
            ),
          ),
        ),
          ],
        );
    }

    _buildSliverList() {
        return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildListItem(mainPostList[index]);
            },childCount: mainPostList.length),
        );
    }
    _buildListItem(Post item) {
        return Container(
              margin: EdgeInsets.all(6),
              height: 550,
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  _buildItemProfile(item),
                  _buildItemPost(item.img),
                  _buildItemMenu(),
                ],
              ),
        );
    }
    _buildItemProfile(Post item) {
        return Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Container(
                    width: 250,
                    child: Row(
                      children: [
                        _buildCircleProfileImage(item.img),
                        SizedBox(width: 5,),
                        Text(item.id,style: TextStyle(fontSize: 16,fontFamily: 'Ubuntu-Medium'),),
                      ],
                    ),
                  ),
                  IconButton(icon: Icon(Icons.more_horiz,size: 30,),onPressed: (){}),
              ],
            ),
        );
    }
    _buildCircleProfileImage(String img) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.pink,
                  Colors.white70],
              ),
            ),
          ),
          Container(
            width: 55,
            height: 55,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: CachedNetworkImageProvider(img),
                    fit: BoxFit.cover
                ),
              ),
            ),
          ),
        ],
      );
    }
    //Item Post
    _buildItemPost(String img) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 420,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: img,
            placeholder: (context, url) => Container(color: Colors.white,),
            errorWidget: (context, err, url) => Container(color: Colors.blueGrey,),
          ),
        );
    }
    _buildItemMenu() {
        return Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      IconButton(icon: Icon(Icons.favorite_border,size: 30,),onPressed: (){}),
                      SizedBox(width: 10,),
                      IconButton(icon: Icon(Icons.message,size: 30,),onPressed: (){}),
                      SizedBox(width: 10,),
                      IconButton(icon: Icon(Icons.send,size: 30,),onPressed: (){}),
                    ],
                  ),
                ),
                IconButton(icon: Icon(Icons.bookmark_border_outlined,size: 30,),onPressed: (){}),
              ],
            ),
        );
    }
  }
