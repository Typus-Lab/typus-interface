// Copyright (c) Typus Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

/// Similar to `sui::linked_table` but the values are stored by dynamic_object_field
module typus::linked_object_table {

    #[allow(unused)]
    public struct LinkedObjectTable<K: copy + drop + store, phantom V: key + store> has key, store {
        /// the UID for Node storage
        id: UID,
        /// the UID for value storage
        vid: UID,
        /// the number of key-value pairs in the table
        size: u64,
        /// the front of the table, i.e. the key of the first entry
        head: Option<K>,
        /// the back of the table, i.e. the key of the last entry
        tail: Option<K>,
    }

}