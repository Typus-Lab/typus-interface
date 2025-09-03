module typus_perp::symbol {
    use std::type_name::{TypeName};

    #[allow(unused)]
    public struct Symbol has copy, store, drop {
        base_token: TypeName,
        quote_token: TypeName,
    }
}