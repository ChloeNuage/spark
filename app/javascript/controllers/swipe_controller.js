import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card", "modal"] // Déclare les cards comme cible

  connect() {
    this.currentIndex = 0; // Initialise l'index à 0
    this.showCard(this.currentIndex); // Affiche la première card au chargement
  }

  // Méthode pour afficher uniquement la card actuelle
  showCard(index) {
    this.cardTargets.forEach((card, i) => {
      card.style.display = i === index ? "block" : "none"; // Affiche ou masque les cards
    });
  }

  // Méthode appelée lors du clic sur "Suivant"
  next() {
    if (this.currentIndex < this.cardTargets.length - 1) {
      this.currentIndex++;
      this.showCard(this.currentIndex);
    } else {
      alert("Il n'y a plus d'animaux près de chez vous !");
    }
  }

  // Méthode appelée lors du clic sur "Précédent"
  back() {
      if (this.currentIndex < this.cardTargets.length - 1) {
        this.currentIndex++;
        this.showCard(this.currentIndex);
      } else {
        alert("Il n'y a plus d'animaux près de chez vous !");
      }
  }

  // Action "Interessé" : déplace la card vers la droite
  interested() {
    const currentCard = this.cardTargets[this.currentIndex];
    currentCard.classList.add("card-swipe-right");

    // Supprime la card après l'animation
    setTimeout(() => {
      currentCard.remove();
      this.showModal(); // Affiche la modale après l'animation
      this.next();
    }, 500); // Durée de l'animation
  }

  // Action "Non interessé" : déplace la card vers la gauche
  notInterested() {
    const currentCard = this.cardTargets[this.currentIndex];
    currentCard.classList.add("card-swipe-left");

    // Supprime la card après l'animation
    setTimeout(() => {
      currentCard.remove();
      this.next();
    }, 500); // Durée de l'animation
  }


  showModal() {
    this.modalTarget.style.display = "block"; // Affiche la modale
  }

  // Masque la modale
  hideModal() {
    this.modalTarget.style.display = "none"; // Masque la modale
  }
}
