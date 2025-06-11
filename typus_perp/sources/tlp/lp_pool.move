module typus_perp::lp_pool {
    use std::type_name::{TypeName};

    use typus_perp::admin::Version;

    #[allow(unused_field)]
    public struct Registry has key {
        id: UID,
        num_pool: u64,
        liquidity_pool_registry: UID,
    }

    #[allow(unused)]
    /// (total_share_supply, tvl_usd, token_types, amounts, usds)
    public fun get_pool_liquidity(
        version: &Version,
        registry: &Registry,
        index: u64,
    ): (u64, u64, vector<TypeName>, vector<u64>, vector<u64>) {
        abort 0
    }
}