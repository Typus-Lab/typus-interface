module typus_perp::escrow {

    use typus_framework::vault::TypusBidReceipt;
    use std::type_name::TypeName;

    #[allow(unused)]
    public struct UnsettledBidReceipt has store {
        receipt: vector<TypusBidReceipt>,
        position_id: u64,
        user: address,
        token_types: vector<TypeName>, // [C_TOKEN, B_TOKEN]
        unrealized_pnl_sign: bool,
        unrealized_pnl: u64,
        unrealized_trading_fee: u64,
        unrealized_borrow_fee: u64,
        unrealized_funding_fee_sign: bool,
        unrealized_funding_fee: u64,
        unrealized_liquidator_fee: u64,
    }
}