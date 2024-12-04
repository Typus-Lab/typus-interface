# Typus Interface

## Rest Api
### Get Available Vault Details
* https://pricing-testnet-752051381467.us-central1.run.app
### Get Otc Parameters
* https://pricing-testnet-752051381467.us-central1.run.app?index={index}&size={size}
* Response
  ```json
  {
    status: 200,
    signature: vector<u8>,
    index: u64,
    d_token: u64,
    b_token: u64,
    option_price: u64,
    contract_size: u64,
    budget_w_fee: u64,
    ts_ms: u64
  }
  ```
### Error Code
* 301 => InvalidOtcTime
* 302 => ParseRequestError
* 303 => OptionExpiredError
* 304 => NullStrikeError
* 305 => InvalidIv
* 306 => InvalidDovIndex
* 307 => NotPermittedDovIndex
* 308 => GetPythPriceError
* 309 => GetIvDataError
* 310 => ZeroOptionPrice
* 311 => AlmostZeroPrice
* 312 => NoCapacityForOtc
* 313 => InvalidSize
* 399 => UnexpectedError