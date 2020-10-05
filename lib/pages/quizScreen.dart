import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'quizSubmission.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<bool> fosterParentIsSelected = [false, false],
      experienceIsSelected = [false, false];

  FocusNode fosterFocusNode = FocusNode();
  FocusNode enjoyNatureFocusNode = FocusNode();
  FocusNode catsOrDogsFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 72,
            ),
            Center(child: Text("Quiz", style: TextStyle(fontSize: 32))),
            SizedBox(
              height: 32,
            ),
            OptionsBasedQuestion(
                isSelected: [false, false],
                questionAsked: "Have you been a foster parent before?",
                optionOne: "Yes",
                optionTwo: "No"),
            SizedBox(
              height: 20,
            ),
            OptionsBasedQuestion(
                isSelected: [false, false],
                questionAsked:
                    "Do you have experience in all pets at our facility?",
                optionOne: "Yes",
                optionTwo: "No"),
            SizedBox(
              height: 20,
            ),
            OptionsBasedQuestion(
                isSelected: [false, false],
                questionAsked: "Have you volunteered with us?",
                optionOne: "I have",
                optionTwo: "I haven't"),
            SizedBox(
              height: 20,
            ),
            OptionsBasedQuestion(
                isSelected: [false, false],
                questionAsked: "Do you live in a house or an apartment?",
                optionOne: "House",
                optionTwo: "Apartment"),
            SizedBox(
              height: 20,
            ),
            OptionsBasedQuestion(
                isSelected: [false, false],
                questionAsked: "Do you have any pets already?",
                optionOne: "I do",
                optionTwo: "I don't"),
            SizedBox(
              height: 20,
            ),
            OptionsBasedQuestion(
                isSelected: [false, false],
                questionAsked: "Are you an introvert or an extrovert?",
                optionOne: "Introvert",
                optionTwo: "Extrovert"),
            SizedBox(
              height: 32,
            ),
            SliderBasedQuestion(),
            SizedBox(
              height: 32,
            ),
            TextBasedQuestion(
                questionAsked: "Why do you want to foster/adopt?",
                focusNode: fosterFocusNode,
                nextFocusNode: enjoyNatureFocusNode,
                hintText: 'I want to foster/adopt because...'),
            SizedBox(
              height: 20,
            ),
            TextBasedQuestion(
              questionAsked: "Do you enjoy nature? Explain",
              focusNode: enjoyNatureFocusNode,
              nextFocusNode: catsOrDogsFocusNode,
              hintText: 'Nature brings peace and ...',
            ),
            SizedBox(
              height: 20,
            ),
            TextBasedQuestion(
                questionAsked:
                    "Do you have experience in dogs or cats or both?",
                focusNode: catsOrDogsFocusNode,
                hintText: 'I have ...',
                nextFocusNode: null),
            SizedBox(
              height: 32,
            ),
            Center(
              child: CupertinoButton(
                  color: Colors.red,
                  child: Text("Submit"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                QuizAnswerSubmission()));
                  }),
            ),
            SizedBox(
              height: 64,
            ),
          ],
        ),
      ),
    );
  }
}

class TextBasedQuestion extends StatelessWidget {
  final FocusNode focusNode, nextFocusNode;
  final String questionAsked, hintText;

  TextBasedQuestion(
      {@required this.focusNode,
      @required this.nextFocusNode,
      @required this.questionAsked,
      @required this.hintText});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          Text(
            this.questionAsked,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: controller,
            focusNode: this.focusNode,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onEditingComplete: () {
              this.focusNode.unfocus();
              if (this.nextFocusNode != null) {
                FocusScope.of(context).requestFocus(this.nextFocusNode);
              }
            },
            textInputAction: this.nextFocusNode == null
                ? TextInputAction.done
                : TextInputAction.next,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Answer',
                hintText: this.hintText),
          ),
          SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}

class SliderBasedQuestion extends StatefulWidget {
  @override
  _SliderBasedQuestionState createState() => _SliderBasedQuestionState();
}

class _SliderBasedQuestionState extends State<SliderBasedQuestion> {
  double currentSliderValue = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "How long do you want to foster?",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          child: Slider(
              value: currentSliderValue,
              min: 2,
              divisions: 58,
              max: 60,
              onChanged: (double value) {
                setState(() {
                  currentSliderValue = value;
                });
              }),
        ),
        Text(
          currentSliderValue.round().toString() + " days",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}

class OptionsBasedQuestion extends StatefulWidget {
  final String questionAsked, optionOne, optionTwo;
  final List<bool> isSelected;
  OptionsBasedQuestion(
      {@required this.isSelected,
      @required this.questionAsked,
      @required this.optionOne,
      @required this.optionTwo});

  @override
  _OptionsBasedQuestionState createState() => _OptionsBasedQuestionState();
}

class _OptionsBasedQuestionState extends State<OptionsBasedQuestion> {
  List<bool> isSelect;

  @override
  void initState() {
    super.initState();
    isSelect = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(widget.questionAsked, style: TextStyle(fontSize: 18)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: ToggleButtons(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  widget.optionOne,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  widget.optionTwo,
                  style: TextStyle(fontSize: 15),
                ),
              )
            ],
            onPressed: (int index) {
              for (var i = 0; i < isSelect.length; i++) {
                isSelect[i] = false;
              }
              setState(() {
                isSelect[index] = true;
              });
            },
            isSelected: isSelect,
          ),
        )
      ],
    );
  }
}
