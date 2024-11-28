#[allow(unused)]
module typus_framework::vault {
    use std::string::String;

    public struct TypusBidReceipt has key, store {
        id: UID,
        vid: ID,
        index: u64,
        metadata: String,
        u64_padding: vector<u64>,
    }

    public fun transfer_bid_receipt(receipt: Option<TypusBidReceipt>, user: address) {
        abort 0
    }
}