trigger ContactTrigger on Contact (before insert) {
/*Challenge 1: The Contact "VIP" Logic

Object: Contact
Scenario: When a new Contact is created:

> If the Department is 'Executive', set the Title to 'VIP Stakeholder'.
> If the Department is blank, set the Title to 'General Contact'.
> For all other departments, set the Title to 'Department Lead'.*/
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            ContactTriggerHandller.beforeInsert(Trigger.new);
        }
    }

}