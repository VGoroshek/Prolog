% Copyright

implement person
    open core

facts
    id : unsigned.
    %тут никогда не инициализируем
    name : string := "".
    titul : string := "".
    sex : string := "м".
    fatherId : unsigned := 0.
    motherId : unsigned := 0.
    spouseId : unsigned := 0.
    birthYear : integer := 0.
    deathYear : integer := 0.
    pictures : string* := [].
    biogr : string* := [].

clauses
    new(Id) :-
        id := Id.

end implement person
