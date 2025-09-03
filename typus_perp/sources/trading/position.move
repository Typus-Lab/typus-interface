module typus_perp::position {

    use std::type_name::{TypeName};
    use typus_perp::symbol::Symbol;

    #[allow(unused, lint(missing_key))]
    public struct Position has store {
        id: UID,
        create_ts_ms: u64,
        position_id: u64,
        linked_order_ids: vector<u64>,
        linked_order_prices: vector<u64>,
        user: address,
        is_long: bool,
        size: u64, // position size represent order.to_token_amount in USD when opening order
        size_decimal: u64,
        collateral_token: TypeName, // C_TOKEN
        collateral_token_decimal: u64,
        symbol: Symbol,
        collateral_amount: u64,// order.collateral_amount - execution_fee_amount in c_token amount
        reserve_amount: u64, // position.size in collateral token amount
        average_price: u64,
        entry_borrow_index: u64,
        entry_funding_rate_index_sign: bool,
        entry_funding_rate_index: u64,
        unrealized_loss: u64, // only option collateral position uses it
        unrealized_funding_sign: bool, // true -> should pay
        unrealized_funding_fee: u64,
        unrealized_trading_fee: u64,
        unrealized_borrow_fee: u64, // option collateral position also uses this field to store unrealized trading fee
        unrealized_rebate: u64,
        option_collateral_info: Option<OptionCollateralInfo>, // if token collateral position, this field is None
        u64_padding: vector<u64>,
    }

    #[allow(unused)]
    public struct OptionCollateralInfo has store, drop {
        index: u64,
        bid_token: TypeName, // deposit_token = collateral_token
        bid_receipts_bcs: vector<vector<u8>>, // vector[bcs of one bid receipt]
    }

    #[allow(unused, lint(missing_key))]
    public struct TradingOrder has store {
        id: UID,
        create_ts_ms: u64,
        order_id: u64,
        linked_position_id: Option<u64>,
        user: address,
        // user token type
        collateral_token: TypeName, // C_TOKEN
        collateral_token_decimal: u64,
        symbol: Symbol,
        // order parameters
        leverage_mbp: u64, // TODO: adjust for removing collateral
        reduce_only: bool,
        is_long: bool,
        is_stop_order: bool,
        size: u64,
        size_decimal: u64,
        trigger_price: u64,
        oracle_price_when_placing: u64,
        u64_padding: vector<u64>, // [collateral.value]
        // record the amount user deposited into MarketCollateral<TOKEN>
        // execution_info: ExecutionInfo,
        // collateral_amount: u64, // execution_fee_amount not yet deducted
        // execution_fee_amount: u64,
    }
}