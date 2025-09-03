module typus_perp::competition {

    use std::ascii::String;

    #[allow(unused_field)]
    public struct CompetitionConfig has key {
        id: UID,
        boost_bp: vector<u64>, // idx = max level, value = boost_bp (decimal = 4)
        is_active: bool,
        program_name: String,
        u64_padding: vector<u64>
    }

}