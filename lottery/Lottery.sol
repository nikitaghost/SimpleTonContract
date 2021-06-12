pragma ton-solidity >= 0.35.0;
pragma experimental ABIEncoderV2;
pragma ignoreIntOverflow;
pragma AbiHeader expire;
pragma AbiHeader pubkey;
pragma AbiHeader time;

contract Lottery {

    struct Ticket {
        address payable t_owner;
    }

    uint32 public timestamp;

    /*
        statuses
        -1 = not started
        0 = going
        1 = finished
    */
    address payable _owner;
    uint128 l_ticketCost = 0;
    uint8 l_status;
    uint8 l_percent;
    uint128 l_numTickets;
    
    mapping(uint => Lottery.Ticket) tickets;

    event TransferAccepted(bytes payload);

    function _initialize(address payable owner, uint128 ticketCost, uint8 percent) public{
        _owner = owner;
        l_ticketCost = ticketCost;
        l_status = 0;
        l_numTickets = 0;
        l_percent = percent;
        
    }

    constructor(address payable owner, uint128 ticketCost, uint8 percent) public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        timestamp = now;
        _initialize(owner, ticketCost, percent);
    }

    function acceptTransfer(bytes payload) external payable {
        if (l_status == 0){
            uint128 uint_payload = msg.value;
            msg.sender.transfer(uint_payload % l_ticketCost);
            buyTicket(uint_payload / l_ticketCost);
        }
        
        emit TransferAccepted(payload);
    }

    function buyTicket(uint128 payload) public payable{
        //block.timestamp
        if(payload != 0){
            uint tId = l_numTickets++;
            tickets[tId] = Ticket(msg.sender);
            buyTicket(payload - l_ticketCost);
        }
    }

    function chooseWinner() public returns (uint256 winnerAddress) {
        uint randomNum = random();
        optional(Ticket) opt_winner = tickets.fetch(randomNum);
        Ticket t_winner = opt_winner.get();

        address payable dest = t_winner.t_owner;
        address payable m_owner = address(_owner);

        tvm.accept();
        uint256 prize = ((l_numTickets *  l_ticketCost) / 100) * l_percent;
        dest.transfer(uint128(prize) , true, 0);

        uint256 remainsMoney = (l_numTickets * l_ticketCost) - prize;
        m_owner.transfer(uint128(remainsMoney), true, 0);

        l_status = 1;
    }

    function getNumOfSoldTickets() public view returns (uint256 numOfSoldTickets){
        numOfSoldTickets = l_numTickets;
    }

    function random() private view returns(uint){
        rnd.next(l_numTickets + 1);
    }

}