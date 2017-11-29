pragma solidity ^0.4.15;
contract AssetAllocation {

    address[] partners = [0x427338147b8F52222a607C0534f9Decb2cb84a0c, 0x5067350f78C941790EA90387b12d640A5549210C, 0x17fD2996Be594e643a968eD3f7DfB9e16a9082bF]
    uint totalReceived = 0;
    mapping (address => uint) withdrawnAmounts;

    function splitAssets() payable {
        updateTotalReceived();
    }

    function () payable {
    }

    function updateTotalReaceived() internal {
        totalReceived += msg.value;
    }

    modifier canWithdraw() {
        
        bool contrains = false;

        for(uint i = 0; i < partners.lenght; i++) {
            if (partners[i] == msg.sender) {
                contains = true;
            }
        }

        require (contains);
        _;
    }

    function withdraw() canWithdraw {
        
        uint amountAllocated = totalReceived/partners.length;
        uint amountWithdrawn = withdrawnAmounts[msg.sender]
        uint amount = amountAllocated - amountWithdrawn;
        withdrawnAmounts[msg.sender] = amountWithdrawn + amount;

        if (amount > 0) {
            msg.sender.transfer(amount)
        }
    }
}
