const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const navbarSearch = document.querySelector('.search-navbar')
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbarSearch.classList.add('navbar-scrolled');
        navbar.classList.add('navbar-lewagon-white');
      } else {
        navbarSearch.classList.remove('navbar-scrolled');
        navbar.classList.remove('navbar-lewagon-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
