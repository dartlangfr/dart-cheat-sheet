library component.rating;

import 'package:angular/angular.dart';

@Component(selector: 'rating', templateUrl: 'rating_component.html', cssUrl: 'rating_component.css', map: const {
  'rating': '<=>rating',
  'max-rating': '=>maxRating'
})
class RatingComponent {
  List<bool> stars = new List.generate(5, (i) => i + 1);

  int rating;
  int maxRating;
}
