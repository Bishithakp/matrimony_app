// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  bool isFavorite;
    int userId;
    String username;
    String email;
    String profilePic;
    String bio;
    String? homepage;
    List<String> hobbies;
    String fullName;
    String location;
    String? birthDate;
    int followersCount;
    int followingCount;
    int postsCount;
    DateTime joinedDate;
    bool verifiedStatus;
    List<String> languages;
    String? education;
    String? work;
    String relationshipStatus;
    String gender;
    Pronouns pronouns;
    List<String> interests;
    String coverPhoto;
    PrivacySettings privacySettings;
    String lastActive;
    String statusMessage;
    ContactInfo contactInfo;
    List<CustomField> customFields;

    UserModel({
       this.isFavorite=false,
        required this.userId,
        required this.username,
        required this.email,
        required this.profilePic,
        required this.bio,
        this.homepage,
        required this.hobbies,
        required this.fullName,
        required this.location,
        this.birthDate,
        required this.followersCount,
        required this.followingCount,
        required this.postsCount,
        required this.joinedDate,
        required this.verifiedStatus,
        required this.languages,
        this.education,
        this.work,
        required this.relationshipStatus,
        required this.gender,
        required this.pronouns,
        required this.interests,
        required this.coverPhoto,
        required this.privacySettings,
        required this.lastActive,
        required this.statusMessage,
        required this.contactInfo,
        required this.customFields,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        username: json["username"],
        email: json["email"],
        profilePic: "https://c.wallhere.com/photos/a7/88/Lidia_Savoderova_model_face_profile_women_brunette_brown_eyes_ponytail-1215675.jpg!d",
        //json["profilePic"],
        bio: json["bio"],
        homepage: json["homepage"],
        hobbies: List<String>.from(json["hobbies"].map((x) => x))==null?[]:List<String>.from(json["hobbies"].map((x) => x)),
        fullName: json["fullName"],
        location: json["location"],
        birthDate: json["birthDate"]==null?'': json["birthDate"],
        followersCount: json["followersCount"],
        followingCount: json["followingCount"],
        postsCount: json["postsCount"],
        joinedDate: DateTime.parse(json["joinedDate"]),
        verifiedStatus: json["verifiedStatus"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        education: json["education"],
        work: json["work"]==null?'':json["work"],
        relationshipStatus: json["relationshipStatus"],
        gender:json["gender"],
        pronouns: pronounsValues.map[json["pronouns"]]!,
        interests: List<String>.from(json["interests"].map((x) => x)),
        coverPhoto: json["coverPhoto"],
        privacySettings: PrivacySettings.fromJson(json["privacySettings"]),
        lastActive: json["lastActive"],
        statusMessage: json["statusMessage"],
        contactInfo: ContactInfo.fromJson(json["contactInfo"]),
        customFields: List<CustomField>.from(json["customFields"].map((x) => CustomField.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "email": email,
        "profilePic": profilePic,
        "bio": bio,
        "homepage": homepage,
        "hobbies": List<dynamic>.from(hobbies.map((x) => x)),
        "fullName": fullName,
        "location": location,
        "birthDate": birthDate,
        "followersCount": followersCount,
        "followingCount": followingCount,
        "postsCount": postsCount,
        "joinedDate": "${joinedDate.year.toString().padLeft(4, '0')}-${joinedDate.month.toString().padLeft(2, '0')}-${joinedDate.day.toString().padLeft(2, '0')}",
        "verifiedStatus": verifiedStatus,
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "education": education,
        "work": work,
        "relationshipStatus": relationshipStatus,
        "gender": gender,
        "pronouns": pronounsValues.reverse[pronouns],
        "interests": List<dynamic>.from(interests.map((x) => x)),
        "coverPhoto": coverPhoto,
        "privacySettings": privacySettings.toJson(),
        "lastActive": lastActive,
        "statusMessage": statusMessage,
        "contactInfo": contactInfo.toJson(),
        "customFields": List<dynamic>.from(customFields.map((x) => x.toJson())),
    };
}

class ContactInfo {
    String phone;
    String secondaryEmail;

    ContactInfo({
        required this.phone,
        required this.secondaryEmail,
    });

    factory ContactInfo.fromJson(Map<String, dynamic> json) => ContactInfo(
        phone: json["phone"],
        secondaryEmail: json["secondaryEmail"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "secondaryEmail": secondaryEmail,
    };
}

class CustomField {
    String fieldName;
    String fieldValue;

    CustomField({
        required this.fieldName,
        required this.fieldValue,
    });

    factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
        fieldName: json["fieldName"],
        fieldValue: json["fieldValue"],
    );

    Map<String, dynamic> toJson() => {
        "fieldName": fieldName,
        "fieldValue": fieldValue,
    };
}



class PrivacySettings {
    bool showEmail;
    bool showBirthDate;

    PrivacySettings({
        required this.showEmail,
        required this.showBirthDate,
    });

    factory PrivacySettings.fromJson(Map<String, dynamic> json) => PrivacySettings(
        showEmail: json["showEmail"],
        showBirthDate: json["showBirthDate"],
    );

    Map<String, dynamic> toJson() => {
        "showEmail": showEmail,
        "showBirthDate": showBirthDate,
    };
}

enum Pronouns {
    HE_HIM,
    SHE_HER,
    THEY_THEM
}

final pronounsValues = EnumValues({
    "he/him": Pronouns.HE_HIM,
    "she/her": Pronouns.SHE_HER,
    "they/them": Pronouns.THEY_THEM
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
