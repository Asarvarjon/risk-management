using { riskmanagement as my } from '../db/schema';

@path: 'service/items'  
service ItemsService {
    @restrict: [
        {
          grant: 'READ',
          where: 'createdBy = $user.id'
        }
    ]
    entity Items as projection on my.Items;

    function filterItems(quantity: Integer) returns array of Items;
    action createItem(title: String, quantity: Integer) returns Items;
}