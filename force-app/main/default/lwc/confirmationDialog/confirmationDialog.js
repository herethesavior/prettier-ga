import { LightningElement, api } from "lwc";
export default class GwaShowDialogConfirmation extends LightningElement {
  @api title = ""; //modal title
  @api name; //reference name of the component
  @api message = ""; //modal message
  @api confirmLabel = ""; //confirm button label
  @api cancelLabel = ""; //cancel button label
  @api action = ""; //action to be performed on confirm
  @api variant = ""; // confirm button variant
  confirmClick() {
    const confirmEvent = new CustomEvent("confirmation", {
      detail: { action: this.action }
    });
    this.dispatchEvent(confirmEvent);
  }
  closeModal() {
    console.log("closeModal");
    this.dispatchEvent(new CustomEvent("close"));
  }
}
