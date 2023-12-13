trigger AvoidLogicInTrigger on Account(before insert, before update) {
    Account a = Trigger.new[0]; //Bad: Accessing the trigger array directly is not recommended.

    for (Account a : Trigger.new) {
        //Good: Iterate through the trigger.new array instead.
    }
}
