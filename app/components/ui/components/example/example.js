window.addEventListener("load", () => {
  const examples = document.querySelectorAll('[data-js="example-component"]')
  examples.forEach(example => {
    example.addEventListener("click", function() {
      const danger = example.classList.contains("bg-danger")
      if (danger) {
        example.classList.remove("bg-danger");
        example.classList.add("bg-success");
      } else {
        example.classList.remove("bg-success");
        example.classList.add("bg-danger");
      }
    })
  })
})
