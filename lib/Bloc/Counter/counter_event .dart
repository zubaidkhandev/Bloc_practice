import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable{
const CounterEvent();
@override
List<Object> get props=>[];
//Counter Event 
}
class Increament extends CounterEvent{}

class Decreament extends CounterEvent{}