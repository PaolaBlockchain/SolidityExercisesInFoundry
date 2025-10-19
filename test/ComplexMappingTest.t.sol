// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {Test} from "forge-std/Test.sol";
import {PracticandoMappingComplejo} from "../src/ComplexMappingDataStructureExample5.sol";

contract ComplexMappingTest is Test {
    PracticandoMappingComplejo public mappingContract;
    
    address user1 = makeAddr("user1");
    address user2 = makeAddr("user2");
    address user3 = makeAddr("user3");
    
    function setUp() public {
        mappingContract = new PracticandoMappingComplejo();
    }
    
    function test_AssignPersonBasic() public {
        vm.prank(user1);
        mappingContract.assignPerson(1, "Alice", 25);
        
        (uint256 id, string memory name, uint8 age) = mappingContract.subjects(user1);
        assertEq(id, 1);
        assertEq(name, "Alice");
        assertEq(age, 25);
    }
    
    function test_GetSubjectAfterAssignment() public {
        vm.prank(user1);
        mappingContract.assignPerson(2, "Bob", 30);
        
        vm.prank(user1);
        (uint256 id, string memory name, uint8 age) = mappingContract.getSubject();
        assertEq(id, 2);
        assertEq(name, "Bob");
        assertEq(age, 30);
    }
    
    function test_MultipleUsersCanHaveDifferentData() public {
        // Usuario 1 asigna sus datos
        vm.prank(user1);
        mappingContract.assignPerson(1, "Alice", 25);
        
        // Usuario 2 asigna sus datos
        vm.prank(user2);
        mappingContract.assignPerson(2, "Bob", 30);
        
        // Usuario 3 asigna sus datos
        vm.prank(user3);
        mappingContract.assignPerson(3, "Charlie", 35);
        
        // Verificar que cada usuario tiene sus propios datos
        (uint256 id1, string memory name1, uint8 age1) = mappingContract.subjects(user1);
        (uint256 id2, string memory name2, uint8 age2) = mappingContract.subjects(user2);
        (uint256 id3, string memory name3, uint8 age3) = mappingContract.subjects(user3);
        
        assertEq(id1, 1);
        assertEq(name1, "Alice");
        assertEq(age1, 25);
        
        assertEq(id2, 2);
        assertEq(name2, "Bob");
        assertEq(age2, 30);
        
        assertEq(id3, 3);
        assertEq(name3, "Charlie");
        assertEq(age3, 35);
    }
    
    function test_OverwriteExistingPersonData() public {
        // Asignar datos iniciales
        vm.prank(user1);
        mappingContract.assignPerson(1, "Alice", 25);
        
        // Sobrescribir con nuevos datos
        vm.prank(user1);
        mappingContract.assignPerson(99, "Alice Updated", 26);
        
        (uint256 id, string memory name, uint8 age) = mappingContract.subjects(user1);
        assertEq(id, 99);
        assertEq(name, "Alice Updated");
        assertEq(age, 26);
    }
    
    function test_GetSubjectWithoutAssignment() public {
        // Intentar obtener datos sin haber asignado nada
        vm.prank(user1);
        (uint256 id, string memory name, uint8 age) = mappingContract.getSubject();
        
        // Debe retornar valores por defecto
        assertEq(id, 0);
        assertEq(name, "");
        assertEq(age, 0);
    }
    
    function test_AssignPersonWithEmptyName() public {
        vm.prank(user1);
        mappingContract.assignPerson(1, "", 25);
        
        (uint256 id, string memory name, uint8 age) = mappingContract.subjects(user1);
        assertEq(id, 1);
        assertEq(name, "");
        assertEq(age, 25);
    }
    
    function test_AssignPersonWithZeroAge() public {
        vm.prank(user1);
        mappingContract.assignPerson(1, "Baby", 0);
        
        (uint256 id, string memory name, uint8 age) = mappingContract.subjects(user1);
        assertEq(id, 1);
        assertEq(name, "Baby");
        assertEq(age, 0);
    }
    
    function test_AssignPersonWithMaxAge() public {
        vm.prank(user1);
        mappingContract.assignPerson(1, "Elder", 255); // uint8 max value
        
        (uint256 id, string memory name, uint8 age) = mappingContract.subjects(user1);
        assertEq(id, 1);
        assertEq(name, "Elder");
        assertEq(age, 255);
    }
    
    function testFuzz_AssignPersonWithRandomData(uint256 _id, string memory _name, uint8 _age) public {
        vm.prank(user1);
        mappingContract.assignPerson(_id, _name, _age);
        
        (uint256 id, string memory name, uint8 age) = mappingContract.subjects(user1);
        assertEq(id, _id);
        assertEq(name, _name);
        assertEq(age, _age);
    }
    
    function test_GetSubjectConsistentWithMapping() public {
        vm.prank(user1);
        mappingContract.assignPerson(42, "TestUser", 33);
        
        // Obtener datos usando getSubject()
        vm.prank(user1);
        (uint256 idFromFunction, string memory nameFromFunction, uint8 ageFromFunction) = mappingContract.getSubject();
        
        // Obtener datos directamente del mapping
        (uint256 idFromMapping, string memory nameFromMapping, uint8 ageFromMapping) = mappingContract.subjects(user1);
        
        // Ambos métodos deben retornar los mismos datos
        assertEq(idFromFunction, idFromMapping);
        assertEq(nameFromFunction, nameFromMapping);
        assertEq(ageFromFunction, ageFromMapping);
    }
}