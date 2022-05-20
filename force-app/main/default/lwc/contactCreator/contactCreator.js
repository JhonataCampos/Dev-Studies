import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CONTACT_OBJ from '@salesforce/schema/Contact';
import FIELD_FirstName from '@salesforce/schema/Contact.FirstName';
import FIELD_LastName from '@salesforce/schema/Contact.LastName';
import FIELD_Email from '@salesforce/schema/Contact.Email';

export default class ContactCreator extends LightningElement {
    
    objectApiName = CONTACT_OBJ.objectApiName;
    fields = [FIELD_FirstName, FIELD_LastName, FIELD_Email];

    handleSuccess(event) {
        const toast = new ShowToastEvent({
            title: 'Salesforce Contact',
            message: event.detail.Id,
            variant: 'success'
        })
        this.dispatchEvent(toast);
    }
}