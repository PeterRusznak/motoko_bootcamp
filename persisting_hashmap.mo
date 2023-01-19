import HashMap "mo:base/HashMap";
import Principal    "mo:base/Principal";
import Text "mo:base/Text";
import Iter "mo:base/Iter";

actor MyActor {

  stable var entries : [(Text, Nat)] = [];

  let map = HashMap.fromIter<Text,Nat>(
    entries.vals(), 10, Text.equal, Text.hash);

  public func register(name : Text) : async () {
    switch (map.get(name)) {
      case null  {
        map.put(name, map.size());
      };
      case (?id) { };
    }
  };

  public query func seeAll(): async [(Text, Nat)]{
    Iter.toArray(map.entries());
  };

  system func preupgrade() {
    entries := Iter.toArray(map.entries());
  };

  system func postupgrade() {
    entries := [];
  };
}
