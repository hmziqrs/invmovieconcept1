import 'dart:isolate';

const String scope = 'ReservationScreen';

const Map strings = {
  '$scope/yourTicket': 'Your Ticket',
  '$scope/bookNow': 'Book Now',
  '$scope/film': 'Film',
  '$scope/date': 'Date',
  '$scope/seats': 'Seats',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
