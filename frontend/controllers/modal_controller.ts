import Dialog from "@stimulus-components/dialog";

// Native <dialog> supplies focus trapping and Escape handling; this adds scroll locking.
export default class extends Dialog {
  declare readonly dialogTarget: HTMLDialogElement;

  open() {
    super.open();
    document.body.classList.add("overflow-hidden");
  }

  close() {
    super.close();
    document.body.classList.remove("overflow-hidden");
  }

  disconnect() {
    super.disconnect();
    document.body.classList.remove("overflow-hidden");
  }
}
