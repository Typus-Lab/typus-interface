// Copyright (c) Typus Labs, Inc.
// SPDX-License-Identifier: Apache-2.0
#[allow(unused)]
module typus::utility {
    use sui::balance::Balance;

    public fun transfer_balance_opt<TOKEN>(balance_opt: Option<Balance<TOKEN>>, user: address, ctx: &mut TxContext) {
        abort 0
    }
}