// Copyright (c) Typus Labs, Inc.
// SPDX-License-Identifier: Apache-2.0
module typus::big_vector {
    use std::type_name::{TypeName};

    #[allow(unused)]
    public struct BigVector has key, store {
        /// the ID of the BigVector
        id: UID,
        /// the element type of the BigVector
        element_type: TypeName,
        /// the latest index of the Slice in the BigVector
        slice_idx: u64,
        /// the max size of each Slice in the BigVector
        slice_size: u32,
        /// the length of the BigVector
        length: u64,
    }
}