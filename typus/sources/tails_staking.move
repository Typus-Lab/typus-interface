module typus::tails_staking {

    use sui::object_table::{ObjectTable};
    use sui::bag::{Bag};
    use std::type_name::{TypeName};
    use sui::transfer_policy::{TransferPolicy};

    use typus::big_vector::{BigVector};
    use typus_nft::typus_nft::{Tails, ManagerCap as TailsManagerCap};

    #[allow(unused)]
    public struct TailsStakingRegistry has key {
        id: UID,
        config: vector<u64>,
        tails_manager_cap: TailsManagerCap,
        tails: ObjectTable<address, Tails>,
        tails_metadata: Bag,
        staking_infos: BigVector,
        profit_assets: vector<TypeName>,
        transfer_policy: TransferPolicy<Tails>,
    }
}