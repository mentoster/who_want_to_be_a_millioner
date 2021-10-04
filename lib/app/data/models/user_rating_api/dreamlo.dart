import 'package:flutter/foundation.dart';

import 'leaderboard.dart';

@immutable
class Dreamlo {
	final Leaderboard? leaderboard;

	const Dreamlo({this.leaderboard});

	@override
	String toString() => 'Dreamlo(leaderboard: $leaderboard)';

	factory Dreamlo.fromJson(Map<String, dynamic> json) => Dreamlo(
				leaderboard: json['leaderboard'] == null
						? null
						: Leaderboard.fromJson(json['leaderboard'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'leaderboard': leaderboard?.toJson(),
			};
}
