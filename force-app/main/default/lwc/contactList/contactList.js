import { reduceErrors } from 'c/ldsUtils';
import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import CONTACT_OBJ from '@salesforce/schema/Contact';
import FIELD_FirstName from '@salesforce/schema/Contact.FirstName';
import FIELD_LastName from '@salesforce/schema/Contact.LastName';
import FIELD_Email from '@salesforce/schema/Contact.Email';

const COLUMNS = [
    {label: 'First Name', fieldName: FIELD_FirstName.fieldApiName, type: 'text'},
    {label: 'Last Name', fieldName: FIELD_LastName.fieldApiName, type: 'text'},
    {label: 'Email', fieldName: FIELD_Email.fieldApiName, type: 'email'},
]

export default class ContactList extends LightningElement {

    @wire(getContacts) 
    contacts;

    get errors() {
        return (this.contacts.error) ?
            reduceErrors(this.contacts.error) : [];
    }

    columns = COLUMNS;
}