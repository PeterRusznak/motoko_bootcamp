# motoko_examples

dfx canister call crud create '(
    record {
    title = "Zoli";
    description = "SANYI";
    userPrincipal = principal "'$(dfx identity get-principal)'";
  },
)'
