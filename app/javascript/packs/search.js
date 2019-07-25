const search = () => {
  const searchForm = document.getElementById("search-form")

  if (searchForm) {
    const searchCategories = document.getElementById("search-categories")

    searchCategories.addEventListener("change", () => {
      searchForm.action = searchCategories.value
    });
  };
};

export { search }
