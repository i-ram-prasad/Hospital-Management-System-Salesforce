import { LightningElement } from 'lwc';

export default class DataBinding extends LightningElement {
    userName = 'John Doe';
    currentTime = new Date().toLocaleTimeString();
    subscriberScore = 9;
    totalLationWatched = 50 * 10;
    numberStatus;

    updatememberStatus(event){
        console.log(`Event Target received: ` + event.target);
        console.log(`Event Target received: `+typeof(event.target));
        console.log(`Event Target received: `+ JSON.stringify(event.target));
        
        this.numberStatus = event.target.value;
        
    }

    _minutesWatched = this.totalLationWatched * 10;

    get minutesWatched(){
        return this._minutesWatched;
    }

    set minutesWatched(value){
        console.log("REached at Setter");
        this._minutesWatched = value;
        this._minutesWatched = (value < 1000 ? value : 5000);
    }
    handleWatchChange(event){
        this.minutesWatched = parseInt(event.target.value);
    }
}