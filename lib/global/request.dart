import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/global/Api.dart';
import 'dart:io';

class ApiCall{
  static Future<String> getData(String url, String authorization, String xCenterId) async {

    //url = "http://dev.bygcrm.com/api/v2/webapis/dashboard/revenue?&fromDate=1543602600000&toDate=1546280999999";
    url = "https://jsonplaceholder.typicode.com/posts";
    authorization = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1NDUyMTY2NDMsImlhdCI6MTU0NTEzMDI0MywiaXNzIjoiaHR0cHM6Ly93d3cuYnlnY3JtLmNvbSIsInN1YiI6ImRldmljZSIsInVzZXJJZCI6IjgxOTE2OTc3NDU3MDMyODA2NCIsInVzZXJOYW1lIjoic3Jpbml2YXNAYnlnLmNvLmluIiwiYXBwaWQiOiJkZXZpY2UiLCJhaWQiOiJBQzgxOTE2OTc3NDQ2MTI3NjE2MCIsImNpZCI6WyI4MTkxNjk3NzQ0NjU0NzA0NjQiLCJDTjg0NjIzNzI2MjIwNjIyNjQzMiJdLCJyaWQiOiI4MTkxNjk3NzQ1NjYxMzM3NjIiLCJkb21haW4iOiIiLCJqdGkiOiIzMTk3YmUxZi1mMWI3LTRjODctYWMyNi0wZTJkNWUwOTBkMjgiLCJjZW50ZXJzIjpbeyJjZW50ZXJJZCI6IjgxOTE2OTc3NDQ2NTQ3MDQ2NCIsInJvbGVJZCI6IjgxOTE2OTc3NDU2NjEzMzc2MiJ9LHsiY2VudGVySWQiOiJDTjg0NjIzNzI2MjIwNjIyNjQzMiIsInJvbGVJZCI6Ijg0NjIzNzI2MjIzNTU4NjU2MCJ9XSwiYWNjb3VudElkIjoiQUM4MTkxNjk3NzQ0NjEyNzYxNjAifQ.0s32eq4_yo_xOLB4nBvY4VGuLZOIoUPeIg2GU6wEdPQ";
    xCenterId = "819169774465470464";

    var response = await http.get(
        Uri.encodeFull(url),
        headers: {
          "authorization" : authorization,
          "Accept": "application/json",
          "x-center-id": xCenterId
        }
    );

    return response.body;
  }

  static Future<String> postData(String url, String authorization, String xCenterId) async {

    url = "http://dev.bygcrm.com/api/v1/login/device";
    authorization = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1NDUyMTY2NDMsImlhdCI6MTU0NTEzMDI0MywiaXNzIjoiaHR0cHM6Ly93d3cuYnlnY3JtLmNvbSIsInN1YiI6ImRldmljZSIsInVzZXJJZCI6IjgxOTE2OTc3NDU3MDMyODA2NCIsInVzZXJOYW1lIjoic3Jpbml2YXNAYnlnLmNvLmluIiwiYXBwaWQiOiJkZXZpY2UiLCJhaWQiOiJBQzgxOTE2OTc3NDQ2MTI3NjE2MCIsImNpZCI6WyI4MTkxNjk3NzQ0NjU0NzA0NjQiLCJDTjg0NjIzNzI2MjIwNjIyNjQzMiJdLCJyaWQiOiI4MTkxNjk3NzQ1NjYxMzM3NjIiLCJkb21haW4iOiIiLCJqdGkiOiIzMTk3YmUxZi1mMWI3LTRjODctYWMyNi0wZTJkNWUwOTBkMjgiLCJjZW50ZXJzIjpbeyJjZW50ZXJJZCI6IjgxOTE2OTc3NDQ2NTQ3MDQ2NCIsInJvbGVJZCI6IjgxOTE2OTc3NDU2NjEzMzc2MiJ9LHsiY2VudGVySWQiOiJDTjg0NjIzNzI2MjIwNjIyNjQzMiIsInJvbGVJZCI6Ijg0NjIzNzI2MjIzNTU4NjU2MCJ9XSwiYWNjb3VudElkIjoiQUM4MTkxNjk3NzQ0NjEyNzYxNjAifQ.0s32eq4_yo_xOLB4nBvY4VGuLZOIoUPeIg2GU6wEdPQ";
    xCenterId = "819169774465470464";

    var response = await http.post(
        Uri.encodeFull(url),
        headers: {},
        body: json.encode({
          "password": "byg123",
          "userName": "srinivas@byg.co.in"
        })
    );
    print(response.statusCode.toString());
    return response.body;
  }
}