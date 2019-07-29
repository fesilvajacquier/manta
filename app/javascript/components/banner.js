import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["memorable", "meaningful", "funnnnnn"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
