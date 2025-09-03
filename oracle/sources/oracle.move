module typus_oracle::oracle {

    use std::type_name::{TypeName};
    use std::ascii::{String};

    #[allow(unused)]
    public struct Oracle has key {
        id: UID,
        base_token: String,
        quote_token: String,
        base_token_type: TypeName,
        quote_token_type: TypeName,
        decimal: u64,
        price: u64,
        twap_price: u64,
        ts_ms: u64,
        epoch: u64,
        time_interval: u64,
        switchboard: Option<ID>,
        pyth: Option<ID>,
    }
}