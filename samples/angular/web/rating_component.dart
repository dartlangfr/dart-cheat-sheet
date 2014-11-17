library component.rating;

import 'package:angular/angular.dart';

// FIXME: publishAs is deprecated
@Component(selector: 'rating', templateUrl: 'rating_component.html', cssUrl: 'rating_component.css', map: const {
  'rating': '<=>rating',
  'max-rating': '=>maxRating'
}, publishAs: 'cmp')
class RatingComponent {
  List<bool> stars = new List.generate(5, (i) => i + 1);

  int rating;
  int maxRating;
}
