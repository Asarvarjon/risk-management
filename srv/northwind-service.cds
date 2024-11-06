using { northwind } from './external/northwind'; 
service NorthwindService {
    entity Products as projection on northwind.Products;  

    function callNorthwind() returns array of Products;
    function callOnpremise() returns String;
}
