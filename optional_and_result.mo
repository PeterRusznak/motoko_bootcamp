import Result "mo:base/Result";
import Option "mo:base/Option";

actor {
  stable var state = 0;
  
  public query func always_return_a_nat(n : ?Nat) : async Nat {
        return(Option.get(n, 999))
  };
  
  
  let names : [(Nat,Text)] = [(0,"Motoko"), (1,"Rust"), (2,"JavaScript")];
  public query func find_name(name : Text) : async ?Nat {
      for((index, language) in names.vals()){
          if (language == name){
              return ?index;
          };
      };
      return null; // We haven't found any match so we return null.
  };


   
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

