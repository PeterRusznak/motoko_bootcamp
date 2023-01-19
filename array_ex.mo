actor array_ex{

let imm_val_imm_arr : [Nat] = [1,2,3] // minden immutable
var imm_val_mut_arr :[Nat] = [1,2,3] //a valuek maradnak, de a magát az arrayt ki lehet cserélni.

let mut_val_imm_arr : [var Nat] = [var 1,2,3]; // array marad, a valuet ki lehet cserélni

var mut_val_mut_arr : [var Nat] = [var 1,2,3]; // minden cserélhető

let arr [Nat] = [1,2,3];
arr.vals().size() // igy 

};
