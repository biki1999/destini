import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'story_brain.dart';

void main()=> runApp(Destini());

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage()
    );
  }
}

class StoryPage extends StatefulWidget{
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain storyBrain= StoryBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(storyBrain.getStory(),
                            style: TextStyle(fontSize: 25)),
                      )
                  )
              ),
              Expanded(
                child: ElevatedButton(onPressed: (){
                 setState(() {
                   storyBrain.nextStory(1);
                 });
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)
                      )
                    ),
                    child: Text(storyBrain.getChoice1(),
                      style: TextStyle(fontSize: 20,color: Colors.white))
                ),
              ),
              SizedBox(height: 15,),
              Expanded(
                child: Visibility(
                  visible: storyBrain.buttonShouldVisible(),
                  child: ElevatedButton(onPressed: (){
                    setState(() {
                      storyBrain.nextStory(2);
                    });
                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)
                          )
                      ),
                      child: Center(
                          child: Text(storyBrain.getChoice2(),
                              style: TextStyle(fontSize: 20,color: Colors.white))
                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}