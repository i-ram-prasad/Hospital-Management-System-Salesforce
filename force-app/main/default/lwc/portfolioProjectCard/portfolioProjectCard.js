import { LightningElement, api} from 'lwc';

export default class PortfolioProjectCard extends LightningElement {
  @api title;
  @api description;
  @api icon = 'custom:custom63';
  @api keyvalue; // project key

  open = () => {
    this.dispatchEvent(new CustomEvent('open', {
      detail: { key: this.keyvalue },
      bubbles: true,
      composed: true
    }));
  }
}