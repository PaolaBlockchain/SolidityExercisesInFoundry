# Solidity Exercises in Foundry 🎯

This repository contains practical Solidity exercises for learning and practicing blockchain development concepts. Built with **Foundry** framework for compilation, testing, and deployment.

## 🚀 Quick Start

### Prerequisites
- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- Git

### Installation
```bash
git clone https://github.com/PaolaBlockchain/SolidityExercisesInFoundry.git
cd SolidityExercisesInFoundry
forge install
```

### Running Tests
```bash
# Run all tests
forge test

# Run tests with verbose output
forge test -vv

# Run specific contract tests
forge test --match-contract ContractName -vv
```

## 📁 Project Structure

```
SolidityExercisesInFoundry/
├── src/                          # Smart contracts
│   ├── Counter.sol              # Basic counter
│   └── ComplexMappingDataStructureExample5.sol  # Complex mapping with structs
├── test/                         # Test files
│   ├── Counter.t.sol            # Counter tests
│   └── ComplexMappingTest.t.sol # Complex mapping tests
├── script/                       # Deployment scripts
│   └── Counter.s.sol            # Counter deployment script
├── lib/                          # Dependencies (forge-std)
├── cache/                        # Compilation cache
├── foundry.toml                  # Foundry configuration
└── README.md                     # This file
```

## 📋 Smart Contracts

### 1. **Counter.sol** 🔢
A simple counter contract for basic Solidity concepts.

**Features:**
- Increment functionality
- Number storage and retrieval
- Basic state management

**Functions:**
- `setNumber(uint256 newNumber)` - Sets a specific number
- `increment()` - Increments the counter by 1
- `number()` - Public variable that stores the current number

**Learning Concepts:**
- State variables (`uint256 public number`)
- Function visibility (`public`)
- Basic operations (`++`)

---

### 2. **PracticandoMappingComplejo** (ComplexMappingDataStructureExample5.sol) 👥
Advanced contract demonstrating complex mapping structures with custom data types.

**Features:**
- Maps Ethereum addresses to `Person` structs
- Stores personal data (ID, name, age)
- Address-based data retrieval

**Person Struct:**
```solidity
struct Person {
    uint256 id;
    string name;
    uint8 age;
}
```

**Functions:**
- `assignPerson(uint256 _id, string memory _name, uint8 _age)` - Assigns a person to the caller's address
- `getSubject()` - Returns the person data associated with the caller
- `subjects(address)` - Public mapping for direct access

**Learning Concepts:**
- Complex mappings (`mapping(address => struct)`)
- Custom struct definitions
- `msg.sender` usage
- Difference between `memory` and `storage`
- NatSpec documentation

---

## 🧪 Comprehensive Testing

Each contract includes complete test coverage:

### Counter Tests (`Counter.t.sol`)
- ✅ `test_Increment()` - Basic increment functionality
- ✅ `testFuzz_SetNumber(uint256 x)` - Fuzz testing for setting numbers
- ✅ State verification

### Complex Mapping Tests (`ComplexMappingTest.t.sol`)
- ✅ `test_AssignPersonBasic()` - Basic person assignment
- ✅ `test_GetSubjectAfterAssignment()` - Retrieval after assignment
- ✅ `test_MultipleUsersCanHaveDifferentData()` - Data isolation between users
- ✅ `test_OverwriteExistingPersonData()` - Overwriting existing data
- ✅ `test_GetSubjectWithoutAssignment()` - Behavior without prior assignment
- ✅ `test_AssignPersonWithEmptyName()` - Edge cases with empty name
- ✅ `test_AssignPersonWithZeroAge()` - Edge cases with zero age
- ✅ `test_AssignPersonWithMaxAge()` - Edge cases with maximum age (255)
- ✅ `testFuzz_AssignPersonWithRandomData()` - Fuzz testing with random data
- ✅ `test_GetSubjectConsistentWithMapping()` - Consistency between function and direct mapping

## 🛠 Development Commands

```bash
# Compile contracts
forge build

# Run all tests
forge test

# Run tests with verbose output
forge test -vv

# Run tests with gas reporting
forge test --gas-report

# Run specific test file
forge test test/Counter.t.sol -vv
forge test test/ComplexMappingTest.t.sol -vv

# Run tests matching a pattern
forge test --match-contract CounterTest -vv

# Format code
forge fmt

# Check contract sizes
forge build --sizes

# Clean cache and artifacts
forge clean
```

## 📚 Learning Objectives

This repository covers:

- **Basic Solidity Syntax**: Variables, functions, modifiers
- **Data Structures**: Arrays, mappings, structs
- **Access Control**: Function visibility, `msg.sender`
- **Advanced Testing**: Unit tests, fuzz testing, edge cases
- **Development Tools**: Foundry ecosystem
- **Best Practices**: NatSpec documentation, code formatting
- **State Management**: Public and private variables
- **Data Types**: uint256, uint8, string, address

## 🔧 Configuration

The project uses Foundry with standard configuration in `foundry.toml`:
- Source directory: `src`
- Output directory: `out`
- Libraries: `lib` (forge-std included)
- Solidity version: `^0.8.13` (Counter) and `>=0.8.0 <0.9.0` (Mapping)

## 🎯 Practical Use Cases

### Counter Contract
- Voting counters in DAOs
- Scoring systems
- On-chain event counters

### Complex Mapping Contract
- Decentralized identity systems
- User registries
- On-chain databases
- Reputation systems

## 📝 Important Notes

- **Licenses**: Counter.sol uses UNLICENSED, ComplexMapping uses MIT
- **Documentation**: Contracts documented with NatSpec comments
- **Conventions**: Tests follow Foundry conventions
- **Formatting**: Code formatted with `forge fmt`
- **Security**: Contracts designed for learning, not production use

## 🚀 Deployment Scripts

The project includes ready-to-use deployment scripts:

```bash
# Deploy Counter contract
forge script script/Counter.s.sol --rpc-url <RPC_URL> --private-key <PRIVATE_KEY>

# Deploy on local testnet (Anvil)
anvil  # In a separate terminal
forge script script/Counter.s.sol --rpc-url http://localhost:8545 --private-key <ANVIL_PRIVATE_KEY> --broadcast
```

## 🔍 Gas Analysis

To optimize gas costs:

```bash
# Detailed gas report
forge test --gas-report

# Contract size information
forge build --sizes
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Add your contracts and tests
4. Ensure all tests pass (`forge test`)
5. Format the code (`forge fmt`)
6. Commit your changes (`git commit -am 'Add: new feature'`)
7. Push to the branch (`git push origin feature/new-feature`)
8. Open a Pull Request

## 📊 Project Status

![Tests Status](https://img.shields.io/badge/tests-passing-brightgreen)
![Coverage](https://img.shields.io/badge/coverage-100%25-brightgreen)
![Solidity](https://img.shields.io/badge/solidity-^0.8.13-blue)
![Foundry](https://img.shields.io/badge/foundry-latest-orange)

---

**Happy Solidity Learning! 🎉**

*Developed with ❤️ by [PaolaBlockchain](https://github.com/PaolaBlockchain)*