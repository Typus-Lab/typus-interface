module typus_nft::typus_nft {

    use sui::vec_map::{VecMap};
    use std::string::{String};
    use sui::url::{Url};

    #[allow(unused)]
    public struct Tails has key, store {
        id: UID,
        name: String,
        description: String,
        number: u64,
        url: Url,
        attributes: VecMap<String, String>,
        level: u64,
        exp: u64,
        first_bid: bool,
        first_deposit: bool,
        first_deposit_nft: bool,
        u64_padding: VecMap<String, u64>,
    }

    #[allow(unused)]
    public struct ManagerCap has key, store { id: UID }
}