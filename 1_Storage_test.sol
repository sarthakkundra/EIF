pragma solidity >=0.7.0 <0.8.0;
import "../contracts/1_Storage.sol";

contract StorageTest {
    
    Storage storageTest;
    function beforeAll () public {
        storageTest = new Storage();
    }
    
    function checkRetrieval() public {
        storageTest.store(uint(10));
        Assert.equal(storageTest.retrieve(), uint(10), "Both are eqaul, Store and retrieve working fine!");
    }
}