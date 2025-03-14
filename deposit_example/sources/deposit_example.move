module deposit_example::deposit_example {

    use sui::balance::{Balance};
    use sui::clock::Clock;

    use typus_dov::typus_dov_single::{Registry};
    use typus_framework::vault::{TypusDepositReceipt};
    use typus::ecosystem::Version as TypusEcosystemVersion;
    use typus::leaderboard::TypusLeaderboardRegistry;
    use typus::user::TypusUserRegistry;

    use typus_dov::tds_user_entry;

    public fun deposit<D_TOKEN, B_TOKEN>(
        typus_ecosystem_version: &TypusEcosystemVersion,
        typus_user_registry: &mut TypusUserRegistry,
        typus_leaderboard_registry: &mut TypusLeaderboardRegistry,
        registry: &mut Registry,
        index: u64,
        receipts: vector<TypusDepositReceipt>,
        raise_balance: Balance<D_TOKEN>,
        raise_from_premium: bool,
        raise_from_inactive: bool,
        clock: &Clock,
        ctx: &mut TxContext,
    ): (TypusDepositReceipt, vector<u64>) {
        tds_user_entry::public_raise_fund<D_TOKEN,B_TOKEN>(
            typus_ecosystem_version,
            typus_user_registry,
            typus_leaderboard_registry,
            registry,
            index,
            receipts,
            raise_balance,
            raise_from_premium,
            raise_from_inactive,
            clock,
            ctx
            )
    }

    public fun withdraw<D_TOKEN, B_TOKEN, I_TOKEN>(
        typus_ecosystem_version: &TypusEcosystemVersion,
        typus_user_registry: &mut TypusUserRegistry,
        typus_leaderboard_registry: &mut TypusLeaderboardRegistry,
        registry: &mut Registry,
        index: u64,
        receipts: vector<TypusDepositReceipt>,
        reduce_from_warmup: u64,
        reduce_from_active: u64,
        reduce_from_premium: bool,
        reduce_from_inactive: bool,
        reduce_from_incentive: bool,
        clock: &Clock,
        ctx: &mut TxContext,
    ): (Option<TypusDepositReceipt>, Balance<D_TOKEN>, Balance<B_TOKEN>, Balance<I_TOKEN>, vector<u64>) {
        tds_user_entry::public_reduce_fund<D_TOKEN, B_TOKEN, I_TOKEN>(
            typus_ecosystem_version,
            typus_user_registry,
            typus_leaderboard_registry,
            registry,
            index,
            receipts,
            reduce_from_warmup,
            reduce_from_active,
            reduce_from_premium,
            reduce_from_inactive,
            reduce_from_incentive,
            clock,
            ctx
            )
    }


}