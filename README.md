# motoko_examples

dfx canister call crud create '(
    record {
    title = "Zoli";
    description = "SANYI";
    userPrincipal = principal "'$(dfx identity get-principal)'";
  },
)'


How to deploy several canisters:

Backend canister:

´dfx canister --network ic create dao --with-cycles 1000000000000
dfx build --network ic dao
dfx canister --network ic install dao´

which creates canister_ids.json with the following content:
 "dao": {
    "ic": "lcblv-6aaaa-aaaap-aaymq-cai"
  }

Go to connexion.js and find the following: 
 
 //TODO : Add your mainnet id whenever you have deployed on the IC
const daoCanisterId = 
  process.env.NODE_ENV === "development" ? "ryjl3-tyaaa-aaaaa-aaaba-cai" : "lcblv-6aaaa-aaaap-aaymq-cai"

The second value should correspond  to the new created ic value from canister_ids.json

then:

´dfx deploy --network ic assets´  
  
