# Deposit Example

### Please keep the `TypusDepositReceipt` well.

## Vault Info

| Index | D_TOKEN | B_TOKEN | I_TOKEN |
| :---: | :-----: | :-----: | :-----: |
|  98   |  VSUI   |   SUI   |   SUI   |
|  101  |  STSUI  |   SUI   |   SUI   |

## Shared Object

- **typus_ecosystem_version:** `0xd2882b992e986250b3304b59530700bc3850939f9a77e9e9dfa9cf1656f84b3d`
- **typus_user_registry:** `0xb1b16eb4845b5ee1a29432b1f2bcfe8cbb33c234492baf31a706d82e28e18bce`
- **typus_leaderboard_registry:** `0xc515a3e7fd12ba902f7f1ebe52c676136e1b34cb614ae9c79a46b257ca7d5534`
- **registry:** `0x3d70b09359e3ca8301ae0abeda4f2fdf72ce313ba58c919ce568e5f535fd2ea8`

## Deposit

### First time deposit

use empty vector as input receipts
and set raise_from_premium, raise_from_premium both false

### Second time deposit

use the receipt you keep
and you canset raise_from_premium true for compunding premium

## Withdraw

### Normal withdraw with `reduce_from_warmup`

If no one bids, you can withdraw from warmup anytime except auction period (usually 4:00 PM - 4:10 PM UTC+8).

### Unsubscribe with `reduce_from_active`

If someone bids, the money will be locked in active vault. You can use `reduce_from_active` to unsubscribe, and it can be withdrawn after next settlement by setting `reduce_from_inactive` true.

### Withdraw profits

1. Set reduce_from_premium true to withdraw premium profit.
2. Set reduce_from_incentive true to withdraw incentive profit.

You can set both true simultaneously to withdraw them.

### Example package on mainnet

0x476e9c0a3aff951e7ba0156518280d6fed5f543f510a25524ea163fda9bab63e
