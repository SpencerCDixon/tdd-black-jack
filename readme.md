## Dan's Feedback:
- Person is an awkward class name, and does not necessarily pass the "is a" test for inheritance (a
  dealer could arguably be a machine)
- the responsiblity of the player aspect of the dealer as well as the dealing functionality is
  confused. I would qualify this as a violation of SRP. Consider a `Dealing` or `Deal` class that
  distributes the cards amongst an array of players (inclusive of the dealer). To represent the real
  world metaphor, a Dealer can exist without a deck (they could be waiting for a new deck from the
  pit boss)
- Hand Summary should be a responsibility of the Hand class (SRP violation and demeter violation)aT
- The player instance methods prompting for input should be separate classes. Consider a
  `PlayerPrompt` or similar abstraction to separate "view" logic from business logic
- your total score class operates on 3(O(n)) when it could operate in linear efficiency
- the value of the card is a responsibility outside of the `Card` abstraction. By definition, a
  `Card` should encapsulate only the state of having a rank and a suit. The BlackJack score / point
  value is an additional responsibilty that belongs elsewhere. You could have a `PointCalculation`
  class that takes a hand and outputs the score.
- `build_deck` in the `Deck` class should either be private or just have the implementation in the
  constructor. If I invoke `build_deck` multiple times, I would lose the state of my current deck,
  which is unintuitive as an instance method.
- Your `Game` class encapsulates too much and violates SRP. Extract `Round`, `DealerTurn`, and
  `PlayerTurn` to their own abstractions. If we're being really pedantic, you could also have a
  `WinDetermination` abstraction as well.
- I always try to observe controller/model behavior in my terminal apps. You should not have
  business logic and a `gets` or `puts` invocation in the same level of abstraction. You could
  consider a decorator or view class for all of that.
- `Game` and `Hand` are all generalized, but they are specific to a particular game. Consider
  namespacing these or all classes under a `Blackjack` namespace.

## Testing Feedback:
- each `it` should assert one thing. I would have separate behaviors for each face card's value. For
  some reason (illogical at that), I find the numeric assertion to be ok
- you cannot actually assert it "shuffles deck aftering being built" do
      first_cards = deck.cards[0..1].map { |c| c.to_s }
      expect(first_cards).to_not eq ['2♦', '3♦']
    end -> this could fail in highly unprobable circumstances, but we always endeavor to make tests
  entirely determinstic
- some of your tests require access to attributes you may not want to expose. For example, you
  should not able to access each individual card in the deck. You should only be able to draw. A
  better assertion here would be to assert that the card drawn is never found in the deck. (Draw 51
  more times and assert that the deck does not contain a duplicate)
- you have some redundancies in your tests around testing a Card's value vs. testing a Hand's value
- To me, having the Person class introspect the hand to get to cards is a demeter violation. I'm not
  sure how the Person adds value to this function. Consider composing a hand of both a player and a
  hand
