# Experimenting with Dominant Assurance Contracts

> **Abstract:** 

## Introduction

Dominant Assurance Contracts (DACs) present a compelling opportunity for the
private funding of public goods.

- Mechanism experiments:
  - Refund Bonus: (What happens when the goal is not met)
    - Flat
    - Linear
    - Quadratic
  - Fund Distribution: (How do you distribute funds from the pool)
    - To the entrepreneur
    - Bounty, by committee
- Other experiments:
  - Impact Cert: could you issue an NFT for the contribution (mint on
      contribute; burn on claiming refund)

## Background

### Public goods problems

### Assurance contracts

- game-theoretic mechanism designed to facilitate voluntary creation of public goods 
- solve collective action problems (such as free rider problem)

### Dominant assurance contracts

- Created by Alex Tabarrok
- Add an extra component: entrepreneur who profits when quorum is reached and pays the signors if it is not
- To create a contract, an entrepreneur must make the initial pledge
- If quorum is not reached, signors receive their pledge back with their share of the entrepreneur's initial pledge
- A player benefits whether or not quorum succeeds
- This creates a dominant strategy of participation: in the best interest to participate because you'll either get paid or get a public good

### Allo Protocol

## A mechanism approach

- What are the mechanisms by which a dominant assurance contract works?

## Experiments

Two areas within the mechanism for experimentation:

1. The refund bonus
2. The distribution of funds

A third experiment is offered as well, which is: the ability to "mint" your
contribution towards a contract pool as an impact certificate

### Refund bonus

  - Refund Bonus: (What happens when the goal is not met)
    - Flat
    - Proportional
    - Quadratic
  - How the refund bonus is distributed

| Bonus Type | Contract | Description |
| ---  |  --- | ---  |
| Flat  | [`Flat.sol`](./src/refund/Flat.sol)  | Every donor is given an equal share of the refund bonus. |
| Proportional  | [`Proportional.sol`](./src/refund/Proportional.sol)  | Donors are given a refund bonus proprtional to how much they contributed. |
| Quadratic  | [`Quadratic.sol`](./src/refund/Quadratic.sol)  | The refund bonus is distributed along a quadratic curve, based on when an address donated. |

#### Flat Bonus

With a flat refund bonus, every donor receives the same payout. This happens
regardless of when they contributed and how much: the refund pool is simply
divided evenly by the number of donors.

| Allocation Method | Description |
| --- | --- |
| `registerRecipient`  |   |
| `allocate`  |   |
| `distribute`  |   |

#### Proportional Bonus

With a proportional refund bonus, donors receive a refund proportional to the
amount they contributed. Contributing more means you receive more of the refund
pool.

| Allocation Method | Description |
| --- | --- |
| `registerRecipient`  |   |
| `allocate`  |   |
| `distribute`  |   |

#### Quadratic Bonus

In a quadratic refund bonus, the amount you receive is determined by when you
contributed. The earlier you contribute, the more you receive

| Allocation Method | Description |
| --- | --- |
| `registerRecipient`  |   |
| `allocate`  |   |
| `distribute`  |   |

### Fund distribution

  - Fund Distribution: (How do you distribute funds from the pool)
    - To the entrepreneur
    - Bounty, by committee

## Other possible experiments

### Impact cert:

Could you issue an NFT for the contribution (mint on contribute; burn on
claiming refund)?

### Contract as collateral

- DAC's introduce the entrepreneur: someone who is willing to take a risk to
    build a public good, provided a dominant strategy can be determined

What if, instead of paying out the contract to the entrepreneur if the goal is
met, the sum was used as collateral on a loan. The loaned sum goes to
cove the entrepreneur's development and implementation costs and can be paid
back b the contract fund.

## Conclusion


## References
