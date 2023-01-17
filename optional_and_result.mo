import Result "mo:base/Result";

actor {
  stable var state = 0;


   
  public func greetOptional(optionalName : ?Text) : async Text {
    switch (optionalName) {
      case (null) { 
        return "No name to be found." ;
      };
      case (?name) { 
      return  "Hello, " # name # "!"; 
      };
    };
  };
//assert(greetOptional(?"Dominic") == "Hello, Dominic!");
//assert(greetOptional(null) ==  "No name to be found");


//assert(greetResult(#ok("Dominic")) == "Hello, Dominic!");
//assert(greetResult(#err("404 Not Found")) == "No name: 404 Not Found");
public func greetResult(resultName : Result.Result<Text, Text>) : async Text {
  switch (resultName) {
    case (#err(error)) { "No name: " # error };
    case (#ok(name)) { "Hello, " # name };
  };
};

};

