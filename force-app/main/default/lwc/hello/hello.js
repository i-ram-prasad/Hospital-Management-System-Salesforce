import { LightningElement, track} from 'lwc';

export default class Hello extends LightningElement {
    @track dynamicGreeting = `Ram`;

    greetingChangeHandler(event){
        this.dynamicGreeting = event.target.value;
    }

}