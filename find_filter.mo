import Nat "mo:base/Nat";
import Option "mo:base/Option";
import Bool "mo:base/Bool";
import Array "mo:base/Array";

actor Fufu {

public query func find(arg : [Nat]) : async ?Nat {
  return Array.find<Nat>(arg,func x = x > 8  );
};

public query func findAll(arg : [Nat]) : async [Nat] {
  return Array.filter<Nat>(arg,func x = x > 8  );
};

};
