% Copyright

class dbrel : dbrel
    open core

constructors
    new : (string Filename).

properties
    currentDb : optional{dbrel DataMayExistsOrNot}.

end class dbrel
