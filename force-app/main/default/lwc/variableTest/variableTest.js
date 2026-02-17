import { LightningElement,api } from 'lwc';

export default class VariableTest extends LightningElement {
    // here we can write out public and private variables
    // public variables are accessible from outside the component
    // public vaiable are starts with @api 
    // private variables are accessible only from inside the component
    // public variables are declared with the keyword public
    // private variables are declared with the keyword private
    // public variables are accessible from outside the component
    name = `Ram Prasad`;
    @api fevoriteColor = `Blue`;
}