// Copyright (c) Typus Labs, Inc.
// SPDX-License-Identifier: Apache-2.0
#[allow(unused)]
module typus::ecosystem {

    use sui::vec_set::{VecSet};
    use std::type_name::{TypeName};

    #[allow(unused)]
    public struct ManagerCap has store { }

    #[allow(unused)]
    public struct Version has key {
        id: UID,
        value: u64,
        fee_pool: FeePool,
        authority: VecSet<address>,
        u64_padding: vector<u64>,
    }

    #[allow(unused)]
    public struct FeePool has key, store {
        id: UID,
        fee_infos: vector<FeeInfo>,
    }

    #[allow(unused)]
    public struct FeeInfo has copy, drop, store {
        token: TypeName,
        value: u64,
    }
}