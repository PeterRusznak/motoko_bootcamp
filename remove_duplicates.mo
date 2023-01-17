import Buffer "mo:base/Buffer";
import Nat "mo:base/Nat";

actor {
 
  public query func name() : async [Nat] {
    var buffer = Buffer.Buffer<Nat>(1);
    buffer.add(1);
    buffer.add(1);
    Buffer.removeDuplicates<Nat>(buffer, Nat.compare);

  return Buffer.toArray(buffer);
    
  };
};
