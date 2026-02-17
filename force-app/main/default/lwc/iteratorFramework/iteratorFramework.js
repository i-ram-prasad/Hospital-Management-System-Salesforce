import { LightningElement } from 'lwc';

export default class IteratorFramework extends LightningElement {
    taskLIst = [
        {taskId: 1 ,taskName: `Prepare Video Script`, taskPrioty: `High`, taskProgress: `In Progress`},
        {taskId: 2 ,taskName: `Record Tutorial`, taskPrioty: `Medium`, taskProgress: `Pending`},
        {taskId: 3 ,taskName: `Edit and Update`, taskPrioty: `Low`, taskProgress: `Pending`}
    ]
}