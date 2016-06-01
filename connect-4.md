## Introduction

Let's play a game! Connect 4 is one of our favorites.

In this challenge, you'll create a command line version of Connect 4. If you
don't remember the rules of the game, the implementation notes and user stories
can help guide you.

#### Use the Real World Equivalent

Often software mimics or replaces physical objects and processes. In software
development, and particularly with object oriented languages, we use the concept
of **metaphor** to drive the design of our programs. If you are not familiar
with how the game of Connect 4 works, check out the wiki article on it
[here](https://en.wikipedia.org/wiki/Connect_Four).

### Learning Goals

* Identify the proper data structure for storing the game board.
* Utilize Ruby classes to compartmentalize your program.
* Ideally extract out some classes that represent the flow and state of your
  game.

### User Stories

#### Prompt for player's names

```no-highlight
As a player
I want to enter my name
So that I can be identified throughout the game
```

Acceptance Criteria:

* Each player can enter their name
* The game cannot proceed until they each specify a name
* Each name must be unique

#### Player to select a column

```no-highlight
As a player
I want to drop a piece in a column
So that I can attempt to win the game
```

Acceptance Criteria:

* The player must specify a valid column. If they provide something invalid,
  inform them they must select a valid column and do not drop a game piece.
* When the player specifies a valid column, place their respective game piece in
  the first available row in that column.
* When the player specifies a valid column, it becomes the next players turn.

Validating user input is vital to ensure you have a quality system.
Data anomalies due to bad user data could have disastrous consequences to your
systems and reports. [Garbage In, Garbage Out](http://en.wikipedia.org/wiki/Garbage_in,_garbage_out).

#### Player selects a column that is full

```no-highlight
As a player
I want to know I cannot drop a piece in a full column
So that I can make an effective move
```

Acceptance Criteria:

* When a player selects a column that is full of game pieces (there is no
  available row), they are told that the column is full and they
  are prompted to select another column.

#### Player wins game

```no-highlight
As a player
I want to know I've won the game
So that I can feel accomplished in my victory
```

Acceptance Criteria:

* Upon their turn, if a player drops a piece that makes a vertical or horizontal
  line of 4 of their pieces consecutively, they have won and the game is over.
* Inform the player of their victory, and ask if they want to play again.
* If they want to play again, keep the same players but clear the game board.

#### Stalemate

```no-highlight
As a player
I want to know the game is over when the board is full
So we know the game has ended in a draw
```

Acceptance Criteria:

* When the board is full, meaning all rows and columns are occupied, the game
  is at a stalemate, resulting in a draw.
* Inform the users that the game is a draw, and ask if they want to play again.
* If they want to play again, keep the same players but clear the game board.

### Implementation Notes

You'll want to create a visual representation of the board to show with each
turn. Maybe it will look something like this:

```no-highlight
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
 A B C D E F G H I J
 ```

 When the first player moves and opts for column E it might look like this:

```no-highlight
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|        X          |
 A B C D E F G H I J
 ```

 A player wins the game when they get a line of 4 pieces. Start with supporting
 lines that are vertical and horizontal.

```no-highlight
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|        X          |
|        X          |
|        X          |
|  0 0 0 X          |
 A B C D E F G H I J
 ```

Player X has won the game because of the vertical row of x's.

#### Do the design work!

Think carefully about how you want to structure this program prior to writing it.

* What data structure will you use?
* How will you maintain the players' names and correlate that with their pieces?
* How will you check for when a play has made a line of 4 pieces?

We strongly encourage you to Google "grid data structure" to identify the proper
data structure for the board. Could you use ruby classes to represent the grid
and/or different locations on the game board?

Remember, writing software is more about thinking differently than it is about
code. Really study the game, and make sure you understand how it works.
