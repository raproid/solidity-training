// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter{

    function getPrice() internal view returns(uint256){
        /**
        Get price of ETH in USD, from Chainlink
        * Network: Sepolia
        * Aggregator: ETH/USD
        * Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        */
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
        // Why multiply and typecast? price is returned as int and in 1e8, needs be uint256 and in 1e18 format as others price-logic-related vars in the code

    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        /**
        Convert msg.value to price in USD
        */
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        // Why divide? multiplying one 1e18 by another 1e18 results in 1e32, e.g. 1 ETH is 3500 USD, then (3500_000000000000000000 * 1_000000000000000000) / 1e18 results in $3500 = 1 ETH where 18 decimals are thrown away
        // Multiply before dividing, as Solidity uses whole numbers, and e.g. 1/2=0
        return ethAmountInUsd;
    }

    function getVersion() internal view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}
