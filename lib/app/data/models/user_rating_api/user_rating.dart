import 'package:flutter/foundation.dart';

import 'dreamlo.dart';

@immutable
class UserRating {
	final Dreamlo? dreamlo;

	const UserRating({this.dreamlo});

	@override
	String toString() => 'UserRating(dreamlo: $dreamlo)';

	factory UserRating.fromJson(Map<String, dynamic> json) => UserRating(
				dreamlo: json['dreamlo'] == null
						? null
						: Dreamlo.fromJson(json['dreamlo'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'dreamlo': dreamlo?.toJson(),
			};
}
