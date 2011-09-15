# Fantasy Football League Generator

A small command line utility for randomly breaking your league's teams into divisions and choosing a random draft order.

## Dependencies

    gem install terminal-table

## Usage

Add your team names to `teams.yml` and your division names to `divisions.yml`; so far, this has only been tested for when you have an even number of teams divisible by the number of divisions (e.g. 10 teams in 2 divisions of 5).

Run the program from your command line:

    ruby hike.rb

This will generate a timestamped file in the same directory with your league information looking something like this:

    Divisions
    +-----------------------------+---------------------+
    | Division A                  | Division B          |
    +-----------------------------+---------------------+
    | Ix-Nay on the Heyward-Bey   | Corn on the Schaub  |
    | TDs on my Sanzenbacher      | A River Runs Suh It |
    | Favre Dollar Footlongs      | Victorious Secret   |
    | Dezzie Does Dallas          | Revis and Butthead  |
    | Forgetting Brandon Marshall | Henne Nut Cheerios  |
    +-----------------------------+---------------------+

    Draft Order
    +----------+-----------------------------+
    | Position | Team                        |
    +----------+-----------------------------+
    | 1        | A River Runs Suh It         |
    | 2        | Forgetting Brandon Marshall |
    | 3        | Victorious Secret           |
    | 4        | Ix-Nay on the Heyward-Bey   |
    | 5        | Favre Dollar Footlongs      |
    | 6        | Revis and Butthead          |
    | 7        | Dezzie Does Dallas          |
    | 8        | Henne Nut Cheerios          |
    | 9        | TDs on my Sanzenbacher      |
    | 10       | Corn on the Schaub          |
    +----------+-----------------------------+
