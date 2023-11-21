import 'package:flutter/material.dart';
import 'package:whatsapp_ui/presentation/manager/color_manager.dart';
import 'package:whatsapp_ui/presentation/manager/info.dart';
import 'package:whatsapp_ui/presentation/widgets/chat_list.dart';
import 'package:whatsapp_ui/presentation/widgets/contact_list.dart';
import 'package:whatsapp_ui/presentation/widgets/web_chat_app_bar.dart';
import 'package:whatsapp_ui/presentation/widgets/web_profile_bar.dart';
import 'package:whatsapp_ui/presentation/widgets/web_search_bar.dart';

class WebLayoutScreen extends StatefulWidget {
  const WebLayoutScreen({Key? key}) : super(key: key);

  @override
  State<WebLayoutScreen> createState() => _WebLayoutScreenState();
}
 var index = 0;
class _WebLayoutScreenState extends State<WebLayoutScreen> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const WebProfileBar(),
                  const WebSearchBar(),
                  ContactsList(
                    onIndexChanged: (nt) {
                      setState(() {
                        index = nt;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: dividerColor),
              ),
              image: DecorationImage(
                image: AssetImage(
                  "assets/backgroundImage.jpeg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                ChatAppBar(
                    name: info[index]['name'].toString(),
                    image: info[index]['profilePic'].toString()),
                const SizedBox(height: 20),
                const Expanded(
                  child: ChatList(),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: dividerColor),
                    ),
                    color: chatBarMessage,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.emoji_emotions_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.attach_file,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 15,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: searchBarColor,
                              hintText: 'Type a message',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              contentPadding: const EdgeInsets.only(left: 20),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.mic,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
