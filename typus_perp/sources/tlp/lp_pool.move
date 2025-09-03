module typus_perp::lp_pool {
    use std::type_name::{TypeName};

    use sui::clock::{Clock};
    use sui::coin::{Coin};
    use sui::balance::{Balance};

    use typus_perp::admin::Version;
    use typus_perp::treasury_caps::{TreasuryCaps};
    use typus_perp::escrow::UnsettledBidReceipt;

    use typus_oracle::oracle::Oracle;

    #[allow(unused)]
    public struct Registry has key {
        id: UID,
        num_pool: u64,
        liquidity_pool_registry: UID,
    }

    #[allow(unused)]
    public struct LiquidityPool has key, store {
        id: UID, // token balances are dynamic fields under this id with TypeName key
        index: u64,
        lp_token_type: TypeName,
        liquidity_tokens: vector<TypeName>,
        token_pools: vector<TokenPool>,
        pool_info: LiquidityPoolInfo,
        liquidated_unsettled_receipts: vector<UnsettledBidReceipt>,
        u64_padding: vector<u64>,
        bcs_padding: vector<u8>,
    }

    #[allow(unused)]
    public struct TokenPool has store {
        token_type: TypeName,
        config: Config,
        state: State,
    }

    #[allow(unused)]
    public struct LiquidityPoolInfo has copy, drop, store {
        lp_token_decimal: u64,
        total_share_supply: u64, // total TLP amount
        tvl_usd: u64,
        is_active: bool,
    }

    #[allow(unused)]
    public struct Config has copy, drop, store {
        oracle_id: address,
        liquidity_token_decimal: u64,
        spot_config: SpotConfig,
        margin_config: MarginConfig,
        u64_padding: vector<u64>,
    }

    #[allow(unused)]
    public struct SpotConfig has copy, drop, store {
        min_deposit: u64,
        max_capacity: u64,
        // use these parameters to control TLP mint / burn fee
        target_weight_bp: u64,
        basic_mint_fee_bp: u64,
        additional_mint_fee_bp: u64,
        basic_burn_fee_bp: u64,
        additional_burn_fee_bp: u64,
        // swap related parameters
        swap_fee_bp: u64,
        swap_fee_protocol_share_bp: u64,
        lending_protocol_share_bp: u64,
        u64_padding: vector<u64>,
    }

    #[allow(unused)]
    // tokens to borrow for open position
    public struct MarginConfig has copy, drop, store {
        // borrow related parameters
        basic_borrow_rate_0: u64,
        basic_borrow_rate_1: u64,
        basic_borrow_rate_2: u64,
        utilization_threshold_bp_0: u64,
        utilization_threshold_bp_1: u64,
        borrow_interval_ts_ms: u64,
        max_order_reserve_ratio_bp: u64,
        u64_padding: vector<u64>,
    }

    #[allow(unused)]
    public struct State has copy, drop, store {
        liquidity_amount: u64,   // balance value
        value_in_usd: u64,       // amount / decimals * price (USD)
        reserved_amount: u64,      // = being used for opening position
        update_ts_ms: u64, // update value_in_usd (for tvl health)
        is_active: bool,
        // borrow related: use for recording margin trading borrow calculation
        last_borrow_rate_ts_ms: u64,
        cumulative_borrow_rate: u64,
        previous_last_borrow_rate_ts_ms: u64,
        previous_cumulative_borrow_rate: u64,
        current_lending_amount: vector<u64>, // index = I_LENDING_XXX, value = amount
        u64_padding: vector<u64>,
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

    #[allow(unused)]
    public fun mint_lp<TOKEN, LP_TOKEN>(
        version: &mut Version,
        registry: &mut Registry,
        treasury_caps: &mut TreasuryCaps,
        oracle: &Oracle,
        index: u64,
        // coin
        coin: Coin<TOKEN>, // deposit_amount: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ): Coin<LP_TOKEN> {
        abort 0
    }

    #[allow(unused)]
    public fun claim<LP_TOKEN, C_TOKEN>(
        version: &mut Version,
        registry: &mut Registry,
        index: u64,
        treasury_caps: &mut TreasuryCaps,
        oracle: &Oracle,
        clock: &Clock,
        ctx: &mut TxContext
    ): Coin<C_TOKEN> {
        abort 0
    }

    #[allow(unused)]
    public fun redeem<LP_TOKEN>(
        version: &Version,
        registry: &mut Registry,
        index: u64,
        balance: Balance<LP_TOKEN>,
        clock: &Clock,
        ctx: &TxContext
    ) {
        abort 0
    }
}