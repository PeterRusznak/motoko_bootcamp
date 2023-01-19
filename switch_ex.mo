import Array "mo:base/Array";

actor switch_ex{
  public query func second_maximum(array : [Int]) : async  Int{
          switch(array.size()) {
          case(1 or 0) {
              return -1; // Not specified what should we return
              };
          case(_) { 
              return Array.reverse(Array.sort(array, Int.compare))[1];
          };
          };    
      };
};
