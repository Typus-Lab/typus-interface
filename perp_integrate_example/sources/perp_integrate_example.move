module deposit_example::deposit_example {

    use typus_perp::lp_pool::{Self, Registry};
    use typus_perp::admin::Version;

    const PRICE_PRECISION: u64 = 1_000_000_000;

    public fun get_pool_liquidity(
        version: &Version,
        registry: &Registry,
        index: u64,
    ) {
        let (total_share_supply, tvl_usd, _token_types, _amounts, _usds) = lp_pool::get_pool_liquidity(version, registry, index);
        let _tlp_price = ((tvl_usd as u128) * (PRICE_PRECISION as u128) / (total_share_supply as u128)) as u64;
    }
}