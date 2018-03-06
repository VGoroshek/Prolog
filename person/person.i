% Copyright

interface person
    open core

properties
    id : unsigned.
    %тут никогда не инициализируем
    name : string.
    titul : string.
    sex : string.
    fatherId : unsigned.
    motherId : unsigned.
    spouseId : unsigned.
    birthYear : integer.
    deathYear : integer.
    pictures : string*.
    biogr : string*.

end interface person
