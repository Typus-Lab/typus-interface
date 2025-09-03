// Copyright (c) Typus Labs, Inc.
// SPDX-License-Identifier: Apache-2.0
module typus::keyed_big_vector {

    use std::type_name::{TypeName};

    #[allow(unused)]
    public struct KeyedBigVector has key, store {
        /// the ID of the KeyedBigVector
        id: UID,
        /// the key type of the KeyedBigVector
        key_type: TypeName,
        /// the element type of the KeyedBigVector
        value_type: TypeName,
        /// the latest index of the Slice in the KeyedBigVector
        slice_idx: u16,
        /// the max size of each Slice in the KeyedBigVector
        slice_size: u32,
        /// the length of the KeyedBigVector
        length: u64,
    }
}