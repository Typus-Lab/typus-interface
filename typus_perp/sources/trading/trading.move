module typus_perp::trading {

    use sui::coin::Coin;
    use sui::clock::{Clock};
    use std::type_name::{TypeName};
    use sui::object_table::{ObjectTable};

    use typus_perp::admin::{Version};
    use typus_perp::competition::CompetitionConfig;
    use typus_perp::lp_pool::{Registry as PoolRegistry};

    use typus::ecosystem::Version as TypusEcosystemVersion;
    use typus::tails_staking::TailsStakingRegistry;
    use typus::leaderboard::TypusLeaderboardRegistry;
    use typus::user::TypusUserRegistry;
    use typus::linked_object_table::{LinkedObjectTable};
    use typus_oracle::oracle::Oracle;
    use typus::keyed_big_vector::{KeyedBigVector};

    #[allow(unused)]
    public struct MarketRegistry has key {
        id: UID,
        referral_registry: UID,
        markets: LinkedObjectTable<u64, Markets>,
        num_market: u64,
        u64_padding: vector<u64>,
    }

    #[allow(unused)]
    public struct Markets has key, store {
        id: UID,
        index: u64,
        lp_token_type: TypeName,
        quote_token_type: TypeName,
        is_active: bool,
        protocol_fee_share_bp: u64,
        symbols: vector<TypeName>,
        symbol_markets: ObjectTable<TypeName, SymbolMarket>,
        u64_padding: vector<u64>,
        // df:
        // user_accounts: ObjectTable<address, UserAccount>
    }

    #[allow(unused)]
    public struct SymbolMarket has key, store {
        id: UID,
        user_positions: KeyedBigVector, // KeyedBigVector of Position
        token_collateral_orders: UID,
        option_collateral_orders: UID,
        // limit_buy_orders, limit_sell_orders, stop_buy_orders, stop_sell_orders: VecMap<vector<TradingOrder>>,
        market_info: MarketInfo,
        market_config: MarketConfig,
    }

    #[allow(unused)]
    public struct MarketInfo has copy, drop, store {
        is_active: bool,
        size_decimal: u64,
        user_long_position_size: u64,
        user_short_position_size: u64,
        next_position_id: u64,
        user_long_order_size: u64,
        user_short_order_size: u64,
        next_order_id: u64,
        last_funding_ts_ms: u64,
        cumulative_funding_rate_index_sign: bool, // true -> longs pay fee to shorts
        cumulative_funding_rate_index: u64,
        previous_last_funding_ts_ms: u64,
        previous_cumulative_funding_rate_index_sign: bool, // true -> longs pay fee to shorts
        previous_cumulative_funding_rate_index: u64,
        u64_padding: vector<u64>,
    }

    #[allow(unused)]
    public struct MarketConfig has copy, drop, store {
        oracle_id: address,
        max_leverage_mbp: u64,
        option_collateral_max_leverage_mbp: u64,
        min_size: u64,
        lot_size: u64,
        trading_fee_config: vector<u64>,
        basic_funding_rate: u64,
        funding_interval_ts_ms: u64,
        exp_multiplier: u64,
        u64_padding: vector<u64>,
    }

    #[allow(unused)]
    public fun create_trading_order_v2<C_TOKEN, BASE_TOKEN>(
        // for share objects
        version: &mut Version,
        registry: &mut MarketRegistry,
        pool_registry: &mut PoolRegistry,
        typus_oracle_c_token: &Oracle,
        typus_oracle_trading_symbol: &Oracle,
        clock: &Clock,
        market_index: u64,
        pool_index: u64,
        // tails
        typus_ecosystem_version: &TypusEcosystemVersion,
        typus_user_registry: &mut TypusUserRegistry,
        typus_leaderboard_registry: &mut TypusLeaderboardRegistry,
        tails_staking_registry: &TailsStakingRegistry,
        competition_config: &CompetitionConfig,
        // order parameters
        linked_position_id: Option<u64>,
        collateral: Coin<C_TOKEN>, // collateral_amount: u64,
        reduce_only: bool,
        is_long: bool,
        is_stop_order: bool,
        size: u64,
        trigger_price: u64,
        ctx: &mut TxContext,
    ) {
        abort 0
    }

    #[allow(unused)]
    public fun cancel_trading_order<C_TOKEN, BASE_TOKEN>(
        // for share objects
        version: &Version,
        registry: &mut MarketRegistry,
        market_index: u64,
        // order parameters
        order_id: u64,
        trigger_price: u64, // pass this for reducing network fee cost
        mut order_user: Option<address>, // if some => ctx should be a manager; none => cancel sender(ctx)'s order
        ctx: &mut TxContext,
    ): Coin<C_TOKEN> {
        abort 0
    }
}