// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/*
 * Dominant Assurance Contract Base
 *
 * This forms the base for running a Dominant Assurance Contract strategy in
 * Allo. It should be used with a refund and distribution mechanism.
 *
 */

import {IAllo} from "allo-v2/contracts/core/interfaces/IAllo.sol";
import {IRegistry} from "allo-v2/contracts/core/interfaces/IRegistry.sol";
import {Metadata} from "allo-v2/contracts/core/libraries/Metadata.sol";
import {BaseStrategy} from "allo-v2/contracts/strategies/BaseStrategy.sol";
import {Native} from "allo-v2/contracts/core/libraries/Native.sol";

contract DominanceAssuranceContractBase is BaseStrategy {
  /// ================================
  /// === Storage ====================
  /// ================================

  // owner
  // funding goal
  uint256 public fundingGoal;

  // pool start date
  uint256 public startDate;

  // pool end date
  uint256 public endDate;

  // number of pledges
  uint256 public numberOfPledges;

  // pledge amount (address => amount) - balanceOf
  mapping(address => uint256) public pledgeAmount;

  /// ================================
  /// === Events =====================
  /// ================================


  /// ================================
  /// === Errors =====================
  /// ================================


  /// ================================
  /// === Constructor ================
  /// ================================

  // Constructor
  // - set owner
  // - set pool amount
  constructor(address _allo, string memory _name) BaseStrategy(_allo, _name) {}

  function initialize(uint256 _poolId, bytes memory _data) external virtual override {
      // Initialize the BaseStrategy
      __BaseStrategy_init(_poolId);

      (uint256 _fundingGoal, uint256 _startDate, uint256 _endDate) = abi.decode(_data, (uint256, uint256, uint256));

      fundingGoal = _fundingGoal;
      startDate = _startDate;
      endDate = _endDate;
  }

  /// ================================
  /// === External Methods ===========
  /// ================================


  /// ================================
  /// === Strategy Methods ===========
  /// ================================

  // noop?
  function _registerRecipient(bytes memory _data, address _sender)
      internal
      override
      onlyActivePool
      returns (address recipientId)
  {}

  // Pledge function: function where people can pledge funds towards the goal
  function _allocate(bytes memory _data, address _sender)
      internal
      virtual
      override
      onlyActivePool
      onlyPoolManager(_sender)
  {
    // - check if pool is open
    // - check if pledge amount is greater than 0
    // - check address is not owner
    // - set balance contributed by address to msg.value    
  }

  // if the goal is reached, then distribute capital back to the anchor address.
  // Otherwise, refund all capital to the contributors.
  function _distribute(address[] memory, bytes memory, address _sender)
      internal
      virtual
      override
      onlyInactivePool
      onlyPoolManager(_sender)
  {}

  /// ================================
  /// === Internal Methods ===========
  /// ================================

    /// @notice Checks if address is eligible allocator
    function _isValidAllocator(address) internal pure override returns (bool) {
        return true;
    }

    function _getPayout(address _recipientId, bytes memory _data) internal view
    override returns (PayoutSummary memory) {}
    function _getRecipientStatus(address _recipientId) internal view override returns (Status) {}
}

