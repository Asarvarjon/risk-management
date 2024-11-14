using {riskmanagement as rm} from '../db/schema';

@path: 'service/risk'
service RiskService  @(requires: 'authenticated-user')  {
    entity Risks @(restrict: [
        {
            grant: 'READ',
            to   : 'RiskViewer'
        },
        {
            grant: [
                'READ',
                'WRITE',
                'UPDATE',
                'UPSERT',
                'DELETE'
            ], 
            to   : 'RiskManager'
        }
    ])                      as projection on rm.Risks;

    annotate Risks with @odata.draft.enabled;

    entity Mitigations @(restrict: [
        {
            grant: 'READ',
            to   : 'RiskViewer'
        },
        {
            grant: '*',  
            to   : 'RiskManager'
        }
    ])                      as projection on rm.Mitigations;

    annotate Mitigations with @odata.draft.enabled;
 
    @readonly
    entity BusinessPartners as projection on rm.BusinessPartners;
}