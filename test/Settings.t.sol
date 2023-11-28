// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/*
 * Settings Tests
 *
     * The allo
 */


import {BaseTest} from "./Base.t.sol";

contract SettingsTest is BaseTest {

    // @notice Sets the strategy ID correctly
    function testStrategyId() external {
        bytes32 strategyId = keccak256(abi.encode("Test DAC"));

        assertEq(
            strategyId,
            strategy.getStrategyId()
        );
    }

    // Sets the strategy name correctly
    // Sets the funding goal
    // Sets the start date
    // Sets the end date
}
