import 'dart:isolate';

const String scope = 'ReservationScreen';

const Map strings = {
  '$scope/yourTicket': 'Your Ticket',
  '$scope/bookNow': 'Book Now',
  '$scope/film': 'Film',
  '$scope/date': 'Date',
  '$scope/seats': 'Seats',
  '$scope/ok': 'Ok',
  '$scope/myMovies': 'My Movies',
  '$scope/thankYou': 'Thank You',
  '$scope/modalDesc': '"You can check your reservations in My Movies screen""',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
