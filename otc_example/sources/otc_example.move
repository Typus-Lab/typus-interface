module otc_example::otc_example {
    use sui::coin::Coin;
    use sui::clock::Clock;

    use typus_dov::typus_dov_single::Registry;
    use typus_framework::vault;
    use typus_interface::typus_interface;
    use typus::utility;

    public struct EXAMPLE has drop {}

    public struct OtcEvent has copy, drop {
        delivery_price: u64,
        delivery_size: u64,
        bidder_bid_value: u64,
        bidder_fee: u64,
    }
    entry fun otc<D_TOKEN, B_TOKEN>(
        signature: vector<u8>,
        registry: &mut Registry,
        index: u64,
        price: u64,
        size: u64,
        coin: Coin<B_TOKEN>,
        ts_ms: u64,
        clock: &Clock,
        ctx: &mut TxContext,
    ) {
        let user = ctx.sender();
        let (receipt_opt, balance_opt, log) = typus_interface::otc<EXAMPLE, D_TOKEN, B_TOKEN>(
            EXAMPLE {},
            signature,
            registry,
            index,
            price,
            size,
            coin.into_balance(),
            ts_ms,
            clock,
            ctx,
        );
        sui::event::emit(OtcEvent {
            delivery_price: log[0],
            delivery_size: log[1],
            bidder_bid_value: log[2],
            bidder_fee: log[3],
        });
        vault::transfer_bid_receipt(receipt_opt, user);
        utility::transfer_balance_opt(balance_opt, user, ctx);
    }
}
