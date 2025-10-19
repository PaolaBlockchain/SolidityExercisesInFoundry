// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/// @title Practice contract with more complex mappings
/// @author Paola
/// @notice Allows associating a struct type called `Person` with an Ethereum address.
/// @dev Intended for experimenting with mappings where a single user (wallet) can have related structured data.
contract PracticandoMappingComplejo {

    /// @dev Mapping that associates an address with a `Person` struct
    mapping(address => Person) public subjects;

    /// @dev Struct that represents a person with id, name, and age
    struct Person {
        uint256 id;
        string name;
        uint8 age;
    }

    /// @notice Assigns a person to the sender (`msg.sender`)
    /// @param _id Unique identifier of the person
    /// @param _name Name of the person
    /// @param _age Age of the person
    function assignPerson(uint256 _id, string memory _name, uint8 _age) public {
        Person memory newPerson = Person(_id, _name, _age);
        subjects[msg.sender] = newPerson; // Assign the new person to the sender's address in the mapping
    }

    /// @notice Returns the data of the person associated with the sender (`msg.sender`)
    /// @return id The person's identifier
    /// @return name The person's name
    /// @return age The person's age
    function getSubject() public view returns (uint256 id, string memory name, uint8 age) {
        Person memory p = subjects[msg.sender]; // Retrieve the stored person associated with the sender
        return (p.id, p.name, p.age);

        // Alternative (less efficient) version:
        // return (subjects[msg.sender].id, subjects[msg.sender].name, subjects[msg.sender].age);
    }
}
