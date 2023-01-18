actor {

    let is_array_size_even = func <T>(array : [T]) : Bool {
        let size = array.size();
        if (size % 2 == 0) {
            return true;
        } else {
            return false;
        };
    };

    public query func nat_arr_size_even(array : [Nat]) : async Bool {
        return is_array_size_even<Nat>(array);
    };

    public query func text_arr_size_even(array : [Text]) : async Bool {
        return is_array_size_even<Text>(array);
    };

};
