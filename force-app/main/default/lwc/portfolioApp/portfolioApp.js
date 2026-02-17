import { LightningElement,track} from 'lwc';

export default class PortfolioApp extends LightningElement {
    @track view = `home` //`home` | `projects`
    @track activeProject = null; //employee| dashboard| weather

    get isHome(){
        return this.view === `home` && !this.activeProject
    }

    get isProjects(){
        return this.view === `projects` && !this.activeProject;
    }

    get isEmployeeManager(){
        return this.activeProject === `emplouee`;
    }
    get isDashboardApp(){
        return this.activeProject === `dashboard`;
    }
    get isWeatherApp(){
        return this.activeProject === `weather`;
    }

    get homeVariant() { return this.view === 'home' ? 'brand' : 'neutral'; }
    get projectsVariant() { return this.view === 'projects' ? 'brand' : 'neutral'; }

    goHome = () => {
        this.activeProject = null; this.view = `home`;
    }
    goProjects = () => {
        this.activeProject = null; this.view = `projects`;
    }
    handleOpenProject = (event) => {
        this.activeProject = event.detail?.key || null;
    }
    closeProject = () => {
        this.activeProject = null;
        this.view = `projects`;
    }
}