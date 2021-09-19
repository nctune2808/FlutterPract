class CounterState {
  final int counter;
  const CounterState({required this.counter});
  factory CounterState.initial() => CounterState(counter: 0);
}
