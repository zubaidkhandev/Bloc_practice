import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable{
const CounterEvent();
@override
List<Object> get props=>[];

//Counter Event 
}
class Increment extends CounterEvent{}

class Decrement extends CounterEvent{}

class Reset extends CounterEvent{}