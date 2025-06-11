module typus_perp::admin {

    use std::type_name::{TypeName};
    use sui::vec_set::{VecSet};

    #[allow(unused_field)]
    public struct Version has key {
        id: UID,
        value: u64,
        fee_pool: FeePool,
        liquidator_fee_pool: FeePool,
        authority: VecSet<address>,
        u64_padding: vector<u64>,
    }

    #[allow(unused_field)]
    public struct FeePool has key, store {
        id: UID,
        fee_infos: vector<FeeInfo>,
    }

    #[allow(unused_field)]
    public struct FeeInfo has copy, drop, store {
        token: TypeName,
        value: u64,
    }

}