



import 'dart:convert';

import 'package:clean_architecture_idea_app/core/errors/exceptions.dart';
import 'package:clean_architecture_idea_app/core/services/api/api_consumer.dart';
import 'package:http/http.dart' as http;


class HttpConsumer implements ApiConsumer
{



  @override
  Future<dynamic> get(String path, {Object? data, Map<String,String>? headers}) async
  {
    try
    {
       final response= await http.get(Uri.parse(path),headers: headers);
       if(response.statusCode>=200 && response.statusCode<300)
         {
           return response.body;
         }
       else
         {
           throw ServerException(message: 'Error ${response.statusCode} ${response.body}');
         }
     } catch (e)
    {
      throw ServerException(message: e.toString());
    }



  }

  @override
  Future<dynamic> patch(String path, {Object? data, Map<String,String>? headers, bool isFormData = false}) async {

    try
    {
      final response= await http.patch(Uri.parse(path), body: jsonEncode(data),headers: headers);
      if(response.statusCode>=200 && response.statusCode<300)
        {
          return response.body;
        }
      else
        {
          throw ServerException(message: 'Error ${response.statusCode} ${response.body}');
        }
    }
    catch (e)
    {
      throw ServerException(message: e.toString());
    }

  }

  @override
  Future<dynamic> post(String path, {Object? data, Map<String,String>? headers, bool isFormData = false})  async
  {
    try
    {
      final response= await http.post(Uri.parse(path),body: jsonEncode(data),headers: headers);
      if(response.statusCode>=200 && response.statusCode<300)
      {
        return response.body;
      }
      else
      {
        throw ServerException(message: 'Error ${response.statusCode} ${response.body}');
      }
    }
    catch (e)
    {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<String> put(String path, {Object? data, Map<String, String>? headers, bool isFormData = false}) async {

    try
    {
      final response= await http.put(Uri.parse(path),body: jsonEncode(data),headers: headers);
      if(response.statusCode>=200 && response.statusCode<300)
      {
        return response.body;
      }
      else
      {
        throw ServerException(message: 'Error ${response.statusCode} ${response.body}');
      }
    }
    catch (e)
    {
      throw ServerException(message: e.toString());
    }

  }

  @override
  Future<String> delete(String path, {Object? data, Map<String, String>? headers, bool isFormData = false}) async
  {
    try
    {
      final response= await http.delete(Uri.parse(path),body: jsonEncode(data),headers: headers);
      if(response.statusCode>=200 && response.statusCode<300)
      {
        return response.body;
      }
      else
      {
        throw ServerException(message: 'Error ${response.statusCode} ${response.body}');
      }
    }
    catch (e)
    {
      throw ServerException(message: e.toString());
    }
  }



}