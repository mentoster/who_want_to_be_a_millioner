import 'package:flutter/foundation.dart';

import 'entry.dart';

@immutable
class Leaderboard {
	final List<Entry>? entry;

	const Leaderboard({this.entry});

	@override
	String toString() => 'Leaderboard(entry: $entry)';

	factory Leaderboard.fromJson(Map<String, dynamic> json) => Leaderboard(
				entry: (json['entry'] as List<dynamic>?)
						?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'entry': entry?.map((e) => e.toJson()).toList(),
			};
}
