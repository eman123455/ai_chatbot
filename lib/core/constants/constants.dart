import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
	static const String geminiBaseUrl =
			'https://generativelanguage.googleapis.com';
	static const String geminiModel = 'gemini-3.8-flash';
	static  String geminiApiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
	
}