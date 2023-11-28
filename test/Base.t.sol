// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";

// Custom Strategy
import {DominanceAssuranceContractBase} from "src/DACBase.sol";

// Strategy Interface
import {IStrategy} from "allo-v2/contracts/core/interfaces/IStrategy.sol";
import {Native} from "allo-v2/contracts/core/libraries/Native.sol";
import {Metadata} from "allo-v2/contracts/core/libraries/Metadata.sol";

// Test libraries
import {AlloSetup} from "allo-v2/test/foundry/shared/AlloSetup.sol";
import {RegistrySetupFull} from "allo-v2/test/foundry/shared/RegistrySetup.sol";

import {EventSetup} from "allo-v2/test/foundry/shared/EventSetup.sol";

contract BaseTest is Test, Native, EventSetup, AlloSetup, RegistrySetupFull {
    uint256 public poolId;
    Metadata public poolMetadata;

    uint256 fundingGoal = 100 ether;
    uint256 refundBonus = 20 ether;
    uint256 startDate = block.timestamp + 1 days;
    uint256 endDate = block.timestamp + 10 days;

    DominanceAssuranceContractBase strategy;

    function setUp() public {
        __RegistrySetupFull();
        __AlloSetup(address(registry()));

        strategy = new DominanceAssuranceContractBase(
            address(allo()),
            "Test DAC"
        );
        poolMetadata = Metadata({protocol: 1, pointer: "PoolMetadata"});

        vm.deal(pool_admin(), 25 ether);

        vm.prank(pool_admin());
        poolId = allo().createPoolWithCustomStrategy{ value: 21 ether }(
            poolProfile_id(),
            address(strategy),
            abi.encode(
                fundingGoal,
                startDate,
                endDate
            ),
            NATIVE,
            20 ether, // poolSize
            poolMetadata,
            pool_managers()
        );
    }
}

