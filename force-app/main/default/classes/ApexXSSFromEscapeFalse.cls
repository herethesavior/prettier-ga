public with sharing class ApexXSSFromEscapeFalse {
    public ApexXSSFromEscapeFalse() {
        Trigger.new[0].addError(vulnerableHTMLGoesHere, false);
    }
}
