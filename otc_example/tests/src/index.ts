import { SuiClient } from "@mysten/sui/client";
import { Transaction } from "@mysten/sui/transactions";
import { Ed25519Keypair } from "@mysten/sui/keypairs/ed25519";
import dotenv from "dotenv";

(async () => {
    dotenv.config();
    let registry = "0x0285cbf4aa8585be6c978235d11d06fa35773266ede040d38d34e1d79b049460";
    let rpcEndpoint = "https://fullnode.testnet.sui.io:443";
    let target = "0xf64aececc209feef2fb74797276c65f2f202c53f579b310405c67b6fa1fe5c6e::otc_example::otc";
    let index = 0;
    let size = 10000000000;
    let response = await fetch(`https://pricing-testnet-752051381467.us-central1.run.app?index=${index}&size=${size}`);
    let result = await response.json();
    console.log(result);
    if (response.ok) {
        let signer = Ed25519Keypair.deriveKeypair(String(process.env.MNEMONIC));
        let provider = new SuiClient({ url: rpcEndpoint });

        let transaction = new Transaction();
        let [coin] = transaction.splitCoins(transaction.gas, [transaction.pure.u64(result.budget_w_fee)]);
        transaction.moveCall({
            target,
            typeArguments: [result.d_token, result.b_token],
            arguments: [
                transaction.pure.vector("u8", result.signature),
                transaction.object(registry),
                transaction.pure.u64(result.index),
                transaction.pure.u64(result.option_price),
                transaction.pure.u64(result.contract_size),
                coin,
                transaction.pure.u64(result.ts_ms),
                transaction.object("0x6"),
            ],
        });
        let res = await provider.signAndExecuteTransaction({ signer, transaction });
        console.log(res);
    }
})();
