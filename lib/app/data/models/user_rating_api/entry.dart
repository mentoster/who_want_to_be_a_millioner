import 'package:flutter/foundation.dart';

@immutable
class Entry {
	final String? name;
	final String? score;
	final String? seconds;
	final String? text;
	final String? date;

	const Entry({this.name, this.score, this.seconds, this.text, this.date});

	@override
	String toString() {
		return 'Entry(name: $name, score: $score, seconds: $seconds, text: $text, date: $date)';
	}

	factory Entry.fromJson(Map<String, dynamic> json) => Entry(
				name: json['name'] as String?,
				score: json['score'] as String?,
				seconds: json['seconds'] as String?,
				text: json['text'] as String?,
				date: json['date'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'score': score,
				'seconds': seconds,
				'text': text,
				'date': date,
			};
}
