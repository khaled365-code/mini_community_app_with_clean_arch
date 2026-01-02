



import 'dart:convert';

import 'package:clean_architecture_idea_app/core/errors/exceptions.dart';
import 'package:clean_architecture_idea_app/core/services/api/api_consumer.dart';
import 'package:http/http.dart' as http;


class HttpConsumer implements ApiConsumer
{

  @override
  Future<dynamic> delete(String path, {Object? data, Map<String, dynamic>? queryParams, bool isFormData = false}) async {
    try
    {
      final response= await http.delete(Uri.parse(path),body: jsonEncode(data));
      return response.body;
    } catch (e)
    {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<dynamic> get(String path, {Object? data, Map<String, dynamic>? queryParams}) async
  {
    try
    {
      final response= await http.get(Uri.parse(path));
      return response.body;
    } catch (e)
    {
      throw ServerException(message: e.toString());
    }


  }

  @override
  Future<dynamic> patch(String path, {Object? data, Map<String, dynamic>? queryParams, bool isFormData = false}) async {
    try
    {
      final response= await http.patch(Uri.parse(path),body: jsonEncode(data));
      return response.body;
    } catch (e)
    {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<dynamic> post(String path, {Object? data, Map<String, dynamic>? queryParams, bool isFormData = false})  async
  {
    try
    {
      final response= await http.post(Uri.parse(path),body: jsonEncode(data));
      return response.body;
    } catch (e)
    {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<dynamic> put(String path, {Object? data, Map<String, dynamic>? queryParams, bool isFormData = false}) async {
    try
    {
      final response= await http.put(Uri.parse(path),body: jsonEncode(data));
      return response.body;
    } catch (e)
    {
      throw ServerException(message: e.toString());
    }
  }




}