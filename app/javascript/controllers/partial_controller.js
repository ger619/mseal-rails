import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["button"];

    connect() {
        this.clearActiveButton();
        this.setActiveButton();
    }

    load(event) {
        event.preventDefault();
        const partial = event.target.dataset.partial;
        const selectedButton = event.target;

        this.clearActiveButton();
        this.setActiveButton(selectedButton);

        fetch(`/partials/${partial}`, {
            headers: {
                "Turbo-Frame": "players-frame",
            },
        });
    }

    clearActiveButton() {
        this.buttonTargets.forEach(button => {
            button.classList.remove("underline", "text-yellow-500");
            button.classList.add("text-white"); // Default text color
        });
    }

    setActiveButton(activeButton = null) {
        const buttonToActivate = activeButton || this.buttonTargets.find(button => button.dataset.id === "all_players"); // Default active button
        buttonToActivate.classList.add("underline", "text-yellow-500");
        buttonToActivate.classList.remove("text-white");
    }
}
