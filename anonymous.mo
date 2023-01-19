import Principal "mo:base/Principal";

actor{


    // CALL LIKE THIS:
    // dfx canister call hello_backend is_anynomous '("kgiow-g67ch-vr6ii-xxxxx-xxxxxxxx-xxxxxxxxxx-xxxxxx")'
    public shared ({ caller }) func is_anynomous () :async Bool {
      Principal.isAnonymous(caller);
    };

};
