import { LightningElement } from 'lwc';

export default class ConditinalRendering extends LightningElement {
    likeStateInverse = false;
    answerStateInverse = false;
    likeStateFilled = false;
    answerStateFilled = false;

    dislaySetting = true;
    displayFirst = false;
    displaySecond = false;
    
    handleOptionClick(){
        this.displayFirst = true;
        this.displaySecond = false;
    }

    handleOptionClick2(){
        this.displaySecond = true;
        this.displayFirst = false;
    }
    handleOption2Click(){
        this.displaySecond = true;
    }

    handleLikeButtonInverseClick() {
        this.likeStateInverse = !this.likeStateInverse;
    }

    handleAnswerButtonInverseClick() {
        this.answerStateInverse = !this.answerStateInverse;
    }

    handleLikeButtonFilledClick() {
        this.likeStateFilled = !this.likeStateFilled;
    }

    handleAnswerButtonFilledClick() {
        this.answerStateFilled = !this.answerStateFilled;
    }
}