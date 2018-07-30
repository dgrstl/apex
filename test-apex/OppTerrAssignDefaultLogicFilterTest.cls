@isTest
public class OppTerrAssignDefaultLogicFilterTest {


@isTest
static void unitTest() {
    Id opportunityId = [Select Id From Opportunity].Id;
    OppTerrAssignDefaultLogicFilter filter = new OppTerrAssignDefaultLogicFilter();

    Test.startTest();

    Map<Id, Id> resultMap = filter.getOpportunityTerritory2Assignments(new List<Id> {opportunityId});
    OppTerrAssignDefaultLogicFilter.Territory2Priority tp = new OppTerrAssignDefaultLogicFilter.Territory2Priority(opportunityId, 1, false);

    Test.stopTest();

    System.assertEquals(1, resultMap.size());
    System.assertEquals(tp.territory2Id, opportunityId);
    System.assertEquals(1, tp.priority);
    System.assertEquals(false, tp.moreTerritoriesAtPriority);
}

@testSetup
static void setup() {
    Account account = new Account(Name = 'testAccount');
    insert account;

    Opportunity opp = new Opportunity(
        Name = 'Opportunity',
        CloseDate = System.today().addDays(10),
        StageName = '1 - Discovery',
        AccountId = account.Id
    );
    insert opp;
}
}