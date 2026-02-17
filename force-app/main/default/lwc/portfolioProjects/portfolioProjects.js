import { LightningElement } from 'lwc';

export default class PortfolioProjects extends LightningElement {
     projects = [
    {
      key: 'employee',
      title: 'Employee Manager',
      description: 'CRUD on custom object, datatable, toasts, LDS & Apex.',
      icon: 'standard:employees'
    },
    {
      key: 'dashboard',
      title: 'Sales Dashboard',
      description: 'Chart.js visualizations powered by Apex aggregations.',
      icon: 'standard:dashboard'
    },
    {
      key: 'weather',
      title: 'Weather Integration',
      description: 'REST callout via Apex, JSON parsing, error handling.',
      icon: 'utility:world'
    }
  ];

  handleOpen = (event) => {
    this.dispatchEvent(new CustomEvent('openproject', {
      detail: { key: event.detail.key },
      bubbles: true, composed: true
    }));
  }
}