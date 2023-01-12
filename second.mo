import Hashmap "mo:base/HashMap";
import Time "mo:base/Time";
import Result "mo:base/Result";
import Principal "mo:base/Principal";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Bool "mo:base/Bool";



actor {

  public type Time  = Time.Time;
  public type Profile = {
    name : Text;
    age: Nat;
    registration_date: Time;
    premium:Bool;
  };

  let users : Hashmap.HashMap<Principal, Profile>  = Hashmap.HashMap<Principal, Profile>(0, Principal.equal, Principal.hash);

  public shared({caller}) func create_profile(user:Profile): async(){
    users.put(caller, user);
    return;
  };


  public query func read_profile(principal:Principal): async ?Profile{
    return(users.get(principal));
  };


  public shared({caller}) func update_profile(user : Profile):async Result.Result<Text, Text> {
    switch(users.get(caller)){
      case(null) return #err("There is no user for this principal: " #Principal.toText(caller));
      case(?user) {
        users.put(caller, user);
        return #ok("Profile modified for this user with principal: " #Principal.toText(caller));        
      };
    }; 
  };

 public type Country ={ 
  #HUN;
  #MAL;
  #ITA;
 };
 
// dfx canister call second_canister create_profile '(record {name="kingu"; age=45; registration_date = 122443223; premium = false })'
// dfx canister call second_canister read_profile '(principal "kgiow-g67ch-vr6ii-4wtgp-x2dch-pm7st-sscu4-6eu2c-5sy4s-hlrj4-xae")'
// dfx canister call second_canister delete_profile '(principal "kgiow-g67ch-vr6ii-4wtgp-x2dch-pm7st-sscu4-6eu2c-5sy4s-hlrj4-xae")'  
  public shared({caller}) func delete_profile(principal:Principal) : async Result.Result<(), Text>{
    assert(caller == principal);
    switch(users.remove(principal)){
      case(null){
        return #err("There is no profile for user with Principal " #Principal.toText(principal));
      };
      case(?user){
        return #ok();
      };
    };
  };

  public func greet(name : Text) : async Text {
    return "Hello Csanaky , " # name # "!";
  };
};
