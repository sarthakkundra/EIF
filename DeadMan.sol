pragma solidity >=0.8.0;

contract DeadManSwitch {
    uint lastCheckedBlock;
    uint balance;
    address owner;
    address payable backup;

    constructor() payable {
        lastCheckedBlock = block.number;
        owner = msg.sender;
        backup = payable(0x959fe9E2A919A03426010b663C5EB2570d6d07C5);
        balance = msg.value;
    }

    function aliveSwitch() public {
        if(msg.sender == owner){
            if(block.number - lastCheckedBlock <= 10){
                lastCheckedBlock = block.number;
            } else{
                selfdestruct(backup);
            }
        }
    }

    function checkToDestroy() public {
        if(block.number - lastCheckedBlock > 10){
            selfdestruct(backup);
        }
    }
}