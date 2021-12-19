import 'package:chat_app/constants/firestore_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserChat {
  String id;
  String photoUrl;
  String nickname;
  String aboutMe;
  String phoneNumber;

  UserChat(
      {required this.id, required this.photoUrl, required this.nickname, required this.aboutMe, required this.phoneNumber});
  Map<String,String>toJson(){
    return{
      FirestoreConstants.nickname:nickname,
      FirestoreConstants.aboutMe:aboutMe,
      FirestoreConstants.phoneNumber:phoneNumber,
      FirestoreConstants.photoUrl:photoUrl,
    };
}
factory UserChat.fromDocument(DocumentSnapshot doc){
    String aboutMe="";
    String nickname="";
    String photoUrl="";
    String phoneNumber="";
    try{
      aboutMe=doc.get(FirestoreConstants.aboutMe);
    }catch(e){}
    try{
      photoUrl=doc.get(FirestoreConstants.photoUrl);
    }catch(e){}
    try{
      phoneNumber=doc.get(FirestoreConstants.phoneNumber);
    }catch(e){}
    try{
      nickname=doc.get(FirestoreConstants.nickname);
    }catch(e){}
    return UserChat(id: doc.id, photoUrl: photoUrl, nickname: nickname, aboutMe: aboutMe, phoneNumber: phoneNumber);
}

}


