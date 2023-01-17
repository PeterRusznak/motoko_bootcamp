import Result "mo:base/Result";

actor {
 
  
    //let array : [Nat] = [1, 2, 3, 4, 5];

    public query func somme_array(arr : [Nat]) : async Nat {
        
        var somme : Nat = 0;
        for (value in arr.vals()){
          somme := somme + value;
        };
       return somme; 
    };



};
