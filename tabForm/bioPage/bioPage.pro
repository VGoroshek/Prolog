% Copyright 

implement bioPage
    inherits userControlSupport
    open core, vpiDomains



clauses
    new(Parent):-
        new(),
        setContainer(Parent).

clauses
    new():-
        userControlSupport::new(),
        generatedInitialize().

% This code is maintained automatically, do not update it manually. 09:11:25-6.3.2018

predicates
    generatedInitialize : ().
clauses
    generatedInitialize() :-
        setText("Биография"),
        This:setSize(400, 200).
% end of automatic code
end implement bioPage