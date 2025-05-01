import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entities/user_model.dart';

class UserRepository {
  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=1'),
      headers: {"x-api-key": "reqres-free-v1"},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> usersJson = data['data'];
      return usersJson.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch users");
    }
  }

  Future<String> updateUser(UserModel updatedUser) async {
    try {
      if (updatedUser.id == null) {
        return "User ID is missing";
      }

      final response = await http.put(
        Uri.parse('https://reqres.in/api/users/2'),
        headers: {
          "Content-Type": "application/json",
          "x-api-key": "reqres-free-v1",
        },
        body: jsonEncode({
          "name": updatedUser.firstName,
          "job": updatedUser.lastName,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("Updated: $data");
        return "Success";
      } else {
        return "Failed to update user";
      }
    } catch (e) {
      print("Error updating user: $e");
      return "Failed";
    }
  }

  Future<String> deleteUser(int userId) async {
    try {
      final response = await http.delete(
        Uri.parse(
            'https://reqres.in/api/users/2'), // You can use userId dynamically
        headers: {
          "x-api-key": "reqres-free-v1",
        },
      );

      print(response.statusCode);
      if (response.statusCode == 204) {
        print("User deleted successfully");
        return "204";
      } else {
        print("Failed to delete user: ${response.body}");
        return "000";
      }
    } catch (e) {
      print("Error deleting user: $e");
      return "000";
    }
  }

  Future<String> createUser(String name, String job) async {
    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/users'),
        headers: {
          "Content-Type": "application/json",
          "x-api-key": "reqres-free-v1",
        },
        body: jsonEncode({
          "name": name,
          "job": job,
        }),
      );

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        print("User created: $data");
        return "Success";
      } else {
        print("Failed to create user: ${response.body}");
        return "Failed";
      }
    } catch (e) {
      print("Error creating user: $e");
      return "Failed";
    }
  }
}
