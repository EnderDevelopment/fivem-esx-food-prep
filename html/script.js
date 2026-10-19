// Minigame logic
let score = 0;
let timeLeft = 30;
let gameInterval;

// Initialize the minigame
document.addEventListener('DOMContentLoaded', function() {
    const foodItems = document.querySelectorAll('.food-item');
    const timeLeftDisplay = document.getElementById('time-left');
    const scoreDisplay = document.getElementById('score');
    const foodInput = document.getElementById('food-input');
    const submitButton = document.getElementById('submit-food');

    // Start the minigame
    startMinigame();

    // Event listener for food items
    foodItems.forEach(item => {
        item.addEventListener('click', function() {
            if (this.classList.contains('active')) {
                score++;
                scoreDisplay.textContent = score;
                this.classList.remove('active');
            }
        });
    });

    // Event listener for submit button
    submitButton.addEventListener('click', function() {
        const foodName = foodInput.value.trim();
        if (foodName) {
            // Here you would typically send the food name to the server
            console.log(`Food submitted: ${foodName}`);
            foodInput.value = '';
        }
    });
});

// Start the minigame timer
function startMinigame() {
    const foodItems = document.querySelectorAll('.food-item');
    const timeLeftDisplay = document.getElementById('time-left');

    // Reset game state
    score = 0;
    timeLeft = 30;
    timeLeftDisplay.textContent = timeLeft;

    // Start the game interval
    gameInterval = setInterval(function() {
        timeLeft--;
        timeLeftDisplay.textContent = timeLeft;

        // Randomly activate food items
        foodItems.forEach(item => {
            item.classList.remove('active');
            if (Math.random() < 0.3) {
                item.classList.add('active');
            }
        });

        // End the game when time is up
        if (timeLeft <= 0) {
            clearInterval(gameInterval);
            alert(`Game over! Your score: ${score}`);
        }
    }, 1000);
}