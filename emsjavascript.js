const copyButton = document.getElementById("copyButton");



copyButton.addEventListener("click", () => {

  navigator.clipboard.writeText(copyButton.textContent)

    .then(() => {

      // Optional: Add a visual cue like an alert or a class change to indicate success

      alert("Text copied to clipboard!");

    })

    .catch(err => {

      console.error("Failed to copy text:", err);

    });

});
