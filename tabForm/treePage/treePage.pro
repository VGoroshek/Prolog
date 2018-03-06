% Copyright 

implement treePage
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

% This code is maintained automatically, do not update it manually. 09:44:14-6.3.2018

predicates
    generatedInitialize : ().
clauses
    generatedInitialize() :-
        setText("Деревья"),
        This:setSize(400, 200).
% end of automatic code
end implement treePage