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
        title: Text("Instagram"),
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
                  child: Text(item.id,overflow: TextOverflow.fade,)
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
              height: 450,
              width: double.infinity,
              color: Colors.red,
        );
    }
  }
